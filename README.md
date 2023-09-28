# DEMETER planning package

Package responsible for planning in DEMETER project.

## Demos

The video are accelerated 50 times. Top right shows the trajectories of vehicles.

2 AUVs and 30 OWTs:

[![Watch the video](https://img.youtube.com/vi/G-ubrDvju9o/maxresdefault.jpg)](https://youtu.be/G-ubrDvju9o)

4 AUVs and 60 OWTs:

[![Watch the video](https://img.youtube.com/vi/oD5WU7dRKI8/maxresdefault.jpg)](https://youtu.be/oD5WU7dRKI8)


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

A visibility graph is created and saved in scaled_visibility_G_with_turbines.pickle. This consider as many turbines as set in vehicles_in_the_system.yaml and create a roadmap to avoid collisions with turbines.

![visibility_graph](https://user-images.githubusercontent.com/92797165/232097906-bedde59f-6862-4dbf-a4b3-dbc34de8e41d.png)

Vehicles can only move between allowed waypoints (as will be created in /auv{i}/common/problem.pddl). Robots share the same domain.pddl, but each one has its own problem.pddl and plan.pddl. Problem and Plan files update dynamically.

There is only one possible mission: "retrieve-data".


## Actions

Possible PDDl actions: move, retrieve-data, upload-data-histograms, harvest-energy, localize-cable, surface.

- Action **move** return success if vehicle has reached the waypoint within the time described in common/auv{i}/domain.pddl. Plan fails otherwise.

- Action **localize-cable** return success if vehicle has localized the cable. The localization action is a mock action. Vehicle dives a little to simulate it is localizaing the cable.

- Actions **upload-data-histograms** is simulated, vehicle just wait in position for some time (as defined in common/auv{i}/domain.pddl) and the action always returns as successfull.

- Action **retrieve-data** is sucessfull if last way point in underwater_waypoints was reached, simulating data-retrieval from sensor. 

- Action **harvest-energy** recharge the Vehicle (when in surface) and block most of other actions. Note that is possible to set the vehicle to also recharge while executing other surface actions (RECHARGE_RATE == 0 in battery.py).  

- Action **surface** send the Vehicle to the surface.  

## Parameters

original_windfarm_coodinates.yaml: The original position of turbines and corners of Robin Rigg wind farm 
vehicles_in_the_system.yaml: Index of the vehicles currently in the system
underwater_waypoints.yaml: Those are the waypoints that the vehicle will follow in retrieve-mission action. Last waypoint is the sensor location.
scaled_turbines_xy.yaml: turbines that are considered scaled to Gazebo size

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

## To change the number of vehicles:

Manually change several .launch files and one parameter to reflect how many robots there are in the system.

#TODO: Automate all this

In multi_auv_planning.launch, create one of this to each vehicle auv{i}:
 
   <!-- Launch planning_ns.launch with namespace=auv0 -->
  <include file="$(find demeter_planning)/launch/planning_ns.launch">
    <arg name="namespace" value="auv0" />
  </include>

In /src/auv_autonomy/launch/position_demo.launch, create one of this to each vehicle auv{i}:

  <include file="$(find auv_control)/launch/position_hold.launch">
		<arg name="model_name" value="auv0"/>
	</include>

In /src/auv_descriptions/launch/multiple_auvs.launch, create one of this to each vehicle auv{i} and change initial position:

<include file="$(find auv_descriptions)/launch/upload_auv.launch">
		<arg name="namespace" value="auv0"/>
    <arg name="x" value="20"/>
    <arg name="y" value="20"/>
    <arg name="z" value="-1"/>
	</include>

In /src/demeter_planning/launch/planning_ns.launch, create one of this to each vehicle auv{i}:

<include file="$(find demeter_planning)/launch/planning_ns.launch">
  <arg name="namespace" value="auv0" />
</include>

Change demeter_planning/param/vehicles_in_the_system.yaml to reflect the number of vehicles in the system

### Alternatively: to change the number of vehicles:

Change branch, example: runt5_v1 has 5 wind turbines and one vehicle. In most branches, some parameters have been tuned. Specificaly, one might consider tuning:

demeter_planning/param/sim_stop_time.yaml (Number of iterations that the simulation will run)
demeter_planning/param/tides.yaml (Parameters related to the tides.)

In goal_allocation_sa.py, parameters related to the allocation of vehicles to turbines can be tuned. Abrupt changes can make the allocation unstable.

self.MAX_BALANCE_DIFFERENCE = 2 # Number of unbalance allocation allowed
self.MAX_ALLOCATION_ITERATION = 25000 # Time allowed for the allocation algorithm

Weighted sum multi objective optimization
self.BETA = 100 # Increase to focus on more allocations
self.ALPHA = 10  # Increase to focus on travelling less
self.ZETA = 0.1 # Increase to focus on visiting turbines not visited lately

## To change the number of turbines:

Launch /auv_autonomy/launch/position_demo.launch

Manually set the number of desired number of turbines in self.NUMBER_OF_TURBINES_CONSIDERED in demeter_planning/scripts/build_roadmaps.py

Launch /auv_autonomy/launch/build_roadmaps.launch

Kill everything (a new .pickle have been saved)

Launch /auv_autonomy/launch/position_demo.launch

#TODO: Automate all this

## To run with vehicle being allocated to random turbines:

Change self.RANDOM_ALLOCATION = False to True in demeter_planning/scripts/create_problem_instance.py

## To toggle gazebo visualization:

comment/uncomment line  <!-- <arg name="gui" default="false"/> --> in auv_world.launch
 
