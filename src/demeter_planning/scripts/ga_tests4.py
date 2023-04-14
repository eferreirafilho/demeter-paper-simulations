
import pulp
import numpy as np

def solve_multi_agent_tsp(distances, num_agents):
    # Create a binary variable for each pair of nodes
    x = pulp.LpVariable.dicts('x', [(i, j, k) for i in range(num_agents) for j in range(num_agents) for k in range(num_agents)],
                                lowBound=0,
                                upBound=1,
                                cat=pulp.LpInteger)

    # Create the problem
    prob = pulp.LpProblem("Multi-Agent TSP Problem", pulp.LpMinimize)

    # Add the objective function
    prob += pulp.lpSum([distances[i][j] * x[(i, j, k)] for i in range(num_agents) for j in range(num_agents) for k in range(num_agents)])

    # Add constraints
    for i in range(num_agents):
        prob += pulp.lpSum([x[(i, j, k)] for j in range(num_agents) for k in range(num_agents)]) == 1
        prob += pulp.lpSum([x[(j, i, k)] for j in range(num_agents) for k in range(num_agents)]) == 1

    # Solve the problem
    prob.solve(pulp.GLPK())

    # Print the status of the solution
    print("Status:", pulp.LpStatus[prob.status])

    # Print the minimum distance found
    print("Minimum Distance:", pulp.value(prob.objective))
    
    return x

distances = np.array([[0, 2, 3], [2, 0, 4], [3, 4, 0]])
num_agents = distances.shape[0]
num_agents = 3
x = solve_multi_agent_tsp(distances, num_agents)

# Print solution
for i in range(num_agents):
    for j in range(num_agents):
        for k in range(num_agents):
            if pulp.value(x[(i, j, k)]) == 1:
                print("Agent {} travels from node {} to node {} in step {}".format(i, j, k, i))
