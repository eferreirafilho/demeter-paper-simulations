import pulp
import matplotlib.pyplot as plt
import random

def distance(coord1, coord2):
    return ((coord1[0] - coord2[0]) ** 2 + (coord1[1] - coord2[1]) ** 2) ** 0.5

def mtsp(cities, salesmen, depot):
    problem = pulp.LpProblem("Multiple Traveling Salesmen Problem", pulp.LpMinimize)

    # x is a binary variable that indicates whether a salesman travels directly between two cities
    x = pulp.LpVariable.dicts("x", ((i, j) for i in cities for j in cities if i != j), cat="Binary")
    # u is an integer variable that assigns a sequential number to each city in a given tour.
    u = pulp.LpVariable.dicts("u", cities, lowBound=1, upBound=len(cities) - 1, cat="Integer")
    
    # The objective function is to maximize the number of visited cities
    problem += pulp.lpSum(x[i, j] for i in cities for j in cities if i != j)

    # Constraints
    # These constraints ensure that each city is visited exactly once by exactly one salesman. Specifically, for each city that is not the depot, we create two constraints: one that requires that exactly one outgoing edge from city is selected (i.e., one salesman visits city), and one that requires that exactly one incoming edge to city is selected (i.e., city is visited by exactly one salesman).
    # for city in cities:
    #     if city != depot:
    #         problem += pulp.lpSum(x[city, j] for j in cities if city != j) <= 1
    #         problem += pulp.lpSum(x[j, city] for j in cities if city != j) <= 1

    # The triangular inequality is satisfied:
    for i, j in x:
        if i != depot and j != depot:
            problem += u[i] - u[j] + (len(cities) - 1) * x[i, j] <= len(cities) - 2

    # Each salesman starts and ends their tour at the depot:
    problem += pulp.lpSum(x[depot, j] for j in cities if depot != j) == salesmen
    # problem += pulp.lpSum(x[i, depot] for i in cities if depot != i) == salesmen
    
    time_limit = 5000
    print('Time limit: ' + str(time_limit))
    problem += pulp.lpSum(distance(cities[i], cities[j]) * x[i, j] for i in cities for j in cities if i != j) <= time_limit

    # Solve problem
    problem.solve()

    # Extract solution
    tours = []
    visited = [depot]

    for _ in range(salesmen):
        i = depot
        tour = [i]

        while True:
            try:
                i = [j for j in cities if (i, j) in x and x[i, j].varValue == 1 and j != depot and j not in visited][0]
                tour.append(i)
                visited.append(i)
            except IndexError:
                tour.append(depot)
                break

        tours.append(tour[:-1])

    return tours, problem.objective.value()

# Example usage
random.seed(42)
n_cities = 12
n_salesmen = 4
depot = 0
cities = {i: (random.randint(0, 100), random.randint(0, 100)) for i in range(n_cities)}

tours, total_distance = mtsp(cities, n_salesmen, depot)

print("Tours:", tours)
print("Total distance:", total_distance)

# plot cities
x = [city[0] for city in cities.values()]
y = [city[1] for city in cities.values()]

plt.scatter(x, y, color='black')

# plot tours
for i, tour in enumerate(tours):
    if i == 0:
        color_i = 'blue'
    elif i == 1:
        color_i = 'red'
    elif i == 2:
        color_i = 'green'
    else:
        color_i = 'yellow'
    
    tour_cities = [cities[city_idx] for city_idx in tour]
    tour_cities.append(tour_cities[0])  # connect back to the starting city
    
    tour_x = [city[0] for city in tour_cities]
    tour_y = [city[1] for city in tour_cities]
    
    plt.plot(tour_x, tour_y, linestyle='--', linewidth=2, color=color_i)

#add labels
plt.title('City Tours')
plt.xlabel('X')
plt.ylabel('Y')
plt.xticks(range(0, 101, 20))
plt.yticks(range(0, 71, 20))

# show plot
plt.show()

