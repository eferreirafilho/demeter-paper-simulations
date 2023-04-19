import pulp

# Parameters
N = 3
M = 4
S = 1
T = 10
D = {1: 2, 2: 5, 3: 8}

# Directed graph weights
weights = [
    [0, 2, 5, 3],
    [4, 0, 2, 4],
    [1, 4, 0, 6],
    [3, 5, 3, 0]
]

# Create the model
model = pulp.LpProblem("Autonomous Vehicles Mission Execution", pulp.LpMaximize)

# Variables
# x[i][j][k]: binary variable indicating whether vehicle i executes mission k in turbine j at time step k
x = pulp.LpVariable.dicts("x", [(i,j,k) for i in range(N) for j in range(M) for k in range(T)], cat=pulp.LpBinary)
# y[i][j]: binary variable indicating whether vehicle i visits turbine j at any time step
y = pulp.LpVariable.dicts("y", [(i,j) for i in range(N) for j in range(M)], cat=pulp.LpBinary)

# Objective
model += pulp.lpSum(D[j] * x[i][j][k] for i in range(N) for j in range(M) for k in range(T))

# Constraints
for i in range(N):
    for k in range(T):
        model += pulp.lpSum(x[i][j][k] for j in range(M)) <= 1
for j in range(M):
    for k in range(T):
        model += pulp.lpSum(x[i][j][k] for i in range(N)) == 1
for i in range(N):
    for j in range(M):
        for k in range(T):
            model += x[i][j][k] <= y[i][j]
for i in range(N):
    for j in range(M):
        model += S * pulp.lpSum(x[i][j][k] for k in range(T)) <= T
for i in range(N):
    for j in range(M):
        for k in range(T):
            model += k * x[i][j][k] <= D[j]

# Constraints related to directed graph
for i in range(N):
    for j in range(M):
        for k in range(T-1):
            for l in range(j+1, M):
                # Vehicle can't go from l to j if it didn't visit l yet
                model += x[i][l][k] - x[i][j][k+1] <= 0
                # Vehicle can't go from j to l if it will end up executing a mission at j and there's not enough time to execute a mission at l
                model += (S * (x[i][j][k+1] + x[i][l][k+1])) - (T * (x[i][j][k+1] + x[i][l][k])) - (weights[j][l] * x[i][j][k+1]) <= 0

# Solve the model
model.solve()

# Print the results
print("Objective value:", pulp.value(model.objective))
# for i in range(N)
