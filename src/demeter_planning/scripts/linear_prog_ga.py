#Consider that N autonomous vehicles have to execute missions in M wind turbines. Each mission takes a time S to be executed. There are two possible missions: measure-vortex and get-data. 
#There is a directed roadmap connecting each wind turbine to each other.
#Vehicles have to execute the maximum amount of missions inside a time window. Missions that were executed long time ago shoulb have priority. Use Python and Pulp to formulate and solve this problem.

import random
import networkx as nx
import matplotlib.pyplot as plt
import pickle
import roslib
from rospkg import RosPack
import pulp
import re

random.seed(15)

def load_graph():
    with open(package_path + "/params/scaled_visibility_G_with_turbines.pickle", "rb") as f:
        G = pickle.load(f)
        return G

def get_turbine_positions(G):
    turbines = []
    for i in range(G.number_of_nodes()):
        if G.nodes[i]['description'] == 'turbine':
            x = G.nodes[i]['pos'][0]
            y = G.nodes[i]['pos'][1]
            turbines.append([float(x), float(y)])
    return turbines

def distance(coord1, coord2):
    return ((coord1[0] - coord2[0]) ** 2 + (coord1[1] - coord2[1]) ** 2) ** 0.5

def create_turbine_graph(turbines):
    G_mtsp = nx.Graph()
    for idx_i, turbine_i in enumerate(turbines):
        for idx_j, turbine_j in enumerate(turbines):
            dist = distance(turbine_i, turbine_j)
            G_mtsp.add_edge(idx_i, idx_j, weight = dist)
            G_mtsp.add_edge(idx_j, idx_i, weight = dist)
    return G_mtsp

def plot_graph(G, nodes):
    pos_dict = {i: nodes[i] for i in range(len(nodes))}
    nx.draw(G, pos = pos_dict, with_labels = True)
    plt.show()
    
# vehicles = [[5, 6], [-10, 4]]
# turbines = [[0, 1], [4, 2], [1, 7]]
def mtsp(turbines, vehicles):

    print(turbines)    
    time_window = 120
    t_exec = 2
    G_mtsp = create_turbine_graph(turbines)
        
    # Initialize closer_node list
    closer_node = [None] * len(vehicles)

    # Find closest node for each vehicle and add it to closer_node
    for v_idx, vehicle in enumerate(vehicles):
        min_dist = float('inf')
        for n_idx, node in enumerate(G_mtsp.nodes()):
            dist = distance(vehicle, turbines[n_idx])
            if dist < min_dist:
                min_dist = dist
                closer_node[v_idx] = n_idx

    # Add nodes for each vehicle to G_mtsp
    vehicle_nodes = []
    for vehicle in vehicles:
        node_idx = G_mtsp.number_of_nodes()
        G_mtsp.add_node(node_idx, pos=vehicle)
        vehicle_nodes.append(node_idx)

    # Add edges from vehicle nodes to their closest turbines and back
    for v_idx, n_idx in enumerate(closer_node):
        G_mtsp.add_edge(vehicle_nodes[v_idx], n_idx, weight = distance(vehicles[v_idx], turbines[n_idx]))
        G_mtsp.add_edge(n_idx, vehicle_nodes[v_idx], weight = distance(vehicles[v_idx], turbines[n_idx]))

    # Plot graph with nodes for turbines and vehicles
    # plot_graph(G_mtsp, node_pos)

    set_of_all_vehicles = range(len(vehicles))
    set_of_all_turbines = range(len(turbines))
    set_of_all_nodes = range(len(G_mtsp.nodes()))
    set_of_all_starting_nodes = [x for x in set_of_all_nodes if x not in set_of_all_turbines]
    
    problem = pulp.LpProblem("GoalAllocation", pulp.LpMaximize)
    
    # xijk - binary variable, i if vehicle k travels from node i to node j, 0 otherwise
    x = pulp.LpVariable.dicts("x", ((i, j, k) for i in set_of_all_nodes for j in set_of_all_nodes for k in set_of_all_vehicles if i != j), cat="Binary")

    # yik - binary variable, i if vehicle k is assigned to mission in turbine i, 0 otherwise
    y = pulp.LpVariable.dicts("y", ((i, k) for i in set_of_all_turbines for k in set_of_all_vehicles), cat = "Binary")
        
    # uj - a variable to eliminate subtours
    u = pulp.LpVariable.dicts("u", ((j) for j in set_of_all_nodes), cat="Integer")

    # w - track whether a vehicle has already left from its starting node or not.
    w = pulp.LpVariable.dicts("w", ((i, k) for i in set_of_all_starting_nodes for k in set_of_all_vehicles), cat="Binary")

    # objective function
    # maximize number of missions assigned to vehicles
    problem += pulp.lpSum([y[i,k] for i in set_of_all_turbines for k in set_of_all_vehicles])
   
    # To ensure that each mission is allocated to at most one vehicle
    for i in set_of_all_turbines:
        problem += pulp.lpSum([y[i,k] for k in set_of_all_vehicles]) <= 1
        
    # Travelling time (without last travel to starting node) + execution time is within Time Window
    for k in set_of_all_vehicles:       
        travelling_time = pulp.lpSum([x[i,j,k] * G_mtsp[i][j]['weight'] for i in set_of_all_nodes for j in set_of_all_nodes if i != j if G_mtsp.has_edge(i , j) if j != set_of_all_starting_nodes[k]])
        execution_time = pulp.lpSum([y[i,k] * (t_exec) for i in set_of_all_turbines])
        problem += travelling_time + execution_time <= time_window
        
    # # This constraint ensures that if vehicle was assigned to a turbine, than the vehicle must visit this turbine at least once
    for i in set_of_all_turbines:
        for k in set_of_all_vehicles:
            problem += y[i,k] <= pulp.lpSum([x[j,i,k] for j in set_of_all_nodes if j != i]) 
        
    n = len(set_of_all_turbines)
    # Subtour elimination constraint
    for k in set_of_all_vehicles:
        for i in set_of_all_turbines:
            for j in set_of_all_turbines:
                if i != j:
                    problem += u[i] - u[j] + n * x[i,j,k] <= n - 1
                    
    # Each vehicle k can leave its starting node at most once
    # for k in set_of_all_vehicles:
        # problem += pulp.lpSum(x[set_of_all_starting_nodes[k],j,k] for j in set_of_all_turbines) == w[set_of_all_starting_nodes[k],k]
    for k in set_of_all_vehicles:
        problem += pulp.lpSum(x[set_of_all_starting_nodes[k], j, k] for j in set_of_all_turbines) <= w[set_of_all_starting_nodes[k], k]

    # If a vehicle enters a node, it must also leave the node (vehicle flow)
    for k in set_of_all_vehicles:
        for i in set_of_all_nodes:
            problem += pulp.lpSum(x[i, j, k] for j in set_of_all_nodes if i != j) == pulp.lpSum(x[j, i, k] for j in set_of_all_nodes if i != j)

    # Each vehicle k cannot leave its starting node if it has already left
    # for i in set_of_all_starting_nodes:
    #     for k in set_of_all_vehicles:
    #         problem += pulp.lpSum(x[i,j,k] for j in set_of_all_turbines) <= w[i,k]

    # This constraint ensures that if the starting node i is not the starting node of vehicle k, vehicle k cannot leave from node i.
    for i in set_of_all_starting_nodes:
        for k in set_of_all_vehicles:
            if i != set_of_all_starting_nodes[k]: # Exclude the starting node of the vehicle k
                problem += pulp.lpSum(x[i, j, k] for j in set_of_all_nodes if j != i) == 0

    # # If a vehicle enters a turbine, it must leave from the same turbine.
    # for k in set_of_all_vehicles:
    #     for j in set_of_all_turbines:
    #         problem += pulp.lpSum(x[i, j, k] for i in set_of_all_turbines if i != j) == pulp.lpSum(x[j, i, k] for i in set_of_all_turbines if i != j)

    # # Do not go back to the starting nodes
    # for k in set_of_all_vehicles:
        # problem += pulp.lpSum(x[i, j, k] for i in set_of_all_turbines for j in set_of_all_starting_nodes) == 0
                            
    # Create a solver object
    
    
    solver_list = pulp.listSolvers(onlyAvailable=True)
    print(solver_list)
    # solver = pulp.getSolver('GLPK_CMD', timeLimit=10)
    # solver = pulp.getSolver('GLPK_CMD', timeLimit=10)
    solver = pulp.getSolver('COIN_CMD', timeLimit=5)

    # Solve the problem with the specified time limit
    problem.solve(solver)
          

    # display the status of the solution
    print("Status:", pulp.LpStatus[problem.status])
    
    # display the optimal objective value
    print("Optimal value:", pulp.value(problem.objective))
    
    # create the directed graph
    solution_G = nx.DiGraph()

    # add nodes to the graph
    for i in set_of_all_turbines:
        solution_G.add_node(i)

    for i in set_of_all_vehicles:
        print("Vehicle {} starts in position {}".format(i,vehicles[i]))

    pattern = r'\d+'
    # add edges to the graph
    for v in problem.variables():
        if v.varValue == 1:
            extract_num = re.findall(pattern, v.name)
            if v.name[0] == 'x':
                i = int(extract_num[0])
                j = int(extract_num[1])
                k = int(extract_num[2])  
                solution_G.add_edge(i, j, label="Vehicle {}".format(k))
                print("Vehicle {} travels from turbine {} to turbine {}".format(k,i,j))
            if v.name[0] == 'y':
                i = int(extract_num[0])
                j = int(extract_num[1])
                print("Vehicle {} was allocated to turbine {}".format(j,i))
            if v.name[0] == 'z':
                i = int(extract_num[0])
                j = int(extract_num[1])
                print("Vehicle {} travelled {}".format(j,i))

    # plot the graph
    pos = turbines + vehicles
    # create a dictionary of colors for each vehicle
    vehicle_colors = {}
    vehicle_styles = {}
    color_list = ['red', 'blue', 'gray', 'orange', 'purple', 'brown', 'pink', 'green', 'olive', 'cyan']
    style_list = ['dashdot', 'dashed', 'dotted', 'dashdot', 'solid', 'dashed', 'dotted']
    vehicle_count = 0
    for edge_label in nx.get_edge_attributes(solution_G, 'label').values():
        if edge_label not in vehicle_styles:
            vehicle_styles[edge_label] = {'color': color_list[vehicle_count % len(color_list)], 'style': style_list[vehicle_count // len(color_list)]}
            vehicle_count += 1

    # plot the graph with edge colors and line styles
    edge_colors = [vehicle_styles[label]['color'] for label in nx.get_edge_attributes(solution_G, 'label').values()]
    edge_styles = [vehicle_styles[label]['style'] for label in nx.get_edge_attributes(solution_G, 'label').values()]
    nx.draw_networkx_nodes(solution_G, pos, node_color='lightblue', node_size=1000)
    nx.draw_networkx_labels(solution_G, pos, font_size=12, font_color='black')
    nx.draw_networkx_edges(solution_G, pos, width=1, alpha=0.8, edge_color=edge_colors, style=edge_styles)
    nx.draw_networkx_edge_labels(solution_G, pos, edge_labels=nx.get_edge_attributes(solution_G, 'label'), font_size=10)
    plt.axis('off')
    plt.show()

if __name__ == '__main__':
    package_path = roslib.packages.get_pkg_dir("demeter_planning")
    G = load_graph()
    turbines = get_turbine_positions(G)
    vehicles = [[50, 60], [-30, 40], [9, 0]]
    # vehicles = [[50, 60]]
    mtsp(turbines, vehicles)