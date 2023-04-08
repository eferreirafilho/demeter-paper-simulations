cmake_minimum_required(VERSION 2.8.3)
project(demeter_planning)

## Find catkin and any catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp std_msgs geometry_msgs message_generation tf gazebo_ros)

## Declare ROS messages and services
#add_message_files(DIRECTORY msg FILES Num.msg)
# add_service_files(DIRECTORY srv FILES AddTwoInts.srv)
# add_service_files(DIRECTORY srv FILES multiplier.srv)
# add_service_files(DIRECTORY srv FILES problem_reduction.srv)


## Generate added messages and services
generate_messages(DEPENDENCIES std_msgs geometry_msgs)

## Declare a catkin package
catkin_package(CATKIN_DEPENDS std_msgs geometry_msgs roscpp message_runtime gazebo_ros)

install(DIRECTORY models
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

include_directories(include ${catkin_INCLUDE_DIRS})

#add_executable(manc_lidarsim src/manc_lidarsim.cpp src/LidarSim.cpp)
#add_dependencies(odometry_listener tutorials_generate_messages_cpp)
#target_link_libraries(manc_lidarsim ${catkin_LIBRARIES})

catkin_install_python(PROGRAMS
  DESTINATION $(CATKIN_PACKAGE_BIN_DESTINATION)
)
