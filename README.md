# DEMETER planning package

Package responsible for planning. To be used in the DEMETER Spike Demo (October 2022).

<p align="center">
  <img width="500" height="270" src="https://user-images.githubusercontent.com/92797165/192383504-d70cca79-b639-4cb6-a7f0-90dcb56cfeb1.png">
  
</p>

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

## Actions: move, get_data, transmit_data

Vehicle can only move between allowed waypoints (as will be created in common/problem.pddl).
Vehicles can move to next waypoint in the cable and to the surface. The vehicle cannot move back through cable waypoints (unless this option is activated by the user).

There are basically only two possible missions: "get data mission" and "go to waypoint mission". In the "get data mission", the generated plan will most probably be a sequence of **move** actions, than a **get_data** action and a **transmit_data** action. 

The aim here is to exemplify the integration of systems within DEMETER project. 
Future work will deal with more complex actions and systems, in which automated planning will have a greater impact.

## Waypoints

Inside folder /params, a YAML file define the waypoints. User can define as many waypoints as he/she wants (at least two).

The first waypoint defined in this file will be defined as a "surface waypoint". The vehicle can move from any waypoint to the "surface waypoint". Data can only be transmitted from this waypoint.

The location of the data to be retrieved is set by the GUI dropdown menu.

## To run:
```sh
Change branch to: /rhul
```

### 1st terminal:
Run position_demo.launch
```sh
roslaunch auv_autonomy position_demo.launch
```
This package launches gazebo, the vehicle and the environment. This package is able to receive a pose through /auv/cmd_pose and guide the vehicle to the received pose.

### 2nd terminal:
```sh
roslaunch demeter_planning gui_planning.launch
```
This package launches the planner and a GUI to select mission and start the planner.

<p align="center">
  <img width="400" height="210" src="https://user-images.githubusercontent.com/92797165/194417539-e4f86353-ee23-43cd-98ec-35ba4f70f693.png">
</p>

#### Comments:
- This package creates a problem file (common/problem.pddl), generates a plan (common/plan.pddl) and execute the plan by publishing poses to /auv/cmd_pose.

- **Position is subscribed from topic /auv/pose_gt and a desired pose is published in topic /auv/cmd_pose (in planning: a desired position and a fixed orientation).**

- When the vehicle is not positioned at a waypoint and planning is required, a waypoint with the current position of the vehicle is created. From this waypoint, the vehicle can move to the surface (wp0) or to the closer waypoint in the plan_wp yaml file.

- The plan is a sequence of actions with maximum time for completion. If an action exceeds the time allocated for it (in the domain.pddl file), the action will fail. 


- Action **move** return success if vehicle has reached the waypoint within the time described in common/domain.pddl. Plan fails otherwise.

- Actions **get_data** and **transmit_data** are simulated, vehicle just wait in position for some time (as defined in common/domain.pddl) and the action always returns as successfull.

- The distances that we consider a vehicle is at a waypoint and is at the surface can be manually changed within file scripts/interface.py.

### 3rd terminal (Optional):
To follow the execution of the plan graphically, one can run in a sourced terminal:
```sh
rqt
```
and select plugins > ROSPlan > ROSPlan esterel plan viewer.

<p align="center">
  <img width="300" height="400" src="https://user-images.githubusercontent.com/92797165/192385121-7833e3c9-0568-4d8e-815c-033d6a51d753.png">
</p>

Green are the completed actions. Yellow the dispatched actions. In white, the next planned actions.

## External Actions

To facilitate tests, three external buttons have been created in the gui. Those are not automated planning actions. 

- Button "Send Vehicle To Surface" will publish to /auv/cmd_vel the current vehicle X and Y. Z will be changed to a value close to zero, as defined in scripts/interface.py.  

- Button "Send Vehicle To Origin" will publish to /auv/cmd_vel the position read from /params/origin.yaml with a fixed orientation.

- Button Localize Markers will rotate the vehicle 30 degrees in the yaw axis for each side. This is intended to be used in case the vehicle has trouble localizing the markers.


## GUI Checkbox Options

### Replanning

- If planning or an action fail and replanning is active, the program will keep trying to replan until it is manually halted or it is completed successfully. For each new plan, a user confirmation is needed to dispatch the plan (for safety reasons).

- With replanning active, one should clear the mission before beginning a new one.

### Allow Moving Back Through WPs (For Localizing With Markers)

- This modifies the problem file to allow the vehicle to move backwards between waypoints. This is intended to be used to ease the vehicle localization when it is based on the markers.

### Verify Localization Errors

- This will activate a mode in which an action is only considered as completed if the localization error is not too big (for safety reasons). 
TODO: remap mock localization topic to the real one.



## Demo

A demonstration of a data retrieval mission (data in WP6). The video is accelerated 3 times.

<p align="center">
  <img width="900" height="500" src="https://user-images.githubusercontent.com/92797165/192372867-8df159a4-4557-40fe-ba30-0094fe7a9c2a.gif">
</p>
