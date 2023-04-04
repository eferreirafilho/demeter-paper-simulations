#!/usr/bin/env python
"""
Consider an offshore wind turbine farm with M turbines and N autonomous vehicles. There is a directed roadmap connecting each turbine, vehicles can move between the turbines with cost given by the weights of the roadmap. There are two possible missions that each robot can execute when at a turbine: get-data and measure-vortex. Each mission takes a time t to be executed and has a variable B associated with. The variable B states when it was the last time this mission was executed. I want to get the allocation and order of each vehicle and missions, minimizing the total time for all the missions to be executed, while giving priority for missions that haven't been executed for a long time.
"""
import pulp

# Example data
M = 3  # number of turbines
N = 2  # number of vehicles
T = 2  # number of mission types
alpha = 0.3

# Example times and costs
t = {
    (1, 1, 1): 1,
    (1, 1, 2): 1,
    (1, 2, 1): 1,
    (1, 2, 2): 1,
    (2, 1, 1): 1,
    (2, 1, 2): 1,
    (2, 2, 1): 1,
    (2, 2, 2): 1,
    (3, 1, 1): 1,
    (3, 1, 2): 1,
    (3, 2, 1): 1,
    (3, 2, 2): 1,
}

# Last time a mission was executed
B = {
    (1, 1): 5,
    (1, 2): 6,
    (2, 1): 4,
    (2, 2): 7,
    (3, 1): 3,
    (3, 2): 8,
}

# Cost for a vehicle to travel from turbine i to turbine l
C = {
    (1, 2): 2,
    (1, 3): 3,
    (2, 1): 2,
    (2, 3): 1,
    (3, 1): 3,
    (3, 2): 1,
}

# # Vehicle start position
# S = {
#     (1): 2,
#     (2): 3    
# }

# Define the problem
problem = pulp.LpProblem('OffshoreWindTurbineFarm', pulp.LpMinimize)

# Variables
x = pulp.LpVariable.dicts('x', [(turbine_i, vehicle_j, mission_k) for turbine_i in range(1, M+1) for vehicle_j in range(1, N+1) for mission_k in range(1, T+1)], cat='Binary')
y = pulp.LpVariable.dicts('y', [(turbine_i, turbine_l, vehicle_j) for turbine_i in range(1, M+1) for turbine_l in range(1, M+1) for vehicle_j in range(1, N+1) if turbine_i != turbine_l], cat='Binary')

# Objective function
objective = pulp.lpSum(t[turbine_i, vehicle_j, mission_k] * x[turbine_i, vehicle_j, mission_k] for i in range(1, M+1) for vehicle_j in range(1, N+1) for mission_k in range(1, T+1)) \
            + alpha * pulp.lpSum(B[turbine_i, mission_k] for turbine_i in range(1, M+1) for mission_k in range(1, T+1))

problem += objective

# Constraints
"""
1. Each mission k must be executed at each turbine_i i at least once: 
"""
for turbine_i in range(1, M+1):
    for mission_k in range(1, T+1):
        problem += pulp.lpSum(x[turbine_i, vehicle_j, mission_k] for vehicle_j in range(1, N+1)) >= 1

"""
2. Each vehicle j can execute only one mission at a time: 
"""
# for vehicle_j in range(1, N+1):
    # problem += pulp.lpSum(x[turbine_i, vehicle_j, mission_k] for turbine_i in range(1, M+1) for mission_k in range(1, T+1)) <= 1

"""
3. Vehicle j can travel from turbine i to turbine l with cost C(i, l): 
"""
for turbine_i in range(1, M+1):
    for l in range(1, M+1):
        if turbine_i != turbine_l:
            for vehicle_j in range(1, N+1):
                for mission_k1 in range(1, T+1):
                    for mission_k2 in range(1, T+1):
                        problem += x[turbine_i, vehicle_j, mission_k1] + x[turbine_l, vehicle_j, mission_k2] - y[turbine_i, turbine_l, vehicle_j] <= 1


# Solve the problem
problem.solve()
print("Status:", pulp.LpStatus[problem.status])


# Print the results
for turbine_i in range(1, M+1):
    for vehicle_j in range(1, N+1):
        for mission_k in range(1, T+1):
            if x[turbine_i, vehicle_j, mission_k].value() == 1:
                print("Vehicle", vehicle_j, "executes mission", mission_k, "at turbine", turbine_i)      

# Print the routes
print("Vehicles' routes:")
for turbine_i in range(1, M+1):
    for turbine_l in range(1, M+1):
        if turbine_i != turbine_l:
            for vehicle_j in range(1, N+1):
                if y[turbine_i, turbine_l, vehicle_j].value() == 1:
                    print("Vehicle", vehicle_j, "travels from turbine", turbine_i, "to turbine", turbine_l)
                else:
                    print("Vehicle", vehicle_j, "don't travels from turbine", turbine_i, "to turbine", turbine_l)
                    