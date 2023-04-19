import random
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
time_window = 300

def euclidean_distance(x1, x2):
    return ((x1[0] - x2[0]) ** 2 + (x1[1] - x2[1]) ** 2) ** 0.5

roadmap = [[0 for _ in range(M)] for _ in range(M)]  # directed roadmap
for i in range(M):
    for j in range(M):
        if i != j:
            roadmap[i][j] = euclidean_distance(turbines[i], turbines[j])


starting_nodes = [random.randint(0, M-1) for _ in range(N)]  # starting node for each vehicle
print(starting_nodes)

population_size = 500
generations = 1000
number_of_tournaments = 3
mutation_probability = 0.1
crossover_probability = 0.9

# Define the fitness function
def fitness(solution):
    # print(solution)
    executed_missions = [0] * M
    total_time = 0
    for i in range(M):
        vehicle_assigned, starting_node = solution[i]
        if executed_missions[i] == 0 and total_time + S + roadmap[starting_node][i] + roadmap[i][vehicle_assigned] <= time_window:
            # if mission not executed yet and within time window
            executed_missions[i] = 1
            total_time += S + roadmap[starting_node][i] + roadmap[i][vehicle_assigned]  # add mission time, travel time from starting node, and travel time to next node
    return sum(executed_missions),

# Create the initial population
def create_population():
    population = []
    for i in range(population_size):
        solution = [(random.randint(0, N-1), starting_nodes[random.randint(0, N-1)]) for _ in range(M)]
        population.append(solution)
    return population

# Selection
def tournament_selection(population, k):
    selected = []
    for _ in range(k):
        candidates = random.sample(population, 2)
        fittest = max(candidates, key=fitness)
        selected.append(fittest)
    return selected

def roulette_wheel_selection(population, k):
    fitness_scores = [fitness(solution)[0] for solution in population]
    total_fitness = sum(fitness_scores)
    selected = []
    for _ in range(k):
        r = random.uniform(0, total_fitness)
        cum_sum = 0
        for i, solution in enumerate(population):
            cum_sum += fitness_scores[i]
            if cum_sum >= r:
                selected.append(solution)
                break
    return selected

# Crossover
def uniform_crossover(parents):
    child = [(None, None)] * M
    for i in range(M):
        if random.random() < crossover_probability:
            child[i] = parents[0][i]
        else:
            child[i] = parents[1][i]
    return child

def single_point_crossover(parents):
    child = [(None, None)] * M
    crossover_point = random.randint(1, M - 1)
    for i in range(crossover_point):
        child[i] = parents[0][i]
    for i in range(crossover_point, M):
        child[i] = parents[1][i]
    return child


# Mutation
def swap_mutation(solution):
    mutated = solution
    i, j = random.sample(range(M), 2)
    mutated[i], mutated[j] = mutated[j], mutated[i]
    return mutated

# Mutation
def inversion_mutation(solution):
    mutated = solution
    i, j = sorted(random.sample(range(M), 2))
    mutated[i:j+1] = reversed(mutated[i:j+1])
    return mutated

# Genetic algorithm
population = create_population()
for generation in range(generations):
    # parents = tournament_selection(population, number_of_tournaments)
    parents = roulette_wheel_selection(population, number_of_tournaments)
    # child = uniform_crossover(parents)
    child = single_point_crossover(parents)
    if random.random() < mutation_probability:
        # child = swap_mutation(child)
        child = inversion_mutation(child)
    population.append(child)
    population = sorted(population, key=fitness, reverse=True)
    population = population[:population_size]

# Output the fittest solution
fittest = max(population, key=fitness)
print("Number of executed missions:", fitness(fittest))

vehicle_missions = [[] for _ in range(N)]  # Initialize list to store executed missions for each vehicle
total_time = 0
for i in range(M):
    vehicle_assigned, starting_node = fittest[i]
    if fitness(fittest)[0] > 0 and total_time + S + roadmap[starting_node][i] + roadmap[i][vehicle_assigned] <= time_window:
        vehicle_missions[vehicle_assigned].append(i)  # Append the executed mission to the respective vehicle
        total_time += S + roadmap[starting_node][i] + roadmap[i][vehicle_assigned]

for i in range(N):
    print("Vehicle", i + 1, "executed missions:", vehicle_missions[i])

print("Vehicle assignments:")
for i in range(N):
    missions = [j for j in range(M) if fittest[j][0] == i]
    print("Vehicle", i + 1, "assigned to wind turbines", missions)
    
for idx, turbine in enumerate(turbines):
    plt.scatter(turbine[0], turbine[1], color='black')
    plt.text(turbine[0], turbine[1], idx, fontsize=9, color='black')
# show plot

plt.show()