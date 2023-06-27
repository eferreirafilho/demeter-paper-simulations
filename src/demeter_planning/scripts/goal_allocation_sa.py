#!/usr/bin/env python3.8
import random
import copy
import math
import networkx as nx
import matplotlib.pyplot as plt
import pickle
import roslib
from rospkg import RosPack
import re
import rospy
from nav_msgs.msg import Odometry

# random.seed(15)
TIME_WINDOW =  100 # Time limit (Hours) - Next high waves
EXECUTE_TIME = 4 # Inspect turbine estimated execute time (Hours)
# START_TIME = 0 # Hours (0-12 - inside the rule of twelves)
# SAFE_SUBMERGE_WINDOW = 4 # Hours (amount of safe hours inside a 12 hour windows - rule of twelves)
MAX_MISSION_DIFFERENCE = 1 # Number of unbalance allowed
TURBINE_PERCENTAGE = 100 # in percentage % of turbines to keep
# Weighted sum multi objective optimization
BETA = 10000 # Focus on more allocations
ALPHA = 0.1  # Focus on travelling less distances
GAMMA = 100 # Focused on balanced robots
        
class Allocation(object):
    def __init__(self, turbines_to_be_allocated):
        self.package_path = roslib.packages.get_pkg_dir("demeter_planning")
        self._rate = rospy.Rate(10)

        self.G_with_only_turbines = self.load_graph_with_only_turbines()
        all_turbines, all_turbines_idx = self.get_turbine_positions(self.G_with_only_turbines)

        rospy.logwarn('all_turbines: ' + str(all_turbines_idx))

        all_turbines_to_be_allocated = [all_turbines[i] for i in turbines_to_be_allocated]
        all_turbines_to_be_allocated_idx = [all_turbines_idx[i] for i in turbines_to_be_allocated]
        
        rospy.logwarn('Turbines to be allocated: ' + str(all_turbines_to_be_allocated))
        current_time = rospy.get_rostime().to_sec()
        try:
            param_time_of_turbines_last_inspection = rospy.get_param('/goal_allocation/turbine_inspected')
        except KeyError:
            # param_time_of_turbines_last_inspection = [0] * len(self.turbines)
            #TODO check ('/goal_allocation/turbine_inspected parameter
            param_time_of_turbines_last_inspection = [random.randint(0, 20) for _ in range(len(all_turbines_idx))]
            rospy.set_param('/goal_allocation/turbine_inspected', param_time_of_turbines_last_inspection) # Set times to zero if first time allocating

        param_time_of_turbines_last_inspection = param_time_of_turbines_last_inspection[0:len(all_turbines_to_be_allocated)] # get only parameters from turbines being used
        rospy.logwarn('param_time_of_turbines_last_inspection: ' + str(param_time_of_turbines_last_inspection))
        self.time_of_turbines_last_inspection = [current_time - x for x in param_time_of_turbines_last_inspection]
        rospy.logwarn('How long ago a turbine was inspected: ' + str(self.time_of_turbines_last_inspection)) # How long ago a turbine was inspected
        
        self.number_of_vehicles = self.get_number_of_vehicles()
        self.original_turbines = all_turbines_to_be_allocated
        self.turbines, self.turbines_idx = self.remove_turbines_visited_lately(all_turbines_to_be_allocated, all_turbines_to_be_allocated_idx)
        rospy.logwarn('after removing turbines: ')
        rospy.logwarn(self.turbines)
        rospy.logwarn(self.turbines_idx)
        
        self.gazebo_positions = {}
        
        for vehicle in range(self.number_of_vehicles):
            rospy.Subscriber("/auv" + str(vehicle) + "/pose_gt", Odometry, self.pose_callback, vehicle)
        self._wait(2)
        self.vehicles = []
        while len(self.gazebo_positions) != self.number_of_vehicles:
            self._wait(2) # Wait for all robots positions to be acquired
            
        rospy.logwarn('GAZEBO POS: ' + str(self.gazebo_positions))
        self.vehicles = [self.gazebo_positions[key] for key in sorted(self.gazebo_positions.keys())]
        self._wait(1)

        # vehicles = [[50, 60], [-30, 40]]
        # self.vehicles = [[50, 60], [-30, 40], [20, -30]]
        # vehicles = [[50, 60]]
        rospy.logwarn('VEHICLES: ' + str(self.vehicles))
    
    def load_graph_with_only_turbines(self):
        '''Load precomputed Roadmap based on visibility graphs with only turbines'''
        with open(self.package_path + "/params/scaled_visibility_G_only_with_turbines.pickle", "rb") as f:
            G_with_only_turbines = pickle.load(f, encoding='latin1')
            return G_with_only_turbines
        
    def get_number_of_vehicles(self):
        vehicles_idx = rospy.get_param("/goal_allocation/vehicle_idx")
        return len(vehicles_idx)
    
    def pose_callback(self, msg, vehicle):
        self.gazebo_positions[vehicle] = [msg.pose.pose.position.x, msg.pose.pose.position.y]
        
    def _wait(self, n_rate):
        for _ in range(n_rate):
            self._rate.sleep()
            
    def remove_turbines_visited_lately(self, all_turbines_to_be_allocated, all_turbines_to_be_allocated_idx):
    
        threshold = int(len(self.time_of_turbines_last_inspection) * TURBINE_PERCENTAGE/100) # Number of turbines to keep
        threshold = max(threshold, self.number_of_vehicles)
        items = list(zip(all_turbines_to_be_allocated_idx, self.time_of_turbines_last_inspection))
        
        sorted_items = sorted(items, key=lambda x: x[1])
        lowest_items = sorted_items[:threshold]
        
        lowest_indexes, lowest_values = map(list, zip(*lowest_items))
        
        filtered_turbines = [all_turbines_to_be_allocated[all_turbines_to_be_allocated_idx.index(i)] for i in lowest_indexes]
        filtered_indexes = [all_turbines_to_be_allocated_idx[all_turbines_to_be_allocated_idx.index(i)] for i in lowest_indexes]

        return filtered_turbines, filtered_indexes
                
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
        # vector from a to b
        ab = [b[i] - a[i] for i in range(len(a))]
        # vector from a to p
        ap = [p[i] - a[i] for i in range(len(a))]

        # scalar of ab that's closest to p
        t = sum(i*j for i, j in zip(ap, ab)) / sum(i*i for i in ab)

        if t <= 0:
            # closer to a
            return self.euclidean_distance(p, a)
        elif t >= 1:
            # closer to b
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
        if rospy.has_param('/goals_allocated/allocation'):
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
        # Find the number of elements in each list in the allocation
        alloc_size = [len(alloc) for alloc in allocation]
        max_size = max(alloc_size)
        min_size = min(alloc_size)

        # Calculate the balance score
        balance_score = 1/(0.1+(max_size - min_size)) #0.1 to shift values and not divide by zero in edge cases

        return balance_score

    def objective_function(self, solution):
        '''For each allocated turbines, consider the cost of travelling to that turbine plus the time it takes to inspect that turbine
        Also penalizes unbalanced allocations and forbid solutions that passes the allowed time window'''

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
                    time += distance + EXECUTE_TIME# Assume that the time it takes to travel equals the distance
                else:
                    travel_time = self.graph_distance(self.G_with_only_turbines, previous_turbine, turbine)
                    distance += travel_time
                    time += travel_time + EXECUTE_TIME  # Add inspection time
                previous_turbine = turbine
                total_distance += distance
            if time > max_time:  # Only update max_time if the current vehicle took longer
                max_time = time
        total_allocations = sum(len(sublist) for sublist in solution)
        
        balanced = self.calculate_balance_score(solution)

        DELTA = float('Inf') if max_time > TIME_WINDOW else 0  # Penalty if total time exceeds the limit 
        # if max_time < TIME_WINDOW:
        # rospy.logwarn('Max Time: ' + str(max_time))
        # rospy.logwarn('Total distance: ' + str(total_distance))
        # rospy.logwarn('Total allocations: ' + str(total_allocations))
        # rospy.logwarn('Time: ' + str(time))
        # # rospy.logwarn('Travel time: ' + str(travel_time))
        # rospy.logwarn('Distance: ' + str(distance))
        
        
        cost = -ALPHA*total_distance + BETA*total_allocations + GAMMA*balanced - DELTA*max_time 
        
        # rospy.loginfo(10, 'total distance: %s balance score: %s total allocations: %s max time: %s best cost: %s', 
                    #    str(total_distance), str(balanced), str(total_allocations), str(max_time), str(cost))
        
        return cost

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
        # solution = random.choice(self.remove_element_from_sublist(solution))
        # rospy.logwarn('old solution')
        # rospy.logwarn(solution)
        if random.random()>0.5:
            solution = self.add_element_to_sublist(self.turbines_idx, solution)
            # rospy.logwarn('ADD')
        else:
            solution = self.remove_element_from_sublist(solution)
            # rospy.logwarn('REMOVE')
        # solution = random.choice([self.add_element_to_sublist(self.turbines_idx, solution), self.remove_element_from_sublist(solution)])
        # rospy.logwarn('new solution')
        # rospy.logwarn(solution)
        return solution
        
    def sigmoid(self, scaled_cost_diff, k=1):
        return 1 / (1 + math.exp(-k * scaled_cost_diff))
        
    def acceptance_probability(self, old_cost, new_cost, temperature):
        cost_diff = old_cost - new_cost
        scaled_cost_diff = cost_diff / BETA
        acceptance_ratio = self.sigmoid(scaled_cost_diff)
        acceptance_probability = math.exp(-acceptance_ratio / temperature)
        return acceptance_probability if acceptance_probability > random.random() else 0
        
    def simulated_annealing(self):
        MAX_ITERATIONS = 100
        INITIAL_TEMPERATURE = 1000
        COOLING_RATE = 0.999
        
        # Generate an initial random solution
        current_solution = self.random_allocation()
        best_solution = current_solution
        current_cost = self.objective_function(current_solution)
        best_cost = current_cost
        
        rospy.logwarn(f'solution: {current_solution} cost: {current_cost}')

        temperature = INITIAL_TEMPERATURE
        # for iteration in range(MAX_ITERATIONS):
        iteration = 1 
        while True:
            # Create a neighboring solution by randonly adding or remove an vehicle-> turbine allocation or perturb the system with a new random solution
            new_solution = random.choice([self.get_neighbour_solution(current_solution), self.random_allocation()])
            # new_solution = self.get_neighbour_solution(current_solution)
            new_cost = self.objective_function(new_solution)

            if new_cost > current_cost or self.acceptance_probability(current_cost, new_cost, temperature) > random.random():
                current_solution = new_solution
                current_cost = new_cost

            rospy.logwarn_throttle(5, f'Iter: {iteration} New solution: {new_solution} New cost: {new_cost}')

            if new_cost > best_cost:
                best_solution = copy.deepcopy(new_solution)
                best_cost = self.objective_function(best_solution)
                goal_allocation.set_solution_to_ros_param(best_solution) # send solution to be executed
                rospy.logwarn(f'Iter: {iteration} Best solution: {best_solution} Best cost: {best_cost}')
            
            temperature *= COOLING_RATE
            
            iteration+=1
            
            # print("Best solution:", best_solution)
            # print("Best cost:", best_cost)
            # print("temp:", temperature)
           
        print("Best solution:", best_solution)
        print("Best cost:", best_cost)
        return best_solution, best_cost

    def plot_allocation(self, solution_G, allocation):
        color_list = ['red', 'blue', 'gray', 'orange', 'purple', 'brown', 'pink', 'green', 'olive', 'cyan']
        self.set_of_all_vehicles = range(len(self.vehicles))
        pattern = r'\d+'
        # plot the graph
        pos = self.turbines + self.vehicles
        # create a dictionary to map vehicle numbers to colors
        vehicle_colors = {k: v for k, v in zip(range(len(self.set_of_all_vehicles)), color_list)}

        fig, ax = plt.subplots()
        # create a list of edge colors based on the vehicle that travels on each edge
        edge_colors = [vehicle_colors[int(re.findall(pattern, label)[0])] for _, _, label in solution_G.edges(data='label')]
        nx.draw_networkx_edges(solution_G, pos, width=1, alpha=0.8, edge_color=edge_colors)
        nx.draw_networkx_edge_labels(solution_G, pos, edge_labels=nx.get_edge_attributes(solution_G, 'label'), font_size=8)

        for vehicle_idx, vehicle_allocation in enumerate(allocation):
            for turbine in vehicle_allocation:
                ax.scatter(self.original_turbines[turbine][0], self.original_turbines[turbine][1], color = vehicle_colors[vehicle_idx])
        plt.axis('off')
        plt.show()

    def set_solution_to_ros_param(self, allocation):
        for idx, vehicle in enumerate(self.vehicles):
            # for turbine in allocation[vehicle]:
            rospy.logwarn('Set to param: auv' + str(idx) + '/goals_allocated' + str(allocation[idx]))
            rospy.set_param('auv' + str(idx) + '/goals_allocated', allocation[idx])
        rospy.set_param('/goals_allocated/allocation', allocation)
    
if __name__ == '__main__':
      
    rospy.init_node('goal_allocation', anonymous=True)
    rospy.spin
    
    
    turbines_to_be_allocated = [0, 1, 2, 3, 4, 5, 8, 10, 14]
    
    goal_allocation = Allocation(turbines_to_be_allocated)


    best_solution, best_cost = goal_allocation.simulated_annealing()

    # milp = goal_allocation.create_milp
    # allocation, solution_G = goal_allocation.solve_milp(milp)
    
    # print(allocation)
    # goal_allocation.set_solution_to_ros_param(best_solution)
    # goal_allocation.plot_allocation(solution_G, allocation)
    rospy.spin()    
    