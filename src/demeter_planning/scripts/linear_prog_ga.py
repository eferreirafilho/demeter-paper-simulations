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
            print(turbine_i)
            print(idx_i)
            dist = distance(turbine_i, turbine_j)
            G_mtsp.add_edge(idx_i, idx_j, weight = dist)
            G_mtsp.add_edge(idx_j, idx_i, weight = dist)
    return G_mtsp

def plot_graph(G, nodes):
    print(nodes)
    pos_dict = {i: nodes[i] for i in range(len(nodes))}
    print(pos_dict)
    nx.draw(G, pos = pos_dict, with_labels = True)
    plt.show()
    
# vehicles = [[5, 6], [-10, 4]]
# turbines = [[0, 1], [4, 2], [1, 7]]
def mtsp(turbines, vehicles):
    
    time_window = 200 
    t_exec = 5
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

    # Add edges from vehicle nodes to their closest turbines
    for v_idx, n_idx in enumerate(closer_node):
        G_mtsp.add_edge(vehicle_nodes[v_idx], n_idx, weight = distance(vehicles[v_idx], turbines[n_idx]))

    # Plot graph with nodes for turbines and vehicles
    node_pos = turbines + vehicles
    plot_graph(G_mtsp, node_pos)
    M = len(turbines)

    set_of_all_vehicles = range(len(vehicles))
    set_of_all_turbines = range(len(G_mtsp.nodes()))
    print(set_of_all_vehicles)
    print(set_of_all_turbines)
    
    problem = pulp.LpProblem("GoalAllocation", pulp.LpMaximize)
    
    # xijk - binary variable, i if vehicle k travels from turbine i to turbine j, 0 otherwise
    x = pulp.LpVariable.dicts("x", ((i, j, k) for i in set_of_all_turbines for j in set_of_all_turbines for k in set_of_all_vehicles if i != j), cat="Binary")

    # yik - binary variable, i if vehicle k is assigned to mission in turbine i, 0 otherwise
    y = pulp.LpVariable.dicts("y", ((i, k) for i in set_of_all_turbines for k in set_of_all_vehicles), cat = "Binary")
        
    # uj - a variable to eliminate subtours
    u = pulp.LpVariable.dicts("u", ((j) for j in set_of_all_turbines), cat="Integer")

    # objective function
    # maximize number of missions assigned to vehicles
    problem += pulp.lpSum([y[i,k] for i in set_of_all_turbines for k in set_of_all_vehicles])

    # constraints  
    # This ensures that for each vehicle k, there is exactly one arc leaving its assigned starting turbine starting_turbine[k] in the direction of a different turbine j, indicating that the vehicle starts at starting_turbine[k] and moves to j.
    for k in set_of_all_vehicles:
        problem += pulp.lpSum([x[starting_turbine[k], j, k] for j in set_of_all_turbines if starting_turbine[k] != j]) == 1     
        
    # This ensures that for each vehicle k, it can only leave from its assigned starting turbine starting_turbine[k] once
    for k in set_of_all_vehicles:
        problem += pulp.lpSum([x[starting_turbine[k], j, k] for j in set_of_all_turbines if starting_turbine[k] != j]) == pulp.lpSum([x[j, starting_turbine[k], k] for j in set_of_all_turbines if starting_turbine[k] != j])    


    # To ensure that each mission is allocated to at most one vehicle
    for i in set_of_all_turbines:
        if i < M:
            problem += pulp.lpSum([y[i,k] for k in set_of_all_vehicles]) <= 1
  
    # Travelling time + execution time is within Time Window
    for k in set_of_all_vehicles:
        problem += pulp.lpSum([x[i,j,k] * (G_mtsp[i][j]['weight'] + t_exec) for i in set_of_all_turbines for j in set_of_all_turbines if i != j if i < M if j < M]) <= time_window

    # This constraint ensures that if a vehicle is assigned to a mission at a particular turbine i, then there must exist a path from its starting turbine to turbine i in the set of chosen edges x. This enforces that the vehicle must travel to the turbine i to execute the mission allocated to it.
    for i in set_of_all_turbines:
        for k in set_of_all_vehicles:
            problem += y[i,k] <= pulp.lpSum([x[i, j, k] for j in set_of_all_turbines if i != j])

    # # Subtour elimination constraint
    for k in set_of_all_vehicles:
        for i in set_of_all_turbines:
            for j in set_of_all_turbines:
                if i != j:
                    problem += u[i] - u[j] + set_of_all_turbines.__len__() * x[i, j, k] <= set_of_all_turbines.__len__() - 1

    # Solve problem
    problem.solve()
           
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
        print("Vehicle {} starts in turbine {}".format(i,starting_turbine[i]))

    # add edges to the graph
    for v in problem.variables():
        if v.varValue == 1:
            if v.name[0] == 'x':
                i = int(v.name[3])
                j = int(v.name[6])
                k = int(v.name[9])  
                solution_G.add_edge(i, j, weight=G_mtsp[i][j]['weight'], label="Vehicle {}".format(k))
                print("Vehicle {} travels from turbine {} to turbine {}".format(k,i,j))
            if v.name[0] == 'y':
                i = int(v.name[3])
                j = int(v.name[6])
                print("Vehicle {} was allocated to turbine {}".format(j,i))
        if v.name[0] == 'u':
            print(v.name)
            print(v.varValue)
                
    # plot the graph
    pos = turbines
    nx.draw_networkx_nodes(solution_G, pos, node_color='lightblue', node_size=1000)
    nx.draw_networkx_labels(solution_G, pos, font_size=12, font_color='black')
    nx.draw_networkx_edges(solution_G, pos, edge_color='gray', width=1, alpha=0.8)
    nx.draw_networkx_edge_labels(solution_G, pos, edge_labels=nx.get_edge_attributes(solution_G, 'label'), font_size=10)
    plt.axis('off')
    plt.show()

if __name__ == '__main__':
    package_path = roslib.packages.get_pkg_dir("demeter_planning")
    G = load_graph()
    turbines = get_turbine_positions(G)
    vehicles = [[50, 60], [-30, 40]]
    mtsp(turbines, vehicles)