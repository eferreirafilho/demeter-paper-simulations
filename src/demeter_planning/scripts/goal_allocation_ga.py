#!/usr/bin/env python
import random
import math
import rospy
from action_interface import DemeterActionInterface
from nav_msgs.msg import Odometry
from build_roadmaps import BuildRoadmaps
import networkx as nx
import pickle
from rospkg import RosPack
import roslib
import pygad

class Allocation(object):
    def __init__(self):
        self.package_path = roslib.packages.get_pkg_dir("demeter_planning")
        
        self._rate = rospy.Rate(10)
        self.get_data_allocation_parameters()

        self.G_visibility = self.load_graph()
        self.turbines, self.turbines_nodes_idx = self.get_turbine_positions(self.G_visibility)
            
        self.auv_positions = {}

        # Get current robots positions
        for i in self.vehicle_idx:
            rospy.Subscriber("/auv" + str(i) + "/pose_gt", Odometry, self.pose_callback, i)
        self._wait(3)  
        self.robots = []
        
    def pose_callback(self, msg, i):
        for robot in self.auv_positions:
            self.robots.append(self.auv_positions[robot])
        self.auv_positions[i] = [msg.pose.pose.position.x, msg.pose.pose.position.y]
    
    def _wait(self, n_rate):
        for _ in range(n_rate):
            self._rate.sleep()
            
    def load_graph(self):
        '''Load precomputed Roadmaps based on visibility graphs'''
        with open(self.package_path + "/params/scaled_visibility_G_with_turbines.pickle", "rb") as f:
            G_visibility = pickle.load(f)
            return G_visibility

    def get_turbine_positions(self, G_visibility):
        '''Get the nodes that are turbines (there exists also countor-point nodes and corners nodes)'''
        turbines = []
        turbines_nodes_idx = []
        for i in range(G_visibility.number_of_nodes()):
            if G_visibility.nodes[i]['description'] == 'turbine':
                x = G_visibility.nodes[i]['pos'][0]
                y = G_visibility.nodes[i]['pos'][1]
                turbines.append([float(x), float(y)])
                turbines_nodes_idx.append(G_visibility.nodes[i]['related_to'])
        return turbines, turbines_nodes_idx

    def get_data_allocation_parameters(self):
        """Get the number of robots and indexex set in parameter"""
        self.vehicle_idx = rospy.get_param("/goal_allocation/vehicle_idx")
                 
    def find_closer_node(self, robot):
        '''Find node in graph that is closer to auv i'''
        min_dist = float('inf')
        for n_idx, node in enumerate(self.G_visibility.nodes()):
            dist = self.euclidean_distance(robot, [self.G_visibility.nodes[n_idx]['pos'][0], self.G_visibility.nodes[n_idx]['pos'][1]])
            if dist < min_dist:
                min_dist = dist
                closer_node = n_idx
        return closer_node, min_dist
                 
    def graph_distance(self, node1, node2):
        '''Shortest path between two turbine nodes through the roadmap (visibility based graph)'''
        # Compute shortest path between node1 and node2 using Dijkstra's algorithm
        shortest_path = nx.shortest_path(self.G_visibility, node1, node2, weight='weight')
        # Compute total distance along the shortest path
        total_distance = sum(self.G_visibility.get_edge_data(shortest_path[i], shortest_path[i+1])['weight'] for i in range(len(shortest_path)-1))
        return total_distance
    
    def euclidean_distance(self, point1, point2):
        """Returns the Euclidean distance between two points."""
        return math.sqrt((point1[0] - point2[0])**2 + (point1[1] - point2[1])**2)

    def fitness(self, assignment):
        distance_travelled = [0] * len(self.robots)
        # Distance from initial position to closer node
        for robot_idx, robot in enumerate(self.robots):
            _, min_dist = self.find_closer_node(robot)
            distance_travelled[robot_idx] = min_dist
        # Cumulative distance travelled by each vehicle
        for robot_idx, robot_goals in enumerate(assignment):
            for i in robot_goals:
                distance_travelled[robot_idx] += self.graph_distance(i, i+1)

        time_executing = [0] * len(self.robots)
        EXECUTION_TIME = 5
        for robot_idx, robot_goals in enumerate(assignment):
            time_executing[robot_idx] += len(robot_goals)*EXECUTION_TIME
            
        time_window_penalty = [0] * len(self.robots)
        TIME_WINDOW = 30
        for robot_idx, robot_goals in enumerate(assignment):
            time_spent = time_executing[robot_idx] + distance_travelled[robot_idx]
            if time_spent > TIME_WINDOW:
                return 0 # Return a large penalty for invalid solution           
            # time_window_penalty[robot_idx] = time_spent - TIME_WINDOW
        last_time_executed = self.turbines_nodes_idx
        
        fitness_function = 0
        return sum(time_executing) + sum(last_time_executed)
    
    def random_allocation(self):
        """Returns a random allocation of goals to robots."""
        allocation = [[] for _ in range(len(self.robots))]
        turbines = list(range(len(self.turbines)))
        init_mutation_rate = random.random()
        random.shuffle(turbines)
        for turbine_idx in turbines:
            random_robot_idx = random.randint(0, len(self.robots)-1)
            if random.random() < init_mutation_rate:
                allocation[random_robot_idx].append(turbine_idx)
        return allocation

    def add_one_element_randomly(self, s):
        random_number = random.randrange(0, len(self.turbines))
        random_list = random.choice(s)
        while random_number in random_list:
            random_number = random.randrange(0, len(self.turbines))
        random_list.append(random_number)
        return s

    def remove_one_element_randomly(self, s):
        # Pick a random sublist
        sublist = random.choice(s)
        # Remove a random element from the sublist
        if sublist:
            sublist.pop(random.randrange(len(sublist)))
        return s

    def tournament_selection(self, population, tournament_size):
        selected = []
        for i in range(len(population)):
            if tournament_size > len(population):
                tournament_size = len(population)
            tournament = random.sample(population, tournament_size)
            tournament.sort(reverse=True)
            selected.append(tournament[0])
        return selected
    
    def crossover(self, parent1, parent2):
        # Single-point crossover
        crossover_point = random.randint(0, min(len(parent1), len(parent2)))
        offspring = parent1[:crossover_point] + parent2[crossover_point:]
        return offspring

    def mutate(self, individual, mutation_rate):
        # Add or remove an element randomly
        if random.random() < mutation_rate:
        # sublist1 = random.choice(s)
            
            individual = self.add_one_element_randomly(individual)
        else:
            individual = self.remove_one_element_randomly(individual)
        return individual

    def genetic_algorithm(self, population, MUTATION_RATE, N_GENERATIONS):
        best_solution = None
        self.all_time_best_solution = None
        self.all_time_best_fitness = None
        for generation in range(N_GENERATIONS):
            
            print('population')
            print(population)
            
            # Select parents using tournament selection
            parents = self.tournament_selection(population, 2)
            
            print('parents')
            print(parents)
            
            # Crossover parents to create offspring
            offspring = self.crossover(parents[0], parents[1])
            
            print('offspring')
            print(offspring)
            
            # Mutate offspring
            mutated_offspring = self.mutate(offspring, MUTATION_RATE)
            
            print('mutated_offspring')
            print(mutated_offspring)
            
            # Replace worst individuals in the population with the new offspring
            worst_individuals = sorted(population, key=self.fitness)[:2]
            print('worst_individuals')
            print(worst_individuals)
            for individual in worst_individuals:
                population.remove(individual)
                population.append(mutated_offspring)
            
            print('population')
            print(population)
            
            # Update best solution found so far
            best_individual = max(population, key=self.fitness)
            if best_solution is None or self.fitness(best_individual) > self.fitness(best_solution):
                best_solution = best_individual
                
            
            
            # Update all time best solution
            if self.fitness(best_individual) > self.all_time_best_fitness:
                self.all_time_best_fitness = self.fitness(best_individual)
                self.all_time_best_solution = best_individual
            rospy.logwarn('all time best: ' + str(self.all_time_best_fitness) + ' | ' + str(self.all_time_best_solution))
                # print(population)
                # print(fitness_scores)
            raw_input("Press Enter to continue...")

        return self.all_time_best_solution
    #     best_solution = None
    #     best_fitness = None
    #     for i in range(n_generations):
    #         ranked_solution = []
    #         for element in population:
    #             ranked_solution.append((self.fitness(element), element))
    #         ranked_solution.sort(reverse=True)

    #         print("Generation", i, "best solution:", ranked_solution[0])

    #         # Update best solution and fitness
    #         if best_fitness is None or ranked_solution[0][0] > best_fitness:
    #             best_solution = ranked_solution[0][1]
    #             best_fitness = ranked_solution[0][0]

    #         selected_solutions = [best_solution] # always include best solution
    #         tournament_size = 3
    #         selected_solutions += self.tournament_selection(population, tournament_size)

    #         ADD_RATE = 0.5
    #         REMOVE_RATE = 0.5
    #         mutated_elements = []
    #         for s in selected_solutions:
    #             if random.random() < mutation_rate:
    #                 if random.random() < ADD_RATE:
    #                     solution_added = self.add_one_element_randomly(s)
    #                     mutated_elements.append(solution_added)
    #                 if random.random() < REMOVE_RATE:
    #                     solution_added = self.remove_one_element_randomly(s)
    #                     mutated_elements.append(solution_added)
    #             else:
    #                 mutated_elements.append(s)

    #         # Combine the mutated solutions and the original population
    #         combined_population = population + mutated_elements

    #         # Rank the combined population by fitness
    #         ranked_combined_population = []
    #         for element in combined_population:
    #             ranked_combined_population.append((self.fitness(element), element))
    #         ranked_combined_population.sort(reverse=True)

    #         # Select the best solutions to form the new population
    #         population = [solution for _, solution in ranked_combined_population[:len(population)]]

    #     print("Best Solution:", best_solution)
    #     return best_solution


    def run_genetic_algorithm(self, POPULATION, MUTATION_RATE, N_GENERATIONS):
        random_init_pop = [self.random_allocation() for _ in range(POPULATION)]
        self.genetic_algorithm(random_init_pop, MUTATION_RATE, N_GENERATIONS)

    def set_solution_to_ros_param(self, vehicle_id, individual_solution):
        rospy.set_param('auv' + str(vehicle_id) + '/goals_allocated', individual_solution)
    
if __name__ == '__main__':
  
    rospy.init_node('goal_allocation', anonymous=True)
    rospy.spin
  
    POPULATION = 5
    MUTATION_RATE = 0.1
    N_GENERATIONS = 10
  
    goal_allocation = Allocation()
    goal_allocation.run_genetic_algorithm(POPULATION, MUTATION_RATE, N_GENERATIONS)
  
    solution = goal_allocation.all_time_best_solution
    fitness = goal_allocation.all_time_best_fitness
    print("Solution: " + str(goal_allocation.all_time_best_solution))
  
    for vehicle in range(len(solution)):
        solution_vehicle = solution[int(vehicle)]
        goal_allocation.set_solution_to_ros_param(vehicle, solution_vehicle)
        rospy.logwarn("Vehicle " + str(vehicle) + " allocated to: " + str(len(solution_vehicle)) + " turbines: " + str(solution_vehicle))