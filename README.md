# DEMETER planning package (Pure PDDL approach)


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

## To create a new world

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

### 4th terminal:
```sh
roslaunch demeter_planning allocation.launch
```


## To create a new problem file:

Manually change how_many_turbines_considered in create_problem_instance.py to create a new problem.pddl 

Run the planner