# DEMETER planning simulation

## Simple simulation, actions: move, get_data, transmit_data
Goal: get_data that is at a specific waypoint.
Vehicle can only move between allowed waypoints (as described in common/problem.pddl).

## Prerequisite (all in this repo):

-ROSPlan: 
  git clone https://github.com/KCL-Planning/ROSPlan.git
-ROSPlan Demos: 
  git clone https://github.com/KCL-Planning/rosplan_demos.git
-Auv Sim:
  git clone https://github.com/codres-ali/auv_sim.git
-Occupancy grid utils
-demeter_planning

## To run:

### 1st terminal:
  roslaunch auv_autonomy waypoints.launch
  wait until last waypoint is 

### 2st terminal:
  roslaunch demeter_planning planning.launch

This creates a problem file (commom/problem.pddl), generates a plan (commom/plan.pddl) and execute the plan in Gazebo.

Action **move** return success if vehicle has reached the waypoint within the time described in commom/domain.pddl. Plan fails otherwise.

Actions **get_data** and **transmit_data** are simulated, vehicle just wait in position and action always returns as sucessfull.

For now, the vehicle is assumed to start at the surface and problem.pddl is generated accordindly.

### To do:

TODO: Deal with situations in which the plan fail.

TODO: Add other goals (data in other wapoints, move goal, etc.)

TODO: Remove the assumption that vehicle must start at the surface.
