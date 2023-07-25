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
        allocation_max_iterations = rospy.get_param('/goal_allocation/max_allocation_iteration')
        GAIN_ITERATIONS_VS_TIME = 400
        # rospy.sleep(allocation_max_iterations/GAIN_ITERATIONS_VS_TIME) # Wait for new allocation, proportional to iterations
        
class DemeterManager:
    def __init__(self):
        self.demeter = None

    def dispatch_mission_sequence(self):
        self.demeter = None
        self.demeter = ExecDemeter()
        self.demeter.clear_KB()
        PopulateKB()
        mission_success = self.demeter.execute_plan()
        rospy.sleep(1)
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

    def log_mission_data(self, mission_sucess):
        vehicle_name = int(self.extract_number_from_string(str(rospy.get_namespace())))
        auv_data = rospy.get_param('/auv1/data_histogram')  # Assuming auv1, replace with your vehicle name dynamically
        allocated_goal = auv_data['index'][-1]  # Get last element
        mission_time = auv_data['time'][-1]  # Get last element
        # Append new mission data to DataFrame
        self.missions_df = self.missions_df.append({
            'vehicle_name': vehicle_name,
            'allocated_goal': allocated_goal,
            'mission_success': mission_sucess,
            'time': mission_time
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
        vehicle_id = self.extract_number_from_string(str(rospy.get_namespace()))
        global_allocation = rospy.get_param("/goals_allocated/allocation")
        param_name = str(rospy.get_namespace() + "goals_allocated")
        current_list = rospy.get_param(param_name)
        rospy.loginfo('{} | current list: {}'.format(param_name, current_list))
        rospy.loginfo('global allocation: {}'.format(global_allocation))

        updated_goal_list = self.update_goal_list(current_list, param_name)
        self.trigger_reallocation_if_necessary(global_allocation, vehicle_id, current_list, updated_goal_list)
        self.trigger_reallocation_for_empty_global_allocation(global_allocation)

    def update_goal_list(self, current_list, param_name):
        if not current_list:
            return []
        
        updated_goal_list = current_list[1:]
        rospy.set_param(param_name, updated_goal_list)
        return updated_goal_list

    def trigger_reallocation_if_necessary(self, global_allocation, vehicle_id, current_list, updated_goal_list):
        if global_allocation[vehicle_id] == []:
            return

        # if len(updated_goal_list) <= 1: 
        #     self.reallocation_trigger.trigger()
        #     rospy.loginfo('Trigger reallocation triggered by vehicle {} having no goals | global_allocation(this vehicle): {} current list: {} updated_goal_list: {}'.format(self.namespace, global_allocation[vehicle_id], current_list, updated_goal_list))
        
        elif not current_list:
            self.reallocation_trigger.trigger()
            rospy.loginfo('Trigger reallocation triggered by vehicle {} | Last goal is being dispatched'.format(self.namespace))

    def trigger_reallocation_for_empty_global_allocation(self, global_allocation):
        if all(not sublist for sublist in global_allocation):
            self.reallocation_trigger.trigger()
            rospy.logwarn('Trigger reallocation trigerred by all vehicles having no goals')
            
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
            if mission_success:
                self.log_mission_data(mission_success)
            self.remove_first_allocated_goal()
        rospy.spin()

if __name__ == '__main__':
    persistent_planning = PersistentPlanning()
    persistent_planning.run()
