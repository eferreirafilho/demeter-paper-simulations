#!/usr/bin/env python
import random
import math
import rospy
from action_interface import DemeterActionInterface
from nav_msgs.msg import Odometry
from build_roadmaps import BuildRoadmaps
import networkx as nx

class Allocation(object):
  def __init__(self):
    NUMBER_OF_TURBINES = 60
    self._rate = rospy.Rate(10)
    self.get_data_allocation_parameters()
    self.get_roadmap_parameters()
    
    self.goals = []
    for turbine in self.data_idx:
      self.goals.append([self.scaled_turbines_xy[turbine][0], self.scaled_turbines_xy[turbine][1]])
      if turbine >= NUMBER_OF_TURBINES:
        rospy.logwarn('WARNING: Position of sensor out of turbine farm range!')
        
      self.auv_positions = {}

    # Get current robots positions
    for i in self.vehicle_idx:
      rospy.Subscriber("/auv" + str(i) + "/pose_gt", Odometry, self.pose_callback, i)
    self._wait(3)  
    self.robots = []
    for robot in self.auv_positions:
      self.robots.append(self.auv_positions[robot])
      
  def pose_callback(self, msg, i):
    self.auv_positions[i] = [msg.pose.pose.position.x, msg.pose.pose.position.y]
    
  def _wait(self, n_rate):
    for _ in range(n_rate):
      self._rate.sleep()

  def get_data_allocation_parameters(self):
    self.vehicle_idx = rospy.get_param("/goal_allocation/vehicle_idx")
    self.data_idx = rospy.get_param("/goal_allocation/data_idx")
  
  def get_roadmap_parameters(self):
    self.scaled_turbines_xy = rospy.get_param("/goal_allocation/scaled_turbines_xy")
               
  def euclidean_distance(self, point1, point2):
    """Returns the Euclidean distance between two points."""
    return math.sqrt((point1[0] - point2[0])**2 + (point1[1] - point2[1])**2)

  def fitness(self, assignment):
    """Returns the total distance traveled by all robots based on the given allocation of goals."""
    total_distance = 0
    for robot_idx, robot_goals in enumerate(assignment):
      if robot_goals != []:
        total_distance += self.euclidean_distance(self.robots[robot_idx], robot_goals[0])
        for goal_idx in range(len(robot_goals)-1):
          total_distance += self.euclidean_distance(robot_goals[goal_idx], robot_goals[goal_idx+1])
    
    return total_distance      

  def random_allocation(self):
    """Returns a random allocation of goals to robots."""
    allocation = [[] for _ in range(len(self.robots))]
    for goal in self.goals:
        random_robot_idx = random.randint(0, len(self.robots) - 1)
        allocation[random_robot_idx].append(goal)
    return allocation

  def swap_one_allocation_randomly(self, coordinates):
      if any(not bool(x) for x in coordinates):
        return coordinates
      else:
        sublist1, sublist2 = random.randint(0, len(coordinates)-1), random.randint(0, len(coordinates)-1)
        pair1, pair2 = random.randint(0, len(coordinates[sublist1])-1), random.randint(0, len(coordinates[sublist2])-1)
        coordinates [sublist1][pair1], coordinates[sublist2][pair2] = coordinates[sublist2][pair2], coordinates [sublist1][pair1]
      
      return coordinates

  def genetic_algorithm(self, population, mutation_rate, n_generations):
    
    for i in range(n_generations):
      ranked_solution = []
      for element in population:
        ranked_solution.append((self.fitness(element), element))
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
          swapped = self.swap_one_allocation_randomly(s)
          elements.append(swapped)
            
      population = elements + worst_solutions
    # print("Best Solution: ", ranked_solution[0])
    return ranked_solution[0]
  
  def find_index(self, point):
    for index, value in enumerate(self.scaled_turbines_xy):
      if value[0] == point[0] and value[1] == point[1]:
        return index
    return -1
  
  def run_genetic_algorithm(self, POPULATION, MUTATION_RATE, N_GENERATIONS):
    return self.genetic_algorithm([self.random_allocation() for _ in range(POPULATION)], MUTATION_RATE, N_GENERATIONS)
      
  def set_solution_to_ros_param(self, vehicle_id, individual_solution):
    rospy.set_param('auv' + str(vehicle_id) + '/goals_allocated', individual_solution)
    
if __name__ == '__main__':
  
  rospy.init_node('goal_allocation', anonymous=True)
  rospy.spin
  
  POPULATION = 20000
  MUTATION_RATE = 0.2
  N_GENERATIONS = 2000
  
  goal_allocation = Allocation()
  solution = goal_allocation.run_genetic_algorithm(POPULATION, MUTATION_RATE, N_GENERATIONS)
  
  print("Solution: " + str(solution))
  
  for vehicle in range(len(solution[1])):
    solution_vehicle = solution[1][int(vehicle)]
    solution_ids=[]
    for i in solution[1][int(vehicle)]:
      goal_allocation.find_index(i)
      print('Vehicle: ' + str(vehicle) + ' Allocated data: ' + str(goal_allocation.find_index(i)))
      solution_ids.append(goal_allocation.find_index(i))
    goal_allocation.set_solution_to_ros_param(vehicle, solution_ids)