#!/usr/bin/env python
# ROS
import rospy
from exec_demeter import ExecDemeter 
from create_problem_instance import PopulateKB
from std_msgs.msg import Bool
import re

class ReallocationTrigger:
    def __init__(self, topic, queue_size):
        self.publisher = rospy.Publisher(topic, Bool, queue_size=queue_size)

    def trigger(self):
        rospy.loginfo('Trigger reallocation')
        self.publisher.publish(True)
        
class DemeterManager:
    def __init__(self):
        self.demeter = None

    def dispatch_mission_sequence(self):
        self.demeter = None
        self.demeter = ExecDemeter()
        PopulateKB()
        mission_success = self.demeter.execute_plan()
        return mission_success

class PersistentPlanning:
    def __init__(self):
        rospy.init_node('persistent_planning')
        self.namespace = rospy.get_namespace()
        self.reallocation_trigger = ReallocationTrigger('/reallocation_trigger', 10)
        self.demeter_manager = DemeterManager()
        self.mission_counter = 0
   
    def check_and_trigger_reallocation(self):
        vehicle_id = self.extract_number_from_string(self.namespace)
        global_allocation = rospy.get_param("/goals_allocated/allocation")
        param_name = "{}goals_allocated".format(self.namespace)

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

        if len(updated_goal_list) <= 1: 
            self.reallocation_trigger.trigger()
            rospy.loginfo('Trigger reallocation triggered by vehicle {} having no goals | global_allocation(this vehicle): {} current list: {} updated_goal_list: {}'.format(self.namespace, global_allocation[vehicle_id], current_list, updated_goal_list))
        
        elif not current_list:
            self.reallocation_trigger.trigger()
            rospy.loginfo('Trigger reallocation triggered by vehicle {} | Last goal is being dispatched'.format(self.namespace))

    def trigger_reallocation_for_empty_global_allocation(self, global_allocation):
        if all(not sublist for sublist in global_allocation):
            self.reallocation_trigger.trigger()
            rospy.loginfo('Trigger reallocation triggered by all vehicles having no goals')
            
    def extract_number_from_string(self, string):
        match = re.search(r'\d+', string)
        if match:
            return int(match.group())
        else:
            return None
            
    def run(self):
        while not rospy.is_shutdown():
            mission_success = self.demeter_manager.dispatch_mission_sequence()
            if not mission_success:
                rospy.logwarn('Mission Failed! ')
            if mission_success:
                rospy.loginfo('Mission Succeeded! ')

            self.check_and_trigger_reallocation()
        rospy.spin()

if __name__ == '__main__':
    persistent_planning = PersistentPlanning()
    persistent_planning.run()
