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
        vehicle_id = self.extract_number_from_string(str(rospy.get_namespace()))
        global_allocation = rospy.get_param("/goals_allocated/allocation")
        param_name = str(rospy.get_namespace() + "goals_allocated")
        current_list = rospy.get_param(param_name)
        rospy.loginfo(str(param_name) + ' | current list: ' + str(current_list))
        rospy.loginfo('global allocation: ' + str(global_allocation))
        updated_goal_list = []
        if current_list:
            updated_goal_list = current_list[1:]
            rospy.set_param(param_name, updated_goal_list) # Just remove one element of vehicles goal list       
            if len(updated_goal_list) <= 1:             # Check if there's only one goal left in the current list
                # Trigger reallocation because the last goal is being dispatched now or vehicle has no goals
                if global_allocation[vehicle_id] != []: # Vehicle was initially allocated to zero turbines -> this vehicle can't trigger reallocation from not having goals
                    self.reallocation_trigger.trigger()
                    rospy.loginfo('Trigger reallocation trigerred by vehicle ' + str(rospy.get_namespace()) + ' having no goals | global_allocation(this vehicle): ' + str(global_allocation[vehicle_id]) + ' current list: ' + str(current_list) + 'updated_goal_list' + str(updated_goal_list))
        else:
            # Trigger reallocation because the last goal is being dispatched now or vehicle has no goals
            if global_allocation[vehicle_id] != []: # Vehicle was initially allocated to zero turbines -> this vehicle can't trigger reallocation from not having goals
                self.reallocation_trigger.trigger()
                rospy.loginfo('Trigger reallocation trigerred by vehicle ' + str(rospy.get_namespace()) + ' | Last goal is being dispatched')
        if all(not sublist for sublist in global_allocation): # All vehicles have no goals
            self.reallocation_trigger.trigger()
            rospy.loginfo('Trigger reallocation trigerred by all vehicles having no goals')
            
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
