#!/usr/bin/env python3.8
# ROS
import rospy
from nav_msgs.msg import Odometry
from rosplan_dispatch_msgs.msg import ActionDispatch # Import the message type for action dispatch
import numpy as np
from std_msgs.msg import Float32  # import the Float32 message type for battery level

import matplotlib.pyplot as plt
from matplotlib import gridspec


class PlotVehicles:       
    def __init__(self):
        rospy.init_node('robot_plotter', anonymous=True)
        self.wait_for_weather_parameters()

        self.current_state_x = 0
        self.low_tides = (2 * (float(self.LOW_TIDES_THRESHOLD) / self.PERIOD_OF_TIDES)) - 1


        number_of_vehicles = self.number_of_vehicles()
        self.positions = [[[], [], []] for _ in range(number_of_vehicles)]


        self.latest_actions = [None for _ in range(number_of_vehicles)] # Store the latest action for each vehicle
        self.battery_levels = [100 for _ in range(number_of_vehicles)]  # Store the battery levels for each vehicle
        
        for vehicle in range(number_of_vehicles):
            rospy.Subscriber('/auv' + str(vehicle) + '/pose_gt', Odometry, self.update_position, vehicle)
            # Subscribe to the action topic for each vehicle
            rospy.Subscriber('/auv' + str(vehicle) + '/rosplan_plan_dispatcher/action_dispatch', ActionDispatch, self.update_action, vehicle)
            rospy.Subscriber('/auv' + str(vehicle) + '/battery_level_emulated', Float32, self.update_battery, vehicle)

    def wait_for_weather_parameters(self):
        self.PERIOD_OF_TIDES = None
        self.LOW_TIDES_THRESHOLD = None

       # Wait until parameters are available
        while not rospy.is_shutdown():
            try:
                self.PERIOD_OF_TIDES = rospy.get_param('/goal_allocation/period_of_tides')
                self.LOW_TIDES_THRESHOLD = rospy.get_param('/goal_allocation/low_tides_threshold')

                # If the parameters are fetched successfully, break the loop
                if self.PERIOD_OF_TIDES is not None and self.LOW_TIDES_THRESHOLD is not None:
                    break
            except KeyError:
                # Parameter not available yet, ignore the exception and retry
                pass  

            rospy.sleep(0.1)
            
    def number_of_vehicles(self):
        return len(rospy.get_param("/goal_allocation/vehicle_idx"))

    def update_position(self, data, vehicle):
        x, y, z = data.pose.pose.position.x, data.pose.pose.position.y, data.pose.pose.position.z
        self.positions[vehicle][0].append(x)
        self.positions[vehicle][1].append(y)
        self.positions[vehicle][2].append(z)

        TRAIL_SIZE = 5000
        for i in range(3):
            if len(self.positions[vehicle][i]) > TRAIL_SIZE:
                self.positions[vehicle][i].pop(0)

    def update_action(self, data, vehicle):
        # Store the latest action for the vehicle
        self.latest_actions[vehicle] = data.name
        
    def update_battery(self, data, vehicle):
        # Store the latest battery level for the vehicle
        self.battery_levels[vehicle] = data.data
        
    def get_tide_state(self):
        time = rospy.get_rostime().to_sec()
        time_in_tide_cycle = time % self.PERIOD_OF_TIDES  # get the current ROS time in seconds and use the remainder after dividing by P to simulate repeating cycle
        tide_state = np.cos(2*np.pi/3 + 2 * np.pi * time_in_tide_cycle / self.PERIOD_OF_TIDES)  # compute tide state as a sine wave
        
        return tide_state
    
    def high_waves(self):
        if rospy.has_param('/goal_allocation/number_of_tides_until_next_high_waves'):   
            number_of_tides_until_next_high_waves = rospy.get_param('/goal_allocation/number_of_tides_until_next_high_waves')
        else:
            rospy.loginfo("Parameter number_of_tides_until_next_high_waves not set")
            
        if rospy.has_param('/goal_allocation/number_of_tides_duration_high_waves'):   
            number_of_tides_duration_high_waves = rospy.get_param('/goal_allocation/number_of_tides_duration_high_waves')
        else:
            rospy.loginfo("Parameter number_of_tides_duration_high_waves not set")
        time = rospy.get_rostime().to_sec()
        total_cycle_time = (number_of_tides_duration_high_waves + number_of_tides_until_next_high_waves)*self.PERIOD_OF_TIDES
        total_cycle_integer = time // total_cycle_time # How many cycles have passed
        time_in_this_cycle = time % total_cycle_time           
                    
        if time_in_this_cycle <= number_of_tides_until_next_high_waves*self.PERIOD_OF_TIDES:
            high_waves = False
        else:
            high_waves = True
            
        return high_waves

    def get_scaled_turbine_coordinates(self):
        return rospy.get_param('/goal_allocation/scaled_turbines_xy')
    
    def high_waves(self):
        number_of_tides_until_next_high_waves = rospy.get_param('/goal_allocation/number_of_tides_until_next_high_waves')
        number_of_tides_duration_high_waves = rospy.get_param('/goal_allocation/number_of_tides_duration_high_waves')
        current_time = rospy.get_rostime().to_sec()
        time_since_start_of_current_cycle = current_time % (self.PERIOD_OF_TIDES * (number_of_tides_until_next_high_waves + number_of_tides_duration_high_waves))
        high_waves_start_time = self.PERIOD_OF_TIDES * number_of_tides_until_next_high_waves
        high_waves_end_time = self.PERIOD_OF_TIDES * (number_of_tides_until_next_high_waves + number_of_tides_duration_high_waves)
        if high_waves_start_time < time_since_start_of_current_cycle < high_waves_end_time: 
            return True
        else:
            return False

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
            marker_size = 3 * (1 / -z_vals[-1]) if z_vals and z_vals[-1] != 0 else 3

            main_ax.plot(x_vals[:min_len], y_vals[:min_len], colors[vehicle], alpha=0.5)
            main_ax.plot(x_vals[-1], y_vals[-1], colors[vehicle]+'o', markersize=marker_size)

            # Display the vehicle name, action, and battery level
            action = self.latest_actions[vehicle]
            if action=='cancel_action':
                action = 'planning'
            if action=='retrieve-data':
                if self.get_tide_state() > self.low_tides and self.high_waves():
                    action = 'retrieve-data (wait for low tides and low waves)'
                elif self.get_tide_state() < self.low_tides and self.high_waves():
                    action = 'retrieve-data (wait for low waves)'
                elif self.get_tide_state() > self.low_tides and not self.high_waves():
                    action = 'retrieve-data (wait for low tides)'
                else:
                    action = 'retrieve-data'
            battery_level = self.battery_levels[vehicle]
            main_ax.text(x_vals[-1], y_vals[-1], 'auv{} ({}): {}%'.format(vehicle, action, int(battery_level)), fontsize=8, color=colors[vehicle])


        for i, (x, y) in enumerate(self.get_scaled_turbine_coordinates()):
            main_ax.plot(x, y, 'kd')
            main_ax.text(x+2, y+2, str(i), fontsize=8, color='black')

        # Add ROS time
        main_ax.text(0.98, 0.98, 'ROS Time: {:.0f} sec'.format(rospy.get_rostime().to_sec()), 
                fontsize=7, horizontalalignment='right', verticalalignment='top', transform=main_ax.transAxes)

        main_ax.axis([-AXIS_LIMITS, AXIS_LIMITS, -AXIS_LIMITS, AXIS_LIMITS])  # set axis limits

        # call plot_tides function to plot tides on a separate subplot
        self.plot_tides(gs)  # Pass the GridSpec object to plot_tides

        plt.pause(0.01)

    def plot_tides(self, gs):
        # create a separate subplot for tides
        ax_tides = plt.subplot(gs[1])  # Place the tide plot in the second slot

        # Generate a sine wave to represent the tide cycle
        x_rad = np.linspace(0, 2*np.pi, self.PERIOD_OF_TIDES*100)  # in radians
        x_time = x_rad / (2 * np.pi) * self.PERIOD_OF_TIDES  # convert radians to time
        y = np.cos(x_rad+2*np.pi/3)

        # Plot the reference sine wave
        ax_tides.plot(x_time, y, 'b--')  # Plot it as a dashed line

        # Draw a horizontal line to indicate the lower third of the sine wave
        ax_tides.axhline(y=self.low_tides, color='k', linestyle='-')
        ax_tides.text(0.1 * self.PERIOD_OF_TIDES, self.low_tides+0.1, 'Low tide threshold', fontsize=8, color='black')

        # Check for high waves and annotate if true
        if self.high_waves():
            # ax_tides.text(self.current_state_x, self.current_state_y, 'High Waves', fontsize=10, color='red')
            ax_tides.text(0.50, 0.55, 'High Waves', fontsize=20, color='red', horizontalalignment='center', verticalalignment='center', transform=ax_tides.transAxes)

        # Mark the current tide state on the sine wave
        self.current_state_x = (rospy.get_rostime().to_sec() % self.PERIOD_OF_TIDES)
        self.current_state_y = self.get_tide_state()
        if self.current_state_y < self.low_tides:
            ax_tides.plot(self.current_state_x, self.current_state_y, 'bo')
            ax_tides.text(self.current_state_x+0.2, self.current_state_y+0.2, 'Low tide', fontsize=8, color='blue')
        else:
            ax_tides.plot(self.current_state_x, self.current_state_y, 'ro')
            ax_tides.text(self.current_state_x+0.2, self.current_state_y+0.2, 'Tide not low', fontsize=8, color='red')

        # Restrict the view to one full tide cycle
        ax_tides.set_xlim(0, self.PERIOD_OF_TIDES)
        x_ticks = [0, self.PERIOD_OF_TIDES/4, self.PERIOD_OF_TIDES/2, 3*self.PERIOD_OF_TIDES/4, self.PERIOD_OF_TIDES]
        x_tick_labels = ['0', '3', '6', '9', '12']
        ax_tides.set_xticks(x_ticks)
        ax_tides.set_xticklabels(x_tick_labels)
        ax_tides.set_ylim(-1, 1)
        

if __name__ == '__main__':
    plotter = PlotVehicles()
    while not rospy.is_shutdown():
        plotter.plot_positions()
        rospy.sleep(0.1)
