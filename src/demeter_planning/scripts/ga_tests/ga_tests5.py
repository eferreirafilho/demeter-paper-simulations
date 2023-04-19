#Consider an offshore wind turbine farm with M turbines and N autonomous vehicles. 
# There is a directed roadmap connecting each turbine, vehicles can move between the turbines with cost given by the weights of the roadmap. 
# Vehicles have to perform a mission in each turbine. Each mission takes a time t to be executed and has a variable B associated with. 
# The variable B states when it was the last time this mission was executed.
# I want to get the allocation and order of each vehicle and missions, minimizing the total time for all the missions to be executed,
# while giving priority for missions that haven't been executed for a long time.
from pulp import *

# Define the input data
M = 3
N = 2
missions = {1: {2: [1], 3: [2]}, 2: {3: [3]}}

time_to_execute = {(1,2): 2, (1,3): 3, (2,3): 1}
last_execution_time = {1: 0, 2: 1, 3: 2}

# Define the sets
T = range(1, M+1)
V = range(1, N+1)

x = {}

# Define the decision variables
for i in T:
    for j in T:
        for v in V:
            if i in missions and j in missions[i]:
                for k in missions[i][j]:
                    x[(i,j,v,k)] = LpVariable("x_{}_{}_{}_{}".format(i,j,v,k), 0, 1, LpBinary)
            elif i not in missions:
                x[(i,j,v,0)] = LpVariable("x_{}_{}_{}_0".format(i,j,v), 0, 0, LpBinary)
print(x)

# Define the objective function
prob = LpProblem("OffshoreWindTurbineFarm", LpMinimize)
prob += lpSum(time_to_execute[i,j] * x[(i,j,v,k)] for i in T for j in T for v in V for k in missions.get(i, {}).get(j, []) if (i,j,v,k) in x) + lpSum(last_execution_time[k] * lpSum(x[(i,j,v,k)] - x[(j,i,v,k)]) for i in T for j in T for v in V for k in missions.get(i, {}).get(j, []) if (i,j,v,k) in x)


# Define the constraints
for i in T:
    for j in T:
        for v in V:
            for k in range(M+1):
                if (i,j,v,k) in x:
                    prob += lpSum(x[(i,j,v,k)] for j in T for k in missions.get(i, {}).get(j, [])) - lpSum(x[(j,i,v,k)] for j in T for k in missions.get(j, {}).get(i, [])) == 0
                    prob += lpSum(x[(i,j,v,k)] for j in T for k in missions.get(i, {}).get(j, [])) == 1

for j in T:
    for v in V:
        prob += lpSum(x[(i,j,v,k)] for i in T for k in missions.get(i, {}).get(j, [])) == 1

for i in T:
    for j in T:
        for k in missions.get(i, {}).get(j, []):
            prob += lpSum(x[(i,j,v,k)] for v in V) <= 1

# Solve the problem
prob.solve()

# Print the results
for i in T:
    for v in V:
        for j in T:
            if i in missions and j in missions[i]:
                for k in missions[i][j]:
                    if x[(i,j,v,k)].varValue == 1:
                        print("Vehicle {} executes mission {} at turbine {} and travels to turbine {}".format(v,k,i))
            else:
                if x[(i,j,v,0)].varValue == 1:
                    print("Vehicle {} stays at turbine {}".format(v,i))
