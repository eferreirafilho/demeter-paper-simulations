# DEMETER planning package

Package responsible for planning in DEMETER project.

## Prerequisite:

-ROSPlan: 
```sh
sudo apt install flex bison freeglut3-dev libbdd-dev python-catkin-tools ros-$ROS_DISTRO-tf2-bullet
git clone https://github.com/KCL-Planning/ROSPlan.git
```
-Auv Sim:
```sh
git clone https://github.com/codres-ali/auv_sim.git
```

## Pre-planning

A visibility graph is created and saved in scaled_visibility_G_with_turbines.pickle. This consider as many turbines as set in get_data_allocation.yaml and create a roadmap to avoid collisions with turbines.

![visibility_graph](https://user-images.githubusercontent.com/92797165/232097906-bedde59f-6862-4dbf-a4b3-dbc34de8e41d.png)

Vehicles can only move between allowed waypoints (as will be created in /auv{i}/common/problem.pddl). Robots share the same domain.pddl, bbut each one has its own problem.pddl and plan.pddl. Problem and Plan files update dynamically.

There is only one possible mission: "submerge-mission". A mission called "measure-vortex" will also be implemented.


## Actions

Possible PDDl actions: move, submerge-mission, transmit-data, wait-to-recharge, localize-cable, surface.

- Action **move** return success if vehicle has reached the waypoint within the time described in common/auv{i}/domain.pddl. Plan fails otherwise.

- Actions **transmit-data** is simulated, vehicle just wait in position for some time (as defined in common/auv{i}/domain.pddl) and the action always returns as successfull.

- Action **submerge-mission** is sucessfull if last way point in plan_wp was reached, simulating data-retrieval from sensor. 

- Action **wait-to-recharge** recharge the Vehicle (when in surface) and block most of other actions. Note that is possible to set the vehicle to also recharge while executing other surface actions (RECHARGE_RATE == 0 in battery.py).  

## Parameters

original_windfarm_coodinates.yaml: The original position of turbines and corners of Robin Rigg wind farm 
get_data_allocation.yaml: number of vehicles and turbines that have sensors
plan_wp.yaml: waypoints related to submerge-mission action. Relative to the turbines positions, define at least two points.
scaled_turbines_xy.yaml: turbines that are considered scaled to Gazebo size

Inside folder /params, a YAML file define the waypoints. 

The first waypoint defined in this file will be defined as a "surface waypoint". The vehicle can move from any waypoint to the "surface waypoint". Data can only be transmitted from this waypoint.

## To run:

### 1st terminal:
Run position_demo.launch
```sh
roslaunch auv_autonomy position_demo.launch
```
This package launches gazebo, the vehicles and the environment. The vehicles can be set in /auv_autonomy/launch/position_demo.launch and auv_descriptions/launch/multiple_auvs.launch. They have to be set manually for now. This package is able to receive poses through /auv{i}/cmd_pose and guide the vehicle to the received pose.

### 2nd terminal (If pickle graph is not saved):

Run build_graph.launch
```sh
roslaunch demeter_planning roadmap.launch
```

### 3nd terminal:
```sh
roslaunch demeter_planning multi.launch
```

This package launches the allocation of goal to vehicles, the planning system (planning_ns.launch) for each vehicle, the battery emulator, executes and monitor the plans persistently.

#### Comments:
- This package creates problems files dinamically (common/auv{i}/problem.pddl), generates plans (common/auv{i}/plan.pddl) and execute the plan by publishing poses to /auv{i}/cmd_pose.

- **Position is subscribed from topic /auv{i}/pose_gt and a desired pose is published in topic /auv{i}/cmd_pose (in planning: a desired position and a fixed orientation).**

- When the vehicle is not positioned at a waypoint and planning is required, a waypoint with the current position of the vehicle is created. 

- The plan is a sequence of actions with maximum time for completion. If an action exceeds the time allocated for it (in the domain.pddl file), the action will fail. 

- The threadsholds that we consider a vehicle is at a waypoint and is at the surface can be manually changed within file scripts/interface.py.

### 4rd terminal (Optional):
To follow the execution of the plan graphically, one can run in a sourced terminal:
```sh
rqt
```
and select plugins > ROSPlan > ROSPlan esterel plan viewer. Also set the vehicle namespace for the respective vehicle.
Green are the completed actions. Yellow the dispatched actions. In white, the next planned actions.

### 5rd terminal (Optional):
To follow the trajectories of vehicles graphically, one can run in a sourced terminal:
```sh
roslaunch demeter_planning visualise.launch
```

## Demo

A demonstration

The video is accelerated 11 times. Top right shows the trajectories of two vehicles. Bottom right shows parts of the planning for each vehicle.

https://user-images.githubusercontent.com/92797165/232446333-e61e62b5-6f55-4282-9d90-302a4433ec61.mp4

