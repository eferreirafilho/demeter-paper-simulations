import random
import math

# List of goals to visit
goals = [
    [100, 102],
    [90, 104],
    [90, 80],
    [250, 180],
    [200, 250],
    [180, 112],
    [90, 134],
    [1, 10],
    [20,20]
]

# List of robots start position
robots = [
    [100, 100],
    [200, 200],
    [2,2]
]

def euclidean_distance(point1, point2):
  """Returns the Euclidean distance between two points."""
  return math.sqrt((point1[0] - point2[0])**2 + (point1[1] - point2[1])**2)

def fitness(assignment):
  """Returns the total distance traveled by all robots based on the given allocation of goals."""
  total_distance = 0
  for robot_idx, robot_goals in enumerate(assignment):
    if robot_goals != []:
      total_distance += euclidean_distance(robots[robot_idx], robot_goals[0])
      for goal_idx in range(len(robot_goals)-1):
        total_distance += euclidean_distance(robot_goals[goal_idx], robot_goals[goal_idx+1])
  
  return total_distance      

def random_allocation(goals, robots):
  """Returns a random allocation of goals to robots."""
  allocation = [[] for _ in range(len(robots))]
  for goal in goals:
      random_robot_idx = random.randint(0, len(robots) - 1)
      allocation[random_robot_idx].append(goal)
  return allocation

def swap_one_allocation_randomly(coordinates):
    if any(not bool(x) for x in coordinates):
      return coordinates
    else:
      sublist1, sublist2 = random.randint(0, len(coordinates)-1), random.randint(0, len(coordinates)-1)
      pair1, pair2 = random.randint(0, len(coordinates[sublist1])-1), random.randint(0, len(coordinates[sublist2])-1)
      coordinates [sublist1][pair1], coordinates[sublist2][pair2] = coordinates[sublist2][pair2], coordinates [sublist1][pair1]
    
    return coordinates

def genetic_algorithm(population, mutation_rate, n_generations):
  
  for i in range(n_generations):
    ranked_solution = []
    for element in population:
      ranked_solution.append((fitness(element), element))
    ranked_solution.sort(reverse=True)
    if random.random()<0.1:
      print("Generation " ,i, " best solution: ", ranked_solution[0])
    
    # Selection by truncation
    best_solutions_with_fitness = ranked_solution[:len(population)//2] # 50% of the population, selection by truncation
    worst_solutions_with_fitness = ranked_solution[len(population)//2:] # the rest of the population
    
    best_solutions = [item[1] for item in best_solutions_with_fitness]
    worst_solutions = [item[1] for item in worst_solutions_with_fitness]

    elements = []
    for s in best_solutions: # keep the best solution
      if random.random() < mutation_rate:
        swapped = swap_one_allocation_randomly(s)
        elements.append(swapped)
          
    population = elements + worst_solutions
      
genetic_algorithm([random_allocation(goals, robots) for _ in range(10000)], 0.5, 200)