# DEMETER planning simulation

## Simple simulation, actions: move, get_data, transmit_data
Goal: get_data that is at a specific waypoint.

Vehicle can only move between allowed waypoints (as will be created in common/problem.pddl).

For now, the generated plan will always be a sequence of **move** actions than a **get_data** action and a **transmit_data** action. 
The aim here is to exemplify the integration of systems. 
Future work will deal with more complex actions and systems, in which automated planning will have a greater impact.

## Prerequisite (all in this repo):

-ROSPlan: 
```sh
git clone https://github.com/KCL-Planning/ROSPlan.git
```

-ROSPlan Demos: 
```sh
git clone https://github.com/KCL-Planning/rosplan_demos.git
```
-Auv Sim:
```sh
git clone https://github.com/codres-ali/auv_sim.git
```
-Occupancy grid utils
```sh
git clone https://github.com/clearpathrobotics/occupancy_grid_utils
```
-demeter_planning

## To run:

### 1st terminal:
Run position_hold.launch
```sh
roslaunch auv_autonomy position_hold.launch
```

### 2nd terminal:
```sh
roslaunch demeter_planning planning.launch
```

### 3rd terminal (Optional):
To follow the execution of the plan graphically, one can run:
```sh
rqt
```
and select plugins > ROSPlan > ROSPlan esterel plan viewer

## Comments:

This creates a problem file (common/problem.pddl), generates a plan (common/plan.pddl) and execute the plan in Gazebo.

The plan is a sequence of actions with maximum time for completion.

Action **move** return success if vehicle has reached the waypoint within the time described in common/domain.pddl. Plan fails otherwise.

Actions **get_data** and **transmit_data** are simulated, vehicle just wait in position and action always returns as sucessfull.

For now, the vehicle is assumed to start at the surface and problem.pddl is generated accordindly.

### To do:

TODO: Deal with situations in which the plan fail.

TODO: Add other goals (data in other wapoints, move goal, etc.)

TODO: Remove the assumption that vehicle must start at the surface.
