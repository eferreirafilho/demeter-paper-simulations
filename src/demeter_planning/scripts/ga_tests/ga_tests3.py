import pulp
from pulp import LpProblem, LpMaximize, LpVariable, LpInteger

# Parameters
N = 1  # Number of autonomous vehicles
M = 5  # Number of wind turbines
S = 2  # Time to execute each mission
# missions = ['measure-vortex', 'get-data']
missions = ['get-data']
time_window = 10  # Time window in which missions should be executed

# Directed graph (roadmap) connecting wind turbines
roadmap = {
    (1, 2): 1,
    (1, 3): 3,
    (1, 4): 5,
    (1, 5): 5,
    (2, 1): 1,
    (2, 3): 1,
    (2, 4): 4,
    (2, 5): 4,
    (3, 1): 3,
    (3, 2): 1,
    (3, 4): 2,
    (3, 5): 2,
    (4, 1): 5,
    (4, 2): 4,
    (4, 3): 2,
    (4, 5): 1,
    (5, 1): 5,
    (5, 2): 4,
    (5, 3): 2,
    (5, 4): 1
}

# Decision variables
mission_vars = LpVariable.dicts("missions", (range(N), roadmap.keys(), missions), 0, None, LpInteger)

# Linear programming problem and objective function
prob = LpProblem("Wind_Turbine_Mission_Scheduling", LpMaximize)
prob += pulp.lpSum([mission_vars[i][edge][m] for i in range(N) for edge in roadmap.keys() for m in missions])

# Constraints
# Constraint 1: Total time spent on missions and traveling should not exceed the time window for each vehicle
for i in range(N):
    prob += pulp.lpSum([(S + roadmap[edge]) * mission_vars[i][edge][m] for edge in roadmap.keys() for m in missions]) <= time_window

# Constraint 2: Missions executed long time ago should have priority
for j in range(M - 1):
    prob += pulp.lpSum([mission_vars[i][(j+1, k+1)][m] for i in range(N) for k in range(M) if (j+1, k+1) in roadmap.keys() for m in missions]) >= pulp.lpSum([mission_vars[i][(j+2, k+1)][m] for i in range(N) for k in range(M) if (j+2, k+1) in roadmap.keys() for m in missions])

# Solve the problem and print the results
status = prob.solve()
print("Status:", pulp.LpStatus[status])

if status == 1:
    for i in range(N):
        for edge in roadmap.keys():
            for m in missions:
                if mission_vars[i][edge][m].value() > 0:
                    print("Vehicle" + str(i+1) + " Mission: " + str(m) + "mission var: " + str(mission_vars[i][edge][m].value()) + " Wind Turbine" + str(edge[0]) + " to Wind Turbine" + str(edge[1]))
                    # print(f"Vehicle {i + 1}, Wind Turbine {edge[0]} -> {edge[1]}, Mission {m}: {mission_vars[i][edge][m].value()}")
else:
    print("No optimal solution found")

# This code defines the parameters, the directed graph (roadmap), the decision variables, the linear programming problem, the objective function, and the constraints while taking the roadmap into account. It then solves the problem and prints the optimal mission schedule for each autonomous vehicle.