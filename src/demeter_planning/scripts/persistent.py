#!/usr/bin/env python
# ROS
import rospy
from exec_demeter import ExecDemeter 
from create_problem_instance import PopulateKB
from std_msgs.msg import Bool
import pandas as pd
import os
from datetime import datetime


class ReallocationTrigger:
    def __init__(self, topic, queue_size):
        self.publisher = rospy.Publisher(topic, Bool, queue_size=queue_size)

    def trigger(self):
        rospy.logwarn('Trigger reallocation')
        self.publisher.publish(True)

class DemeterManager:
    def __init__(self):
        self.demeter = None

    def mission_sequence(self):
        self.demeter = ExecDemeter()
        self.demeter.clear_KB()
        PopulateKB()
        while not self.demeter.mission_completed():
            self.demeter.execute_plan()
            # rospy.logwarn('Vehicle: ' + str(rospy.get_namespace()) + 'execute plan')
            self.demeter.clear_KB()
            rospy.sleep(1)
            PopulateKB()  
        self.demeter = None

class PersistentPlanning:
    def __init__(self, number_of_missions):
        rospy.init_node('persistent_planning')
        self.number_of_missions = number_of_missions
        self.reallocation_trigger = ReallocationTrigger('/reallocation_trigger', 10)
        self.demeter_manager = DemeterManager()
        self.mission_counter = 0
        timestamp = datetime.now().strftime('%Y%m%d%H%M%S')  # Get current time in 'YYYYMMDDHHMMSS' format
        # rospy.logwarn(timestamp)
        self.filename = 'missions_{}.csv'.format(timestamp)  # Create a filename with the timestamp
        # rospy.logwarn(self.filename)
        self.missions_df = pd.DataFrame(columns=['vehicle_name', 'allocated_goal', 'time'])

    def log_mission_data(self, vehicle_name, allocated_goal, time):
        # Append new mission data to DataFrame
        self.missions_df = self.missions_df.append({
            'vehicle_name': vehicle_name,
            'allocated_goal': allocated_goal,
            'time': time
        }, ignore_index=True)

        # Save the updated DataFrame to the CSV file
        script_dir = os.path.dirname(os.path.realpath(__file__))
        csv_path = os.path.join(script_dir, self.filename)

        # Check if file exists to avoid writing header multiple times
        file_exists = os.path.isfile(csv_path)

        with open(csv_path, 'a') as f:
            self.missions_df.to_csv(f, sep=';', index=False, header=not file_exists)

        # Clear the DataFrame after writing to file
        self.missions_df = self.missions_df[0:0]

    def remove_first_allocated_goal(self):
        param_name = str(rospy.get_namespace() + "goals_allocated")
        current_list = rospy.get_param(param_name)
        if current_list:
            updated_goal_list = current_list[1:]
            rospy.set_param(param_name, updated_goal_list)
        else:
            # rospy.logwarn('Trigger realloc')
            self.reallocation_trigger.trigger()
            updated_goal_list = []
            
    def run(self):
        while self.mission_counter < self.number_of_missions:
            self.demeter_manager.mission_sequence()
            
            # Get the vehicle name, allocated goal and time
            vehicle_name = str(rospy.get_namespace())
            allocated_goal = rospy.get_param(str(rospy.get_namespace() + "goals_allocated"), [])[0]  # The first goal in the list
            mission_time = rospy.get_rostime().to_sec()  # This gives the time since node has started.
            
            # Log the mission data
            self.log_mission_data(vehicle_name, allocated_goal, mission_time)

            self.remove_first_allocated_goal()
            self.mission_counter += 1

        rospy.spin()

if __name__ == '__main__':
    persistent_planning = PersistentPlanning(15)
    persistent_planning.run()
