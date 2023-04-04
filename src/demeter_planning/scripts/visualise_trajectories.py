#!/usr/bin/env python
# ROS
import rospy
from nav_msgs.msg import Odometry

import matplotlib.pyplot as plt

class PlotVehicles:
    def __init__(self):
        rospy.init_node('robot_plotter', anonymous=True)
        
        number_of_vehicles = self.number_of_vehicles()
        self.x_vals = [[] for _ in range(number_of_vehicles)]
        self.y_vals = [[] for _ in range(number_of_vehicles)]
        self.z_vals = [[] for _ in range(number_of_vehicles)]

        for vehicle in range(number_of_vehicles):
            rospy.Subscriber('/auv' + str(vehicle) + '/pose_gt', Odometry, self.update_position, vehicle)

    def number_of_vehicles(self):
        vehicle_idx = rospy.get_param("/goal_allocation/vehicle_idx")
        number_of_vehicles = len(vehicle_idx)
        return number_of_vehicles
            
    def update_position(self, data, vehicle):
        self.x_vals[vehicle].append(data.pose.pose.position.x)
        self.y_vals[vehicle].append(data.pose.pose.position.y)
        self.z_vals[vehicle].append(data.pose.pose.position.z)
        
    def get_scaled_turbine_coordinates(self):
        return rospy.get_param('/build_roadmaps/scaled_turbine_coordinates')

    def plot_positions(self):
        AXIS_LIMITS = 130
        colors = ['r', 'b', 'c', 'g', 'm', 'y']  # list of colors
        plt.clf()  # clear the previous plot
        for vehicle in range(len(self.x_vals)):
            if len(self.x_vals[vehicle]) == 0 or len(self.y_vals[vehicle]) == 0:
                continue  # skip plotting if the list is empty
            # ensure that the x and y lists have the same length
            min_len = min(len(self.x_vals[vehicle]), len(self.y_vals[vehicle]))
            x_vals = self.x_vals[vehicle][:min_len]
            y_vals = self.y_vals[vehicle][:min_len]
            marker_size = 3
            if len(self.z_vals[vehicle]) > 0:  # check that the list is not empty
                z = self.z_vals[vehicle][-1]  # get the last z value
                marker_size = marker_size*(1/-z)  # scale the marker size proportional to z
            plt.plot(x_vals[vehicle], y_vals[vehicle], colors[vehicle], alpha=0.5)
            plt.plot(x_vals[vehicle][-1], y_vals[vehicle][-1], colors[vehicle]+'o', markersize=marker_size)
        
        scaled_turbine_pos = self.get_scaled_turbine_coordinates()
        for turbine in scaled_turbine_pos:
            plt.plot(turbine[0], turbine[1], 'kd')
                    
        plt.axis([-AXIS_LIMITS, AXIS_LIMITS, -AXIS_LIMITS, AXIS_LIMITS])  # set axis limits
        plt.pause(0.001)

if __name__ == '__main__':
    rp = PlotVehicles()
    while not rospy.is_shutdown():
        rp.plot_positions()
        rospy.sleep(0.1)
