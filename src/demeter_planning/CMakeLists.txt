cmake_minimum_required(VERSION 2.8.3)
project(demeter_planning)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp std_msgs geometry_msgs message_generation tf gazebo_ros)

## Declare ROS messages and services

## Generate added messages and services
generate_messages(DEPENDENCIES std_msgs geometry_msgs)

## Declare a catkin package
catkin_package(CATKIN_DEPENDS std_msgs geometry_msgs roscpp message_runtime gazebo_ros)

install(DIRECTORY models
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

include_directories(include ${catkin_INCLUDE_DIRS})

catkin_install_python(PROGRAMS
  DESTINATION $(CATKIN_PACKAGE_BIN_DESTINATION)
)
