#!/usr/bin/env python
# ROS
import rospy
from exec_demeter import ExecDemeter 
from create_problem_instance import PopulateKB
from std_msgs.msg import Bool

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
            rospy.logwarn('Vehicle: ' + str(rospy.get_namespace()) + 'execute plan')
            self.demeter.clear_KB()
            PopulateKB()  
        self.demeter = None

class PersistentPlanning:
    def __init__(self, number_of_missions):
        rospy.init_node('persistent_planning')
        self.number_of_missions = number_of_missions
        self.reallocation_trigger = ReallocationTrigger('/reallocation_trigger', 10)
        self.demeter_manager = DemeterManager()
        self.mission_counter = 0

    def remove_first_allocated_goal(self):
        param_name = str(rospy.get_namespace() + "goals_allocated")
        current_list = rospy.get_param(param_name)
        if current_list:
            updated_goal_list = current_list[1:]
            rospy.set_param(param_name, updated_goal_list)
        else:
            self.reallocation_trigger.trigger()
            updated_goal_list = []

    def run(self):
        while self.mission_counter < self.number_of_missions:
            self.demeter_manager.mission_sequence()
            self.remove_first_allocated_goal()
            self.mission_counter += 1
        rospy.spin()

if __name__ == '__main__':
    persistent_planning = PersistentPlanning(15)
    persistent_planning.run()
