import random
import networkx as nx
import matplotlib.pyplot as plt
import pickle
import roslib
from rospkg import RosPack
import pulp
import re

random.seed(15)
TIME_WINDOW = 22 # Time limit
EXECUTE_TIME = 10 # Inspect turbine estimated execute time
SOLVER_LIMIT_TIME = 30 # Seconds

def load_graph():
    '''Load precomputed Roadmaps based on visibility graphs'''
    with open(package_path + "/params/scaled_visibility_G_with_turbines.pickle", "rb") as f:
        G = pickle.load(f)
        return G

def get_turbine_positions(G):
    '''Get the nodes that are turbines (there is also countor-point nodes and corners nodes)'''
    turbines = []
    turbines_idx = []
    for i in range(G.number_of_nodes()):
        if G.nodes[i]['description'] == 'turbine':
            x = G.nodes[i]['pos'][0]
            y = G.nodes[i]['pos'][1]
            turbines.append([float(x), float(y)])
            turbines_idx.append(G.nodes[i]['related_to'])
    return turbines, turbines_idx

def euclidean_distance(coord1, coord2):
    return ((coord1[0] - coord2[0]) ** 2 + (coord1[1] - coord2[1]) ** 2) ** 0.5

def graph_distance(G, node1, node2):
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
    

def create_turbine_graph(turbines_idx, G):
    '''Create graph with only turbines and distances based on shortest paths'''
    G_mtsp = nx.Graph()
    print("--------------------------------")
    print(turbines_idx)
    print(G_mtsp.nodes())
    print('G.nodes()')
    print(G.nodes())
    for turbine_i in turbines_idx:
        for turbine_j in turbines_idx:
            print(turbine_i)
            dist = graph_distance(G, turbine_i, turbine_j)
            print(dist)
            G_mtsp.add_edge(turbine_i, turbine_j, weight = dist)
            G_mtsp.add_edge(turbine_j, turbine_i, weight = dist)
    return G_mtsp

def plot_graph(G, nodes):
    pos_dict = {i: nodes[i] for i in range(len(nodes))}
    nx.draw(G, pos = pos_dict, with_labels = True)
    plt.show()

def add_vehicles_to_graph(turbines, turbines_idx, vehicles, G):
    '''Add edges between vehicles current position and roadmap'''
    G_mtsp = create_turbine_graph(turbines_idx, G)
    print('G_mtsp.nodes()')
    print(G_mtsp.nodes())
        
    # Initialize closer_node list
    closer_node = [None] * len(vehicles)

    # Find closest node for each vehicle and add it to closer_node
    for v_idx, vehicle in enumerate(vehicles):
        min_dist = float('inf')
        for n_idx, node in enumerate(G_mtsp.nodes()):
            dist = euclidean_distance(vehicle, turbines[n_idx])
            print(dist)
            if dist < min_dist:
                min_dist = dist
                closer_node[v_idx] = n_idx

    # Add nodes for each vehicle to G_mtsp
    vehicle_nodes = []
    for vehicle in vehicles:
        node_idx = G_mtsp.number_of_nodes()
        G_mtsp.add_node(node_idx, pos=vehicle)
        vehicle_nodes.append(node_idx)

    print('closer_node')
    print(closer_node)
    # Add edges from vehicle nodes to their closest turbines and back
    for v_idx, n_idx in enumerate(closer_node):
        print('v_idx:' + str(v_idx))
        print('n_idx:' + str(n_idx))
        G_mtsp.add_edge(vehicle_nodes[v_idx], n_idx, weight = euclidean_distance(vehicles[v_idx], turbines[n_idx]))
        G_mtsp.add_edge(n_idx, vehicle_nodes[v_idx], weight = euclidean_distance(vehicles[v_idx], turbines[n_idx]))

    # Plot graph with nodes for turbines and vehicles
    # plot_graph(G_mtsp, node_pos)
    return G_mtsp
    
def mtsp(turbines, vehicles, G_mtsp):


    set_of_all_vehicles = range(len(vehicles))
    set_of_all_turbines = range(len(turbines))
    set_of_all_nodes = range(len(G_mtsp.nodes()))
    set_of_all_starting_nodes = [x for x in set_of_all_nodes if x not in set_of_all_turbines]
    # time_of_turbines_last_inspection = [random.uniform(1, 100) for _ in range(len(turbines))]
    time_of_turbines_last_inspection = range(len(turbines)) # How long ago a turbine was inspected
    print(time_of_turbines_last_inspection)
    
    problem = pulp.LpProblem("GoalAllocation", pulp.LpMaximize)
    
    # xijk - binary variable, i if vehicle k travels from node i to node j, 0 otherwise
    x = pulp.LpVariable.dicts("x", ((i, j, k) for i in set_of_all_nodes for j in set_of_all_nodes for k in set_of_all_vehicles if i != j), cat="Binary")

    # yik - binary variable, i if vehicle k is assigned to mission in turbine i, 0 otherwise
    y = pulp.LpVariable.dicts("y", ((i, k) for i in set_of_all_turbines for k in set_of_all_vehicles), cat = "Binary")
        
    # uj - a variable to eliminate subtours
    u = pulp.LpVariable.dicts("u", ((j) for j in set_of_all_nodes), cat="Integer")

    # w - track whether a vehicle has already left from its starting node or not.
    w = pulp.LpVariable.dicts("w", ((i, k) for i in set_of_all_starting_nodes for k in set_of_all_vehicles), cat="Binary")

    # multi objective function
    # maximize number of missions assigned to vehicles
    number_of_missions = pulp.lpSum([y[i,k] for i in set_of_all_turbines for k in set_of_all_vehicles])
    # minimize timespan of each turbine visited
    ALPHA = 0.01 # Higher ALPHA -> more focused on last visited turbines
    last_visited = pulp.lpSum([y[i,k]*time_of_turbines_last_inspection[i] for i in set_of_all_turbines for k in set_of_all_vehicles])
    BETA = 0.001 # Higher BETA -> avoid longer travels (reduce total travelling time)
    avoid_longer_travels=0
    for k in set_of_all_vehicles:       
        avoid_longer_travels += pulp.lpSum([x[i,j,k] * G_mtsp[i][j]['weight'] for i in set_of_all_nodes for j in set_of_all_nodes if i != j if G_mtsp.has_edge(i , j) if j != set_of_all_starting_nodes[k]])

    problem += number_of_missions + ALPHA*last_visited - BETA*avoid_longer_travels

    # To ensure that each mission is allocated to at most one vehicle
    for i in set_of_all_turbines:
        problem += pulp.lpSum([y[i,k] for k in set_of_all_vehicles]) <= 1
        
    # Travelling time (without last travel to starting node) + execution time is within Time Window
    for k in set_of_all_vehicles:       
        travelling_time = pulp.lpSum([x[i,j,k] * G_mtsp[i][j]['weight'] for i in set_of_all_nodes for j in set_of_all_nodes if i != j if G_mtsp.has_edge(i , j) if j != set_of_all_starting_nodes[k]])
        execution_time = pulp.lpSum([y[i,k] * (EXECUTE_TIME) for i in set_of_all_turbines])
        problem += travelling_time + execution_time <= TIME_WINDOW
        
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
    for k in set_of_all_vehicles:
        problem += pulp.lpSum(x[set_of_all_starting_nodes[k], j, k] for j in set_of_all_turbines) <= w[set_of_all_starting_nodes[k], k]

    # If a vehicle enters a node, it must also leave the node (vehicle flow)
    for k in set_of_all_vehicles:
        for i in set_of_all_nodes:
            problem += pulp.lpSum(x[i, j, k] for j in set_of_all_nodes if i != j) == pulp.lpSum(x[j, i, k] for j in set_of_all_nodes if i != j)

    # This constraint ensures that if the starting node i is not the starting node of vehicle k, vehicle k cannot leave from node i.
    for i in set_of_all_starting_nodes:
        for k in set_of_all_vehicles:
            if i != set_of_all_starting_nodes[k]: # Exclude the starting node of the vehicle k
                problem += pulp.lpSum(x[i, j, k] for j in set_of_all_nodes if j != i) == 0


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
    for i in set_of_all_turbines:
        solution_G.add_node(i)

    for i in set_of_all_vehicles:
        print("Vehicle {} starts in position {}".format(i,vehicles[i]))

    pattern = r'\d+'
    allocation=[[] for _ in range(len(set_of_all_vehicles))]
    # add edges to the graph
    color_list = ['red', 'blue', 'gray', 'orange', 'purple', 'brown', 'pink', 'green', 'olive', 'cyan']
    for v in problem.variables():
        if v.varValue == 1:
            extract_num = re.findall(pattern, v.name)
            if v.name[0] == 'x':
                i = int(extract_num[0])
                j = int(extract_num[1])
                k = int(extract_num[2])  
                if j != set_of_all_starting_nodes[k]:
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
    # plot the graph
    pos = turbines + vehicles

    # create a dictionary to map vehicle numbers to colors
    vehicle_colors = {k: v for k, v in zip(range(len(set_of_all_vehicles)), color_list)}

    # create a list of edge colors based on the vehicle that travels on each edge
    edge_colors = [vehicle_colors[int(re.findall(pattern, label)[0])] for _, _, label in solution_G.edges(data='label')]

    # plot the graph with edge colors and line styles


    # plot the graph with edge colors and line styles
    nx.draw_networkx_nodes(solution_G, pos, node_color='lightblue', node_size=100)
    nx.draw_networkx_labels(solution_G, pos, font_size=9, font_color='black')
    nx.draw_networkx_edges(solution_G, pos, width=1, alpha=0.8, edge_color=edge_colors)
    # nx.draw_networkx_edges(solution_G, pos, width=1, alpha=0.8)
    nx.draw_networkx_edge_labels(solution_G, pos, edge_labels=nx.get_edge_attributes(solution_G, 'label'), font_size=8)

    plt.axis('off')
    plt.show()


if __name__ == '__main__':
    package_path = roslib.packages.get_pkg_dir("demeter_planning")
    G = load_graph()
    turbines, turbines_idx = get_turbine_positions(G)
    print(turbines_idx)
    # vehicles = [[50, 60], [-30, 40]]
    vehicles = [[50, 60], [-30, 40], [20, -30]]
    # vehicles = [[50, 60]]
    G_mtsp = add_vehicles_to_graph(turbines, turbines_idx, vehicles, G)
    mtsp(turbines, vehicles, G_mtsp)