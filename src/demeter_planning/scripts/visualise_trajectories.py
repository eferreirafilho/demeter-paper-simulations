#!/usr/bin/env python
# ROS
import rospy
from nav_msgs.msg import Odometry
from rosplan_dispatch_msgs.msg import ActionDispatch # Import the message type for action dispatch
import numpy as np

import matplotlib.pyplot as plt
from matplotlib import gridspec


class PlotVehicles:
    PERIOD_OF_TIDES = rospy.get_param('/period_of_tides')
    LOW_TIDES_THREDSHOLD = rospy.get_param('/low_tides_thredshold')
    def __init__(self):
        rospy.init_node('robot_plotter', anonymous=True)
        
        self.current_state_x = 0
        self.low_tides = (2*(self.LOW_TIDES_THREDSHOLD/self.PERIOD_OF_TIDES))-1

        number_of_vehicles = self.number_of_vehicles()
        self.positions = [([], [], []) for _ in range(number_of_vehicles)]
        self.latest_actions = [None for _ in range(number_of_vehicles)] # Store the latest action for each vehicle

        for vehicle in range(number_of_vehicles):
            rospy.Subscriber('/auv' + str(vehicle) + '/pose_gt', Odometry, self.update_position, vehicle)
            # Subscribe to the action topic for each vehicle
            rospy.Subscriber('/auv' + str(vehicle) + '/rosplan_plan_dispatcher/action_dispatch', ActionDispatch, self.update_action, vehicle)

    def number_of_vehicles(self):
        return len(rospy.get_param("/goal_allocation/vehicle_idx"))

    def update_position(self, data, vehicle):
        x, y, z = data.pose.pose.position.x, data.pose.pose.position.y, data.pose.pose.position.z
        self.positions[vehicle][0].append(x)
        self.positions[vehicle][1].append(y)
        self.positions[vehicle][2].append(z)

    def update_action(self, data, vehicle):
        # Store the latest action for the vehicle
        self.latest_actions[vehicle] = data.name
        
    def get_tide_state(self):
        time = rospy.get_rostime().to_sec()
        time_in_tide_cycle = time % self.PERIOD_OF_TIDES  # get the current ROS time in seconds and use the remainder after dividing by P to simulate repeating cycle
        tide_state = np.cos(2*np.pi/3 + 2 * np.pi * time_in_tide_cycle / self.PERIOD_OF_TIDES)  # compute tide state as a sine wave
        return tide_state

    def get_scaled_turbine_coordinates(self):
        return rospy.get_param('/goal_allocation/scaled_turbines_xy')


    def plot_positions(self):
        AXIS_LIMITS = 130
        colors = ['r', 'b', 'c', 'g', 'm', 'y']  # list of colors

        plt.figure(1)
        plt.clf()  # clear the previous plot

        gs = gridspec.GridSpec(2, 1, height_ratios=[5, 1])  # This means that the first plot is three times the height of the second plot.
        main_ax = plt.subplot(gs[0])  # Place the first plot in the first slot

        for vehicle, (x_vals, y_vals, z_vals) in enumerate(self.positions):
            if not x_vals or not y_vals: continue

            min_len = min(len(x_vals), len(y_vals))
            marker_size = 3 * (1 / -z_vals[-1]) if z_vals else 3

            main_ax.plot(x_vals[:min_len], y_vals[:min_len], colors[vehicle], alpha=0.5)
            main_ax.plot(x_vals[-1], y_vals[-1], colors[vehicle]+'o', markersize=marker_size)

            # Display the vehicle name and action
            action = self.latest_actions[vehicle]
            if action=='cancel_action':
                action = 'planning'
            elif action=='retrieve-data' and self.current_state_x > self.low_tides:
                print(action)
                action = 'retrieve-data (wait for low tide)'
            main_ax.text(x_vals[-1], y_vals[-1], 'auv{} ({})'.format(vehicle, action), fontsize=8, color=colors[vehicle])

        for i, (x, y) in enumerate(self.get_scaled_turbine_coordinates()):
            main_ax.plot(x, y, 'kd')
            main_ax.text(x+2, y+2, str(i), fontsize=8, color='black')

        main_ax.axis([-AXIS_LIMITS, AXIS_LIMITS, -AXIS_LIMITS, AXIS_LIMITS])  # set axis limits

        # call plot_tides function to plot tides on a separate subplot
        self.plot_tides(gs)  # Pass the GridSpec object to plot_tides

        plt.pause(0.001)

    def plot_tides(self, gs):
        # create a separate subplot for tides
        ax_tides = plt.subplot(gs[1])  # Place the tide plot in the second slot

        # Generate a sine wave to represent the tide cycle
        x = np.linspace(0, 2*np.pi, self.PERIOD_OF_TIDES*100)
        y = np.cos(x+2*np.pi/3)

        # Plot the reference sine wave
        ax_tides.plot(x, y, 'b--')  # Plot it as a dashed line


        # Draw a horizontal line to indicate the lower third of the sine wave
        ax_tides.axhline(y=self.low_tides, color='k', linestyle='-')
        ax_tides.text(0.3, self.low_tides+0.1, 'Low tide threshold', fontsize=8, color='black')

        # Mark the current tide state on the sine wave
        self.current_state_x = 2 * np.pi * (rospy.get_rostime().to_sec() % self.PERIOD_OF_TIDES) / self.PERIOD_OF_TIDES
        
        # print('current_state: ' + str(current_state_x))
        # print(rospy.get_rostime().to_sec())
        current_state_y = self.get_tide_state()
        if current_state_y < self.low_tides:
            ax_tides.plot(self.current_state_x, current_state_y, 'bo')
            ax_tides.text(self.current_state_x+0.1, current_state_y+0.1, 'Low tide', fontsize=8, color='blue')
        else:
            ax_tides.plot(self.current_state_x, current_state_y, 'ro')
            ax_tides.text(self.current_state_x+0.1, current_state_y+0.1, 'Tide not low', fontsize=8, color='red')
            
        # Restrict the view to one full tide cycle
        ax_tides.set_xlim(0, 2*np.pi)   
        ax_tides.set_ylim(-1, 1)

if __name__ == '__main__':
    plotter = PlotVehicles()
    while not rospy.is_shutdown():
        plotter.plot_positions()
        rospy.sleep(0.1)
