#!/usr/bin/env python
# ROS
import rospy
from exec_demeter import ExecDemeter 
from create_problem_instance import PopulateKB
from time import sleep

def shift_allocation_param():
    param_name = str(rospy.get_namespace() + "goals_allocated")
    # get the current list from the parameter server
    current_list = rospy.get_param(param_name)
    print(current_list)
    # shift the list elements to the left by the given amount
    shifted_list = current_list[1:] + current_list[:1]
    # write the updated list back to the parameter server
    rospy.set_param(param_name, shifted_list)
    print(shifted_list)

if __name__ == '__main__':
    print('Persistent Planning')
    rospy.loginfo('Persistent Planning started')
    rospy.init_node('persistent_planning')
    NUMBER_OF_MISSIONS = 15 # For each vehicle
    
    mission_counter=0
    while mission_counter < NUMBER_OF_MISSIONS:
        demeter = ExecDemeter()
        demeter.clear_KB()
        sleep(1)
        populate = PopulateKB()  
        #while not demeter.mission_success:
        while not demeter.mission_completed():
            sleep(1)
            
            demeter.execute_plan()
            rospy.logwarn('Vehicle: ' + str(rospy.get_namespace()) + 'execute plan')
            sleep(1)
            demeter.clear_KB()
            populate = PopulateKB()  
            
        # demeter.clear_KB()
        sleep(1)
        demeter = None
        populate = None
        sleep(1)
        shift_allocation_param()        
        sleep(1)
        rospy.logwarn('Persistent Goal: ' + str(mission_counter) + ' Successfull!!!')
        mission_counter+=1
    rospy.spin()
    