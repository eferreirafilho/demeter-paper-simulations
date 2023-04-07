#!/usr/bin/env python
import pulp

# Define the data for the problem
num_customers = 5
num_vehicles = 2
customer_demands = [0, 1, 2, 4, 2, 0]  # demand of each customer (including the depot)
vehicle_capacity = 3
distances = [
    [0, 3, 2, 24, 32, 0],
    [3222, 0, 4, 2, 32, 0],
    [2222, 4, 100, 5, 62, 0],
    [4, 2, 15, 0, 7, 0],
    [3, 3, 6, 72, 0, 0],
    [0, 0, 0, 0, 0, 0]  # distances to/from the depot
]

# Create the LP problem
problem = pulp.LpProblem("Vehicle Routing Problem", pulp.LpMinimize)

# Create decision variables
x = pulp.LpVariable.dicts("Route", [(i, j) for i in range(num_customers + 1) for j in range(num_customers + 1)], cat="Binary")
u = pulp.LpVariable.dicts("UsedCapacity", [i for i in range(num_customers + 1)], lowBound=0, upBound=vehicle_capacity, cat="Continuous")

# Define the objective function
problem += pulp.lpSum([distances[i][j] * x[(i, j)] for i in range(num_customers + 1) for j in range(num_customers + 1)])

# Add constraints
for i in range(num_customers + 1):
    problem += pulp.lpSum([x[(i, j)] for j in range(num_customers + 1)]) == 1
    problem += pulp.lpSum([x[(j, i)] for j in range(num_customers + 1)]) == 1

for i in range(1, num_customers + 1):
    for j in range(1, num_customers + 1):
        if i != j:
            problem += u[i] - u[j] + vehicle_capacity * x[(i, j)] <= vehicle_capacity - customer_demands[j]

# Solve the problem
problem.solve()

# Print the solution
print("Total distance traveled:", pulp.value(problem.objective))
for v in range(num_vehicles):
    print("Route for vehicle {}:".format(v+1))
    route = []
    for i in range(num_customers + 1):
        for j in range(num_customers + 1):
            if pulp.value(x[(i, j)]) == 1 and i == v * num_customers + 1:
                route.append(i)
                break
            elif pulp.value(x[(i, j)]) == 1 and i != 0 and i not in route:
                route.append(i)
    print(" -> ".join(str(r) for r in route))
