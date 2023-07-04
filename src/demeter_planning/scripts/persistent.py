#!/usr/bin/env python
# ROS
import rospy
from exec_demeter import ExecDemeter 
from create_problem_instance import PopulateKB
from std_msgs.msg import Bool
import pandas as pd
import os
from datetime import datetime
import re


class ReallocationTrigger:
    def __init__(self, topic, queue_size):
        self.publisher = rospy.Publisher(topic, Bool, queue_size=queue_size)

    def trigger(self):
        rospy.logwarn('Trigger reallocation')
        self.publisher.publish(True)

class DemeterManager:
    def __init__(self):
        self.demeter = None

    def dispatch_mission_sequence(self):
        self.demeter = ExecDemeter()
        self.demeter.clear_KB()
        PopulateKB()
        mission_success = self.demeter.execute_plan()
        rospy.sleep(1)
        self.demeter = None
        return mission_success

class PersistentPlanning:
    def __init__(self):
        rospy.init_node('persistent_planning')
        self.reallocation_trigger = ReallocationTrigger('/reallocation_trigger', 10)
        self.demeter_manager = DemeterManager()
        self.mission_counter = 0
        # Define the base filename
        script_dir = os.path.dirname(os.path.realpath(__file__))
        base_filename = os.path.join(script_dir, 'missions{}.csv')
        counter = 0
        while os.path.isfile(base_filename.format(counter)):
            counter += 1
        self.filename = base_filename.format(counter)
        self.missions_df = pd.DataFrame(columns=['vehicle_name', 'allocated_goal', 'time'])

    def log_mission_data(self, vehicle_name, allocated_goal, mission_sucess, time):
        # Append new mission data to DataFrame
        self.missions_df = self.missions_df.append({
            'vehicle_name': vehicle_name,
            'allocated_goal': allocated_goal,
            'mission_success': mission_sucess,
            'time': time
        }, ignore_index=True)

        # Save the updated DataFrame to the CSV file
        script_dir = os.path.dirname(os.path.realpath(__file__))
        rospy.logwarn(script_dir)
        csv_path = os.path.join(script_dir, self.filename)
        rospy.logwarn(csv_path)

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
            
            global_allocation = rospy.get_param("/goals_allocated/allocation")
            rospy.logwarn(global_allocation)
            vehicle_id = self.extract_number_from_string(str(rospy.get_namespace()))
            updated_goal_list = []
            if global_allocation[vehicle_id] != []: # Vehicle was initially allocated to zero turbines -> this vehicle can't trigger reallocation grom not having goals
                rospy.logwarn('Trigger reallocation trigerred by vehicle ' + str(rospy.get_namespace()))
                self.reallocation_trigger.trigger()
            
    def extract_number_from_string(self, string):
        match = re.search(r'\d+', string)
        if match:
            return int(match.group())
        else:
            return None
            
    def run(self):
        while not rospy.is_shutdown():
            mission_success = self.demeter_manager.dispatch_mission_sequence()
            rospy.logwarn('mission success: ' + str(mission_success))
            
            # Get the vehicle name, allocated goal and time
            vehicle_name = int(self.extract_number_from_string(str(rospy.get_namespace())))
            if rospy.get_param(str(rospy.get_namespace() + "goals_allocated")) != []:
                allocated_goal = rospy.get_param(str(rospy.get_namespace() + "goals_allocated"), [])[0]  # The first goal in the list
            else:
                allocated_goal = []
            mission_time = rospy.get_rostime().to_sec()
            # Log the mission data
            self.log_mission_data(vehicle_name, allocated_goal, mission_success, mission_time)

            self.remove_first_allocated_goal()

        rospy.spin()

if __name__ == '__main__':
    persistent_planning = PersistentPlanning()
    persistent_planning.run()
