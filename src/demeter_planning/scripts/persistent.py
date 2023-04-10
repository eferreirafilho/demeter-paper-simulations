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
    # return the updated list
    # return shifted_list       

if __name__ == '__main__':
    print('Persistent Planning')
    rospy.loginfo('Persistent Planning started')
    rospy.init_node('persistent_planning')
    mission_count=0
    while mission_count < 6:
        populate = PopulateKB()  
        demeter = ExecDemeter()
        #while not demeter.mission_success:
        while not demeter.mission_completed():
            demeter.execute_plan()
            sleep(5)
        demeter.cancel_mission()
        sleep(3)
        
        demeter = None
        populate = None
        sleep(1)
        shift_allocation_param()        
        sleep(5)
        rospy.logwarn('Persistent Goal: ' + str(mission_count) + ' Successfull!!!')
        mission_count+=1
    # populate2 = PopulateKB()  
    # demeter2 = ExecDemeter()
    # sleep(5)
    
    # while not demeter2.mission_success:
    #     demeter2.execute_plan()
    
    # print('Persistent Planning Finished2')
    rospy.spin()
    