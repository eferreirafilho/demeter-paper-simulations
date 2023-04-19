import random
import math
import networkx as nx
import matplotlib.pyplot as plt
import pickle
import roslib
from rospkg import RosPack

random.seed(15)

package_path = roslib.packages.get_pkg_dir("demeter_planning")

def load_graph():
    with open(package_path + "/params/scaled_visibility_G_with_turbines.pickle", "rb") as f:
        G = pickle.load(f)
        return G
        
G = load_graph()

turbines = []
for i in range(G.number_of_nodes()):
    if G.nodes[i]['description'] == 'turbine':
        x = G.nodes[i]['pos'][0]
        y = G.nodes[i]['pos'][1]
        turbines.append([float(x), float(y)])

# Define the problem domain
N = 2 
# number of vehicles
M = len(turbines)  # number of wind turbines
S = 50  # time it takes to execute a mission
time_window = 3000

def euclidean_distance(x1, x2):
    return ((x1[0] - x2[0]) ** 2 + (x1[1] - x2[1]) ** 2) ** 0.5

roadmap = [[0 for _ in range(M)] for _ in range(M)]  # directed roadmap
for i in range(M):
    for j in range(M):
        if i != j:
            roadmap[i][j] = euclidean_distance(turbines[i], turbines[j])

# Define initial state
def initial_state():
    state = []
    missions = ['measure-vortex', 'get-data']
    for i in range(N):
        vehicle = i
        mission_type = missions[i % 2]
        wind_turbine = random.randint(0, M-1)
        state.append((vehicle, mission_type, wind_turbine))
    return state

# Define cost function
def cost(state):
    total_time = 0
    last_execution = {}
    for i in range(M):
        last_execution[i, 'measure-vortex'] = -float('inf')
        last_execution[i, 'get-data'] = -float('inf')
    for vehicle, mission_type, wind_turbine in state:
        elapsed_time = total_time - last_execution[wind_turbine, mission_type]
        priority = max(0, S - elapsed_time)
        total_time += roadmap[wind_turbine][state[(vehicle+1)%N][2]] + S
        last_execution[wind_turbine, mission_type] = total_time
        total_time += priority
    return total_time

# Define Simulated Annealing algorithm
def simulated_annealing():
    state = initial_state()
    current_cost = cost(state)
    best_state = state
    best_cost = current_cost
    temperature = 10000
    cooling_rate = 0.003
    
    while temperature > 1:
        # Randomly perturb state
        new_state = state
        vehicle, mission_type, wind_turbine = random.choice(new_state)
        new_wind_turbine = random.randint(0, M-1)
        new_state[new_state.index((vehicle, mission_type, wind_turbine))] = (vehicle, mission_type, new_wind_turbine)
        
        # Compute cost of perturbed state
        new_cost = cost(new_state)
    
        # Decide whether to accept perturbed state
        if new_cost < current_cost:
            state = new_state
            current_cost = new_cost
            if current_cost < best_cost:
                best_state = state
                best_cost = current_cost
        else:
            delta = new_cost - current_cost
            acceptance_prob = math.exp(-delta/temperature)
            if random.random() < acceptance_prob:
                state = new_state
                current_cost = new_cost
        
        # Cool down temperature
        temperature *= 1 - cooling_rate

    return best_state, best_cost


best_state, best_cost = simulated_annealing()
print("Best state:", best_state)
print("Best cost:", best_cost)