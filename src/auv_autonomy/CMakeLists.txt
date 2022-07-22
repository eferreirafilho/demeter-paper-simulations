cmake_minimum_required(VERSION 2.8.3)
project(auv_autonomy)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp std_msgs nav_msgs geometry_msgs message_generation tf)

## Declare ROS messages and services
#add_message_files(DIRECTORY msg FILES)
#add_service_files(DIRECTORY srv FILES AddTwoInts.srv)

## Generate added messages and services
generate_messages(DEPENDENCIES std_msgs nav_msgs geometry_msgs)

## Declare a catkin package
catkin_package(CATKIN_DEPENDS  std_msgs nav_msgs geometry_msgs roscpp message_runtime tf)

include_directories(include ${catkin_INCLUDE_DIRS})

add_executable(waypoints src/waypoints.cpp)
target_link_libraries(waypoints ${catkin_LIBRARIES})


