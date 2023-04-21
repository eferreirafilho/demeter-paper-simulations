#!/usr/bin/env python
import random
import networkx as nx
import matplotlib.pyplot as plt
import pickle
import roslib
from rospkg import RosPack
import pulp
import re
import rospy

random.seed(15)
TIME_WINDOW = 22 # Time limit
EXECUTE_TIME = 10 # Inspect turbine estimated execute time
SOLVER_LIMIT_TIME = 10 # Seconds

class Allocation(object):
    def __init__(self):
        self.package_path = roslib.packages.get_pkg_dir("demeter_planning")
        G_visibility = self.load_graph()
        self.turbines, self.turbines_idx = self.get_turbine_positions(G_visibility)
        
        # vehicles = [[50, 60], [-30, 40]]
        self.vehicles = [[50, 60], [-30, 40], [20, -30]]
        # vehicles = [[50, 60]]
   
        self.G_milp = self.add_vehicles_to_graph(G_visibility)

        self.set_of_all_vehicles = range(len(self.vehicles))
        self.set_of_all_turbines = range(len(self.turbines))
        self.set_of_all_nodes = range(len(self.G_milp.nodes()))
        self.set_of_all_starting_nodes = [x for x in self.set_of_all_nodes if x not in self.set_of_all_turbines]
        # self.time_of_turbines_last_inspection = [random.uniform(1, 100) for _ in range(len(turbines))]
        #TODO: get real last time values:
        self.time_of_turbines_last_inspection = range(len(self.turbines)) # How long ago a turbine was inspected

    def load_graph(self):
        '''Load precomputed Roadmaps based on visibility graphs'''
        with open(self.package_path + "/params/scaled_visibility_G_with_turbines.pickle", "rb") as f:
            G_visibility = pickle.load(f)
            return G_visibility

    def get_turbine_positions(self, G_visibility):
        '''Get the nodes that are turbines (there is also countor-point nodes and corners nodes)'''
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
        print('G.nodes()')
        print(G.nodes())
        print(node1)
        print(node2)
        shortest_path = nx.shortest_path(G, node1, node2, weight='weight')
        # Compute total distance along the shortest path
        total_distance = sum(G.get_edge_data(shortest_path[i], shortest_path[i+1])['weight'] for i in range(len(shortest_path)-1))
        print(total_distance)
        return total_distance

    def create_turbine_graph(self, G_visibility):
        '''Create graph with only turbines and distances based on shortest paths'''
        G_milp = nx.Graph()
        print("--------------------------------")
        print(self.turbines_idx)
        print(G_milp.nodes())
        print('G.nodes()')
        print(G_visibility.nodes())
        for turbine_i in self.turbines_idx:
            for turbine_j in self.turbines_idx:
                print(turbine_i)
                dist = self.graph_distance(G_visibility, turbine_i, turbine_j)
                print(dist)
                G_milp.add_edge(turbine_i, turbine_j, weight = dist)
                G_milp.add_edge(turbine_j, turbine_i, weight = dist)
        return G_milp

    def plot_graph(self, G, nodes):
        pos_dict = {i: nodes[i] for i in range(len(nodes))}
        nx.draw(G, pos = pos_dict, with_labels = True)
        plt.show()

    def add_vehicles_to_graph(self, G_visibility):
        '''Add edges between vehicles current position and roadmap'''
        G_mtsp = self.create_turbine_graph(G_visibility)
        print('G_mtsp.nodes()')
        print(G_mtsp.nodes())
            
        # Initialize closer_node list
        closer_node = [None] * len(self.vehicles)

        # Find closest node for each vehicle and add it to closer_node
        for v_idx, vehicle in enumerate(self.vehicles):
            min_dist = float('inf')
            for n_idx, node in enumerate(G_mtsp.nodes()):
                dist = self.euclidean_distance(vehicle, self.turbines[n_idx])
                print(dist)
                if dist < min_dist:
                    min_dist = dist
                    closer_node[v_idx] = n_idx

        # Add nodes for each vehicle to G_mtsp
        vehicle_nodes = []
        for vehicle in self.vehicles:
            node_idx = G_mtsp.number_of_nodes()
            G_mtsp.add_node(node_idx, pos=vehicle)
            vehicle_nodes.append(node_idx)

        print('closer_node')
        print(closer_node)
        # Add edges from vehicle nodes to their closest turbines and back
        for v_idx, n_idx in enumerate(closer_node):
            print('v_idx:' + str(v_idx))
            print('n_idx:' + str(n_idx))
            G_mtsp.add_edge(vehicle_nodes[v_idx], n_idx, weight = self.euclidean_distance(self.vehicles[v_idx], self.turbines[n_idx]))
            G_mtsp.add_edge(n_idx, vehicle_nodes[v_idx], weight = self.euclidean_distance(self.vehicles[v_idx], self.turbines[n_idx]))

        # Plot graph with nodes for turbines and vehicles
        # plot_graph(G_mtsp, node_pos)
        return G_mtsp
        
    def create_milp(self):

        print(self.time_of_turbines_last_inspection)
        
        problem = pulp.LpProblem("GoalAllocation", pulp.LpMaximize)
        
        # xijk - binary variable, i if vehicle k travels from node i to node j, 0 otherwise
        x = pulp.LpVariable.dicts("x", ((i, j, k) for i in self.set_of_all_nodes for j in self.set_of_all_nodes for k in self.set_of_all_vehicles if i != j), cat="Binary")

        # yik - binary variable, i if vehicle k is assigned to mission in turbine i, 0 otherwise
        y = pulp.LpVariable.dicts("y", ((i, k) for i in self.set_of_all_turbines for k in self.set_of_all_vehicles), cat = "Binary")
            
        # uj - a variable to eliminate subtours
        u = pulp.LpVariable.dicts("u", ((j) for j in self.set_of_all_nodes), cat="Integer")

        # w - track whether a vehicle has already left from its starting node or not.
        w = pulp.LpVariable.dicts("w", ((i, k) for i in self.set_of_all_starting_nodes for k in self.set_of_all_vehicles), cat="Binary")

        # multi objective function
        # maximize number of missions assigned to vehicles
        number_of_missions = pulp.lpSum([y[i,k] for i in self.set_of_all_turbines for k in self.set_of_all_vehicles])
        # minimize timespan of each turbine visited
        ALPHA = 0.01 # Higher ALPHA -> more focused on last visited turbines
        last_visited = pulp.lpSum([y[i,k]*self.time_of_turbines_last_inspection[i] for i in self.set_of_all_turbines for k in self.set_of_all_vehicles])
        BETA = 0.001 # Higher BETA -> avoid longer travels (reduce total travelling time)
        avoid_longer_travels=0
        for k in self.set_of_all_vehicles:       
            avoid_longer_travels += pulp.lpSum([x[i,j,k] * self.G_milp[i][j]['weight'] for i in self.set_of_all_nodes for j in self.set_of_all_nodes if i != j if self.G_milp.has_edge(i , j) if j != self.set_of_all_starting_nodes[k]])

        problem += number_of_missions + ALPHA*last_visited - BETA*avoid_longer_travels

        # To ensure that each mission is allocated to at most one vehicle
        for i in self.set_of_all_turbines:
            problem += pulp.lpSum([y[i,k] for k in self.set_of_all_vehicles]) <= 1
            
        # Travelling time (without last travel to starting node) + execution time is within Time Window
        for k in self.set_of_all_vehicles:       
            travelling_time = pulp.lpSum([x[i,j,k] * self.G_milp[i][j]['weight'] for i in self.set_of_all_nodes for j in self.set_of_all_nodes if i != j if self.G_milp.has_edge(i , j) if j != self.set_of_all_starting_nodes[k]])
            execution_time = pulp.lpSum([y[i,k] * (EXECUTE_TIME) for i in self.set_of_all_turbines])
            problem += travelling_time + execution_time <= TIME_WINDOW
            
        # # This constraint ensures that if vehicle was assigned to a turbine, than the vehicle must visit this turbine at least once
        for i in self.set_of_all_turbines:
            for k in self.set_of_all_vehicles:
                problem += y[i,k] <= pulp.lpSum([x[j,i,k] for j in self.set_of_all_nodes if j != i]) 
            
        n = len(self.set_of_all_turbines)
        # Subtour elimination constraint
        for k in self.set_of_all_vehicles:
            for i in self.set_of_all_turbines:
                for j in self.set_of_all_turbines:
                    if i != j:
                        problem += u[i] - u[j] + n * x[i,j,k] <= n - 1
                        
        # Each vehicle k can leave its starting node at most once
        for k in self.set_of_all_vehicles:
            problem += pulp.lpSum(x[self.set_of_all_starting_nodes[k], j, k] for j in self.set_of_all_turbines) <= w[self.set_of_all_starting_nodes[k], k]

        # If a vehicle enters a node, it must also leave the node (vehicle flow)
        for k in self.set_of_all_vehicles:
            for i in self.set_of_all_nodes:
                problem += pulp.lpSum(x[i, j, k] for j in self.set_of_all_nodes if i != j) == pulp.lpSum(x[j, i, k] for j in self.set_of_all_nodes if i != j)

        # This constraint ensures that if the starting node i is not the starting node of vehicle k, vehicle k cannot leave from node i.
        for i in self.set_of_all_starting_nodes:
            for k in self.set_of_all_vehicles:
                if i != self.set_of_all_starting_nodes[k]: # Exclude the starting node of the vehicle k
                    problem += pulp.lpSum(x[i, j, k] for j in self.set_of_all_nodes if j != i) == 0
        return problem

    def solve_milp(self, problem):

        solver_list = pulp.listSolvers(onlyAvailable=True)
        print(solver_list)
        solver = pulp.getSolver('GLPK_CMD', timeLimit=SOLVER_LIMIT_TIME)
        # solver = pulp.getSolver('COIN_CMD', timeLimit=solver_time_limit)

        # Solve the problem with the specified time limit
        problem.solve(solver)

        # display the status of the solution
        print("Status:", pulp.LpStatus[problem.status])
        
        # display the optimal objective value
        print("Optimal value:", pulp.value(problem.objective))
        
        # create the directed graph
        solution_G = nx.DiGraph()

        # add nodes to the graph
        for i in self.set_of_all_turbines:
            solution_G.add_node(i)

        
        for i in self.set_of_all_vehicles:
            print("Vehicle {} starts in position {}".format(i,self.vehicles[i]))

        pattern = r'\d+'
        allocation=[[] for _ in range(len(self.set_of_all_vehicles))]
        # add edges to the graph
        for v in problem.variables():
            if v.varValue == 1:
                extract_num = re.findall(pattern, v.name)
                if v.name[0] == 'x':
                    i = int(extract_num[0])
                    j = int(extract_num[1])
                    k = int(extract_num[2])  
                    if j != self.set_of_all_starting_nodes[k]:
                        solution_G.add_edge(i, j, label="Vehicle {}".format(k))
                    print("Vehicle {} travels from turbine {} to turbine {}".format(k,i,j))
                if v.name[0] == 'y':
                    i = int(extract_num[0])
                    j = int(extract_num[1])
                    print("Vehicle {} was allocated to turbine {}".format(j,i))
                    allocation[j].append(i)
                if v.name[0] == 'z':
                    i = int(extract_num[0])
                    j = int(extract_num[1])
                    print("Vehicle {} travelled {}".format(j,i))

        print('Allocation: ' + str(allocation))
        return allocation, solution_G

    def plot_allocation(self, turbines, vehicles, solution_G):
        color_list = ['red', 'blue', 'gray', 'orange', 'purple', 'brown', 'pink', 'green', 'olive', 'cyan']
        self.set_of_all_vehicles = range(len(vehicles))
        pattern = r'\d+'
        # plot the graph
        pos = turbines + vehicles
        # create a dictionary to map vehicle numbers to colors
        vehicle_colors = {k: v for k, v in zip(range(len(self.set_of_all_vehicles)), color_list)}
        # create a list of edge colors based on the vehicle that travels on each edge
        edge_colors = [vehicle_colors[int(re.findall(pattern, label)[0])] for _, _, label in solution_G.edges(data='label')]
        # plot the graph with edge colors and line styles
        nx.draw_networkx_nodes(solution_G, pos, node_color='lightblue', node_size=100)
        nx.draw_networkx_labels(solution_G, pos, font_size=9, font_color='black')
        nx.draw_networkx_edges(solution_G, pos, width=1, alpha=0.8, edge_color=edge_colors)
        # nx.draw_networkx_edges(solution_G, pos, width=1, alpha=0.8)
        nx.draw_networkx_edge_labels(solution_G, pos, edge_labels=nx.get_edge_attributes(solution_G, 'label'), font_size=8)

        plt.axis('off')
        plt.show()

    def set_solution_to_ros_param(self, allocation):
        print(allocation)
        print(type(allocation))
        print(type(self.vehicles))
        print((self.vehicles))
        for idx, vehicle in enumerate(self.vehicles):
            # for turbine in allocation[vehicle]:
                
            rospy.set_param('auv' + str(idx) + '/goals_allocated', allocation[idx])
    
if __name__ == '__main__':
      
    rospy.init_node('goal_allocation', anonymous=True)
    rospy.spin
    goal_allocation = Allocation()

    milp = goal_allocation.create_milp()
    allocation = goal_allocation.solve_milp(milp)
    print(allocation)
    goal_allocation.set_solution_to_ros_param(allocation[0])
    