# DEMETER planning simulation

## Actions: move, get_data, transmit_data
Main objetive: get_data that is at a specific waypoint.

Vehicle can only move between allowed waypoints (as will be created in common/problem.pddl).

For now, there are basically only two possible missions: "get data mission" and "go to waypoint mission". In the "get data mission", the generated plan will always be a sequence of **move** actions then a **get_data** action and a **transmit_data** action. 
The aim here is to exemplify the integration of systems. 
Future work will deal with more complex actions and systems, in which automated planning will have a greater impact.

## Waypoints

Inside folder /params, a YAML file define the waypoints.

The first waypoint defined in this file will be defined as a "surface waypoint". The vehicle can move from any waypoint to the "surface waypoint". Data can only be transmitted from this waypoint.

The location of the data to be retrieved is set by the GUI dropdown menu.

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

## To run:
```sh
Change branch to: /rhul
```

### 1st terminal:
Run position_demo.launch
```sh
roslaunch auv_autonomy position_demo.launch
```
This package launches gazebo, the vehicle and the enviroment. This package is able to receive a pose through /auv/cmd_pose and guide the vehicle to the received pose.

### 2nd terminal:
```sh
roslaunch demeter_planning gui_planning.launch
```
This package launches the planner and a GUI to send missions to the vehicle:
![image](https://user-images.githubusercontent.com/92797165/192337251-d9ab2764-231f-4d33-927a-3f0e65948d1b.png)


### 3rd terminal (Optional):
To follow the execution of the plan graphically, one can run in a sourced terminal:
```sh
rqt
```
and select plugins > ROSPlan > ROSPlan esterel plan viewer.
![image](https://user-images.githubusercontent.com/92797165/192337883-9ab04f2f-6621-49b0-943b-e2489c155849.png)
In green are the completed actions. In yellow the dispatched actions. In white the next planned actions.


## Comments:

This package creates a problem file (common/problem.pddl), generates a plan (common/plan.pddl) and execute the plan in Gazebo.
Position is subscribed from topic /auv/pose_gt and a desired pose is published in topic /auv/cmd_pose (a desired position and a fixed orientation). 

When the vehicle is not positioned at a waypoint and planning is required, a waypoint with the current position of the vehicle is created. From this waypoint, the vehicle can move to the surface (wp0) or to the closer waypoint in the yaml file.

The plan is a sequence of actions with maximum time for completion. If an action exceeds the time allocated for it (in the domain.pddl file), the action will fail. 
If planning or an action fail and replanning is active (GUI checkbox), the program will keep trying to replan until it is manually halted or it is completed sucessfully.

Action **move** return success if vehicle has reached the waypoint within the time described in common/domain.pddl. Plan fails otherwise.

Actions **get_data** and **transmit_data** are simulated, vehicle just wait in position for some time (as defined in common/domain.pddl) and the action always returns as sucessfull.



