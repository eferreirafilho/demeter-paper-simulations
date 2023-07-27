#!/usr/bin/env python3.8
import random
import copy
import math
import networkx as nx
import matplotlib.pyplot as plt
import pickle
import roslib
import rospy
from nav_msgs.msg import Odometry
from std_msgs.msg import Bool
from time import sleep

# random.seed(15)

class Allocation(object):
    def __init__(self, reallocation):
        self.MAX_BALANCE_DIFFERENCE = 1 # Number of unbalance allowed
        self.MAX_ALLOCATION_ITERATION = 5000
        allocation_processing_time = self.MAX_ALLOCATION_ITERATION/1000
        self.EXECUTE_TIME = 120 - allocation_processing_time # Inspect turbine estimated execute time (Seconds), discounted by allocation processing time

        self.LEAD_TIME = allocation_processing_time # Amount of time allocation may start before high waves have ended (seconds)

        # Weighted sum multi objective optimization
        self.BETA = 500 # Focus on more allocations
        self.ALPHA = 10  # Focus on travelling less
        self.ZETA = 1 # Focus on visiting turbines not visited lately
        rospy.set_param('/goals_allocation/allocating_now', False)
        self.package_path = roslib.packages.get_pkg_dir("demeter_planning")
        self._rate = rospy.Rate(1)
        self.period_of_tides = rospy.get_param('/goal_allocation/period_of_tides')  # assumed to be duration of a single tide        

        self.G_with_only_turbines = self.load_graph_with_only_turbines()
        self.turbines, self.turbines_idx = self.get_turbine_positions(self.G_with_only_turbines)

        rospy.set_param('/goal_allocation/max_allocation_iteration', self.MAX_ALLOCATION_ITERATION)
        try: # Use memory of turbines inspected this ROS run
            self.time_of_turbines_last_inspection = rospy.get_param('/goal_allocation/turbine_inspected')
        except KeyError: # Turbines have not been inspected
            rospy.set_param('/goal_allocation/turbine_inspected', [0]*len(self.turbines_idx)) # Set times to zero if first time allocating
            self.time_of_turbines_last_inspection = [0]*len(self.turbines_idx)

        current_time = rospy.get_rostime().to_sec()
        self.time_of_turbines_last_inspection = [current_time - x for x in self.time_of_turbines_last_inspection]
        rospy.loginfo('How long ago turbines were inspected: ' + str(self.time_of_turbines_last_inspection)) # How long ago a turbine was inspected
        self.number_of_vehicles = self.get_number_of_vehicles()
        self.original_turbines = self.turbines
        if reallocation:
            self.turbines, self.turbines_idx = self._remove_current_dispatched_turbines(self.turbines, self.turbines_idx) # Prevent the current dispatched turbine to be in the allocation
        
        self.reallocation_trigger = False
        rospy.Subscriber("/reallocation_trigger", Bool, self._reallocation_trigger_callback)
        self._update_vehicles_positions()
        
    def _update_vehicles_positions(self):
        self.gazebo_positions = {}
        
        for vehicle in range(self.number_of_vehicles):
            rospy.Subscriber("/auv" + str(vehicle) + "/pose_gt", Odometry, self._pose_callback, vehicle)
        self._wait(2)
        self.vehicles = []
        while len(self.gazebo_positions) != self.number_of_vehicles:
            self._wait(2) # Wait for all robots positions to be acquired
            rospy.logwarn('Wait for all robots positions')
        self.vehicles = [self.gazebo_positions[key] for key in sorted(self.gazebo_positions.keys())]
        self._wait(1)
                
    def load_graph_with_only_turbines(self):
        '''Load precomputed Roadmap based on visibility graphs with only turbines'''
        with open(self.package_path + "/params/scaled_visibility_G_only_with_turbines.pickle", "rb") as f:
            G_with_only_turbines = pickle.load(f, encoding='latin1')
            return G_with_only_turbines
        
    def get_number_of_vehicles(self):
        vehicles_idx = rospy.get_param("/goal_allocation/vehicle_idx")
        return len(vehicles_idx)
    
    def _pose_callback(self, msg, vehicle):
        self.gazebo_positions[vehicle] = [msg.pose.pose.position.x, msg.pose.pose.position.y]
        
    def _wait(self, n_rate):
        for _ in range(n_rate):
            self._rate.sleep()
            
    def _reallocation_trigger_callback(self, msg):
        self.reallocation_trigger = msg.data
    
    def _remove_current_dispatched_turbines(self, all_turbines_to_be_allocated, all_turbines_to_be_allocated_idx):
        for vehicle_idx in range(self.number_of_vehicles):
            param_name = "/auv" + str(vehicle_idx) + "/goals_allocated"
            rospy.loginfo(f'Checking parameter: {param_name}')
            # Check if the parameter exists
            if rospy.has_param(param_name):
                # Get the list of goals allocated to the current vehicle
                goals_allocated = rospy.get_param(param_name)
                rospy.loginfo(f'Goals allocated for vehicle {vehicle_idx}: {goals_allocated}')
                # If there are any goals allocated, remove the first goal
                if goals_allocated:
                    goal_to_remove = goals_allocated[0]
                    rospy.loginfo(f'Goal to remove for vehicle {vehicle_idx}: {goal_to_remove}')
                    # Check if this goal is in the turbine list, and if so, remove it
                    if goal_to_remove in all_turbines_to_be_allocated_idx:
                        remove_idx = all_turbines_to_be_allocated_idx.index(goal_to_remove)
                        all_turbines_to_be_allocated.pop(remove_idx)
                        all_turbines_to_be_allocated_idx.pop(remove_idx)
                    else:
                        rospy.loginfo(f'Goal {goal_to_remove} not found in the turbine list.')
            else:
                rospy.loginfo(f'Parameter {param_name} does not exist.')

        return all_turbines_to_be_allocated, all_turbines_to_be_allocated_idx
                
    def get_turbine_positions(self, G_visibility):
        '''Get the nodes that are turbines (there are also and corners nodes in the graph)'''
        turbines = []
        turbines_idx = []
        for i in range(G_visibility.number_of_nodes()):
            if G_visibility.nodes[i]['description'] == 'turbine':
                x = G_visibility.nodes[i]['pos'][0]
                y = G_visibility.nodes[i]['pos'][1]
                turbines.append([float(x), float(y)])
                turbines_idx.append(G_visibility.nodes[i]['related_to'])
        return turbines, turbines_idx

    def euclidean_distance(self, coord1, coord2):
        return ((coord1[0] - coord2[0]) ** 2 + (coord1[1] - coord2[1]) ** 2) ** 0.5

    def graph_distance(self, G, node1, node2):
        '''Shortest path between two turbine nodes through the roadmap (visibility based graph)'''
        # Compute shortest path between node1 and node2 using Dijkstra's algorithm
        shortest_path = nx.shortest_path(G, node1, node2, weight='weight')
        # Compute total distance along the shortest path
        total_distance = sum(G.get_edge_data(shortest_path[i], shortest_path[i+1])['weight'] for i in range(len(shortest_path)-1))
        return total_distance

    def create_turbine_graph(self, G_visibility):
        '''Create graph with only turbines and distances based on shortest paths between turbines'''
        G_turbines = nx.Graph()
        for turbine_i in self.turbines_idx:
            for turbine_j in self.turbines_idx:
                if turbine_i != turbine_j:
                    dist = self.graph_distance(G_visibility, turbine_i, turbine_j)
                    G_turbines.add_edge(turbine_i, turbine_j, weight = dist)
                    G_turbines.add_edge(turbine_j, turbine_i, weight = dist)     
        return G_turbines

    def plot_graph(self, G, nodes):
        pos_dict = {i: nodes[i] for i in range(len(nodes))}
        nx.draw(G, pos = pos_dict, with_labels = True)
        plt.show()
        
    def distance_vehicles_to_graph_nodes(self, graph):
        '''Compute the minimum distance from each vehicle to any node in the graph, along with the index of the closest node'''
        distance_vehicle_to_graph = []
        closer_node = []
        for vehicle in self.vehicles:
            distances = [(self.euclidean_distance(vehicle, graph.nodes[node]['pos']), node) for node in graph.nodes()]
            min_dist, closest_node = min(distances, key=lambda x: x[0])
            distance_vehicle_to_graph.append(min_dist)
            closer_node.append(closest_node)
        return distance_vehicle_to_graph, closer_node
    
    def distance_point_to_segment(self, p, a, b):
        '''Compute the Euclidean distance from point p to the line segment from a to b'''
        ab = [b[i] - a[i] for i in range(len(a))]
        ap = [p[i] - a[i] for i in range(len(a))]
        t = sum(i*j for i, j in zip(ap, ab)) / sum(i*i for i in ab)
        if t <= 0:
            return self.euclidean_distance(p, a)
        elif t >= 1:
            return self.euclidean_distance(p, b)
        # projection point falls within the line segment
        projection = [a[i] + t*ab[i] for i in range(len(a))]
        return self.euclidean_distance(p, projection)

    def distance_vehicles_to_graph(self, graph):
        '''Compute the minimum distance from each vehicle to any edge in the graph, along with the index of the closest edge'''
        distance_vehicle_to_graph = []
        closer_edge = []
        for vehicle in self.vehicles:
            distances = [(self.distance_point_to_segment(vehicle, graph.nodes[edge[0]]['pos'], graph.nodes[edge[1]]['pos']), edge) for edge in graph.edges()]
            min_dist, closest_edge = min(distances, key=lambda x: x[0])
            distance_vehicle_to_graph.append(min_dist)
            closer_edge.append(closest_edge)
        return distance_vehicle_to_graph, closer_edge
    
    def check_if_first_allocation(self):
        first_allocation = True
        if rospy.has_param('/goals_allocation/global_allocation'):
            rospy.logwarn('NOT FIRST ALLOCATION')
            first_allocation = False
        return first_allocation
    
    def random_allocation(self):
        '''Each turbine is randonly allocated for one random robot or not allocated''' 
        allocation = [[] for _ in range(len(self.vehicles))]  # Initialize an empty allocation for each robot
        for turbine in self.turbines_idx:
            if random.choice([True, False]):  # Randomly decide whether to allocate the turbine or not
                robot_index = random.randint(0, len(self.vehicles) - 1)  # Choose a random robot index
                allocation[robot_index].append(turbine)  # Add the turbine to the allocated list of the chosen robot
        return allocation

    def calculate_balance_score(self, allocation):
        '''Compute the maximum difference between allocations'''
        alloc_size = [len(alloc) for alloc in allocation]
        max_size = max(alloc_size)
        min_size = min(alloc_size)
        balance_score = max_size-min_size
        return balance_score


    def add_element_to_sublist(self, main_list, sublist_list):
        all_elements_in_sublists = [item for sublist in sublist_list for item in sublist]
        elements_not_in_sublists = [element for element in main_list if element not in all_elements_in_sublists]
        if not elements_not_in_sublists:
            return sublist_list
        element = random.choice(elements_not_in_sublists)
        chosen_sublist = random.choice(sublist_list)
        chosen_sublist.append(element)
        return sublist_list
    
    def remove_element_from_sublist(self, sublist_list):
        sublists_with_elements = [sublist for sublist in sublist_list if sublist]
        if sublists_with_elements:
            chosen_sublist = random.choice(sublists_with_elements)
            element = random.choice(chosen_sublist)
            chosen_sublist.remove(element)
        return sublist_list
    
    def get_neighbour_solution(self, solution):
        '''Add or remove a allocation of a vehicle to a turbine'''
        if random.random()>0.5:
            solution = self.add_element_to_sublist(self.turbines_idx, solution)
        else:
            solution = self.remove_element_from_sublist(solution)
        return solution
        
    def sigmoid(self, cost_diff, k=1):
        return 1 / (1 + math.exp(-k * cost_diff))
        
    def acceptance_probability(self, old_cost, new_cost, temperature):
        cost_diff = old_cost - new_cost
        acceptance_ratio = self.sigmoid(cost_diff)
        acceptance_probability = math.exp(-acceptance_ratio / temperature)
        return acceptance_probability if acceptance_probability > random.random() else 0
            
    def compute_next_time_window(self):
        self.period_of_tides = rospy.get_param('/goal_allocation/period_of_tides')  # assumed to be duration of a single tide
        number_of_tides_until_next_high_waves = rospy.get_param('/goal_allocation/number_of_tides_until_next_high_waves')
        number_of_tides_duration_high_waves = rospy.get_param('/goal_allocation/number_of_tides_duration_high_waves')
        current_time = rospy.get_rostime().to_sec()
        time_since_start_of_current_cycle = current_time % (self.period_of_tides * (number_of_tides_until_next_high_waves + number_of_tides_duration_high_waves))
        high_waves_start_time = self.period_of_tides * number_of_tides_until_next_high_waves
        high_waves_end_time = self.period_of_tides * (number_of_tides_until_next_high_waves + number_of_tides_duration_high_waves)
    
        while high_waves_start_time < time_since_start_of_current_cycle < high_waves_end_time - self.LEAD_TIME: 
            rospy.loginfo_throttle(5,'We are in highs waves now, wait. Time to end high waves: ' + str(int(high_waves_end_time - time_since_start_of_current_cycle)) + ' seconds')
            current_time = rospy.get_rostime().to_sec()
            time_since_start_of_current_cycle = current_time % (self.period_of_tides * (number_of_tides_until_next_high_waves + number_of_tides_duration_high_waves))
            self.set_solution_to_ros_param([[] for _ in range(self.number_of_vehicles)])    

        # We are currently not in a high wave or in the lead time before a high wave ends
        time_window = self.period_of_tides * number_of_tides_until_next_high_waves - time_since_start_of_current_cycle
        # rospy.loginfo('Not in high waves. Time to next: ' + str(int(time_window)) + ' seconds')
        
        # We are currently in lead time
        if time_window < 0:
            time_window = self.period_of_tides * number_of_tides_until_next_high_waves + self.period_of_tides + time_window
            
        return time_window
        
    def objective_function(self, solution):
        '''For each allocated turbines, consider the cost of travelling to that turbine plus the time it takes to inspect that turbine
        Also penalizes unbalanced allocations and forbid solutions that passes the allowed time window'''
        # Penalty if balance between allocations and vehicles is too big
        balanced = self.calculate_balance_score(solution)
        if balanced > self.MAX_BALANCE_DIFFERENCE:
            return -float('Inf')
        max_time = 0  # Maximum time a vehicle takes
        distance_vehicle_to_graph, closer_node = self.distance_vehicles_to_graph_nodes(self.G_with_only_turbines)
        total_distance = 0
        for vehicle_idx, vehicle in enumerate(solution):
            time = 0 
            distance = 0
            for turbine_order_individual_vehicle, turbine in enumerate(vehicle):
                if turbine_order_individual_vehicle == 0:
                    distance = distance_vehicle_to_graph[vehicle_idx]
                    distance += self.graph_distance(self.G_with_only_turbines, closer_node[vehicle_idx], turbine)
                    time += distance + self.EXECUTE_TIME# Assume that the time it takes to travel equals the distance
                else:
                    travel_time = self.graph_distance(self.G_with_only_turbines, previous_turbine, turbine)
                    distance += travel_time
                    time += travel_time + self.EXECUTE_TIME  # Add inspection time
                previous_turbine = turbine
                total_distance += distance
            if time > max_time:  # Only update max_time if the current vehicle took longer
                max_time = time
        
        # Penalty if total time exceeds the limit 
        if max_time > self.time_window:
            return -float('Inf') 
        
        turbines_last_inspection = 0
        for individual_solution in solution:
            for allocated_turbine in individual_solution:
                turbines_last_inspection += self.time_of_turbines_last_inspection[allocated_turbine]
        total_allocations = sum(len(sublist) for sublist in solution)
        cost = self.ALPHA*total_distance - self.BETA*total_allocations - self.ZETA*turbines_last_inspection
        
        return float(-cost)

    def simulated_annealing(self):
        rospy.set_param('/goals_allocation/allocating_now', True)
        self.time_window = self.compute_next_time_window()
        rospy.loginfo('Next High wave event in: ' + str(int(self.time_window)) + ' seconds')
        if int(self.time_window) < 0:    
            return self.empty_solution(), self.inf_cost()
        
        INITIAL_TEMPERATURE = 1000
        COOLING_RATE = 0.999
        REHEATING_TEMPERATURE = 1
        # Generate an initial random solution
        current_solution = self.random_allocation()
        best_solution = current_solution
        current_cost = self.objective_function(current_solution)
        best_cost = current_cost
        
        # rospy.loginfo(f'solution: {current_solution} cost: {current_cost}')
        reheated = 0

        temperature = INITIAL_TEMPERATURE
        for iteration in range(self.MAX_ALLOCATION_ITERATION):
        
        # while self.reallocation_trigger == False:
            
            # Create a neighboring solution by randonly adding or remove an vehicle-> turbine allocation or perturb the system with a new random solution
            new_solution = random.choice([self.get_neighbour_solution(current_solution), self.random_allocation()])
            # new_solution = self.get_neighbour_solution(current_solution)
            new_cost = self.objective_function(new_solution)

            if new_cost > current_cost or self.acceptance_probability(current_cost, new_cost, temperature) > random.random():
                current_solution = new_solution
                current_cost = new_cost

            if new_cost > best_cost:
                best_solution = copy.deepcopy(new_solution)
                best_cost = self.objective_function(best_solution)
                # rospy.loginfo(f'Iter: {iteration} Best solution: {best_solution} Best cost: {best_cost}')            
                # rospy.logwarn(f'Temp: {temperature}')  
     
            temperature *= COOLING_RATE
            
            # Reheating            
            if temperature < REHEATING_TEMPERATURE:
                temperature = INITIAL_TEMPERATURE*(2 ** reheated)
                reheated+=1
                current_solution = self.random_allocation() # generate a new random solution
                current_cost = self.objective_function(current_solution)
                # rospy.loginfo(f'Reheated, new initial temperature: {temperature}')  
                
        if best_cost < 0:    
            return self.empty_solution(), self.inf_cost()
        
        rospy.set_param('/goals_allocation/allocating_now', False)
        return best_solution, best_cost

    def empty_solution(self):
        empty_solution =  [[] for _ in range(len(self.vehicles))]
        return empty_solution
    
    def inf_cost(self):
        best_cost = -float('Inf') 
        return best_cost
    
    def get_solution_from_ros_param(self):
        current_individual_allocation = []
        current_global_allocation = []
        for idx, _ in enumerate(self.vehicles):
            current_individual_allocation.append(rospy.get_param('auv' + str(idx) + '/goals_allocated'))
        current_global_allocation = rospy.get_param('/goals_allocation/global_allocation')
        return current_individual_allocation, current_global_allocation

    def set_solution_to_ros_param(self, allocation):
        for idx, _ in enumerate(self.vehicles):
            rospy.set_param('/auv' + str(idx) + '/goals_allocated', allocation[idx])
        rospy.logwarn_throttle(10, 'Solution /goals_allocated/allocation: ' + str(allocation))
        rospy.set_param('/goals_allocation/global_allocation', allocation)
    
if __name__ == '__main__':
      
    rospy.init_node('goal_allocation', anonymous=True)

    # First allocation
    reallocation = False
    goal_allocation = Allocation(reallocation)
    best_solution, best_cost = goal_allocation.simulated_annealing()
    rospy.loginfo(f'Last Best solution: {best_solution} Best cost: {best_cost}')
    goal_allocation.set_solution_to_ros_param(best_solution) # send solution to be executed

    # Reallocation (disregard current dispatch)
    while not rospy.is_shutdown():        
        while goal_allocation.reallocation_trigger == True:
            reallocation = True
            goal_allocation = None
            goal_allocation = Allocation(reallocation)
            best_solution, best_cost = goal_allocation.simulated_annealing()
            rospy.loginfo(f'Last Best solution: {best_solution} Best cost: {best_cost}')
            goal_allocation.get_solution_from_ros_param()
            current_individual_allocation, current_global_allocation = goal_allocation.get_solution_from_ros_param()
            for idx, _ in enumerate(goal_allocation.vehicles):
                if len(current_individual_allocation[idx]) < 1:
                    rospy.loginfo('Add all new allocation to auv' + str(idx))
                else: # send solution to be executed preserving first allocated goal
                    rospy.loginfo('keep only first allocation: ' + str(current_individual_allocation[idx][0]))
                    first_individual_allocation = current_individual_allocation[idx][0]
                    best_solution[idx].insert(0, first_individual_allocation)
            goal_allocation.set_solution_to_ros_param(best_solution) # send solution to be executed
            
            sleep(1)
            rospy.logwarn(f'Reallocation triggered: {goal_allocation.reallocation_trigger}')
            if rospy.is_shutdown():
                break
            # Reset the trigger
            goal_allocation.reallocation_trigger = False
        sleep(1)
    goal_allocation = None
    rospy.spin()  
