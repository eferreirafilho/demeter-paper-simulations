import itertools
import random
import sys
from typing import List, Tuple

class Turbine:
    def __init__(self, index: int, get_data_last_time: int, measure_vortex_last_time: int):
        self.index = index
        self.get_data_last_time = get_data_last_time
        self.measure_vortex_last_time = measure_vortex_last_time

class Roadmap:
    def __init__(self, weights: List[List[int]]):
        self.weights = weights

class Vehicle:
    def __init__(self, index: int, current_location: int):
        self.index = index
        self.current_location = current_location
        self.time = 0

def get_allocation_order(M: int, N: int, turbines: List[Turbine], roadmap: Roadmap, vehicles: List[Vehicle]) -> List[Tuple[int, int, str]]:
    missions = ["get-data", "measure-vortex"]
    allocations = []

    while True:
        min_time = sys.maxsize
        chosen_vehicle = None
        chosen_turbine = None
        chosen_mission = None

        for vehicle in vehicles:
            for turbine in turbines:
                for mission in missions:
                    time_to_reach = roadmap.weights[vehicle.current_location][turbine.index]
                    time_to_execute = t if mission == "get-data" else t

                    if mission == "get-data":
                        time_since_last_mission = vehicle.time + time_to_reach - turbine.get_data_last_time
                    else:
                        time_since_last_mission = vehicle.time + time_to_reach - turbine.measure_vortex_last_time

                    mission_priority = time_since_last_mission

                    total_time = time_to_reach + time_to_execute

                    if mission_priority > 0 and total_time < min_time:
                        min_time = total_time
                        chosen_vehicle = vehicle
                        chosen_turbine = turbine
                        chosen_mission = mission

        if chosen_vehicle is not None and chosen_turbine is not None and chosen_mission is not None:
            chosen_vehicle.time += min_time
            chosen_vehicle.current_location = chosen_turbine.index
            if chosen_mission == "get-data":
                chosen_turbine.get_data_last_time = chosen_vehicle.time
            else:
                chosen_turbine.measure_vortex_last_time = chosen_vehicle.time
            allocations.append((chosen_vehicle.index, chosen_turbine.index, chosen_mission))
        else:
            break

    return allocations


# Example usage:
M = 5
N = 2
t = 10
turbines = [
    Turbine(0, 0, 0),
    Turbine(1, 0, 0),
    Turbine(2, 0, 0),
    Turbine(3, 0, 0),
    Turbine(4, 0, 0)
]

roadmap = Roadmap([
    [0, 5, 7, 3, 6],
    [5, 0, 3, 6, 2],
    [7, 3, 0, 4, 6],
    [3, 6, 4, 0, 1],
    [6, 2, 6, 1, 0]
])

vehicles = [
    Vehicle(0, 0),
    Vehicle(1, 4)
]

allocations = get_allocation_order(M, N, turbines, roadmap, vehicles)
print(allocations)