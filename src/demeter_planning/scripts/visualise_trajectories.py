#!/usr/bin/env python
# ROS
import rospy
from nav_msgs.msg import Odometry

import matplotlib.pyplot as plt

class PlotVehicles:
    def __init__(self):
        rospy.init_node('robot_plotter', anonymous=True)

        number_of_vehicles = self.number_of_vehicles()
        self.positions = [([], [], []) for _ in range(number_of_vehicles)]

        for vehicle in range(number_of_vehicles):
            rospy.Subscriber('/auv' + str(vehicle) + '/pose_gt', Odometry, self.update_position, vehicle)

    def number_of_vehicles(self):
        return len(rospy.get_param("/goal_allocation/vehicle_idx"))

    def update_position(self, data, vehicle):
        x, y, z = data.pose.pose.position.x, data.pose.pose.position.y, data.pose.pose.position.z
        self.positions[vehicle][0].append(x)
        self.positions[vehicle][1].append(y)
        self.positions[vehicle][2].append(z)

    def get_scaled_turbine_coordinates(self):
        return rospy.get_param('/goal_allocation/scaled_turbines_xy')

    def plot_positions(self):
        AXIS_LIMITS = 130
        colors = ['r', 'b', 'c', 'g', 'm', 'y']  # list of colors
        plt.clf()  # clear the previous plot

        for vehicle, (x_vals, y_vals, z_vals) in enumerate(self.positions):
            if not x_vals or not y_vals: continue

            min_len = min(len(x_vals), len(y_vals))
            marker_size = 3 * (1 / -z_vals[-1]) if z_vals else 3

            plt.plot(x_vals[:min_len], y_vals[:min_len], colors[vehicle], alpha=0.5)
            plt.plot(x_vals[-1], y_vals[-1], colors[vehicle]+'o', markersize=marker_size)

        for x, y in self.get_scaled_turbine_coordinates():
            plt.plot(x, y, 'kd')

        plt.axis([-AXIS_LIMITS, AXIS_LIMITS, -AXIS_LIMITS, AXIS_LIMITS])  # set axis limits
        plt.pause(0.001)

if __name__ == '__main__':
    plotter = PlotVehicles()
    while not rospy.is_shutdown():
        plotter.plot_positions()
        rospy.sleep(0.1)
