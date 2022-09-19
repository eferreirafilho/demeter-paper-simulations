#!/usr/bin/env python


from demeter_plan_exec import DemeterExec
import rospy
from std_msgs.msg import String


flag_test=0

def callback_start_executive(data):
    rospy.loginfo(data.data)
    if data.data=="Start Executive":
        print("ok")
        demeter=DemeterExec()
        demeter.get_data_mission()
        # flag_test=1
        # return

def listener():
    rospy.init_node('gui_subscriber', anonymous=True)
    rospy.Subscriber("chatter", String, callback_start_executive,queue_size=1)
    rospy.spin()

if __name__ == '__main__':
    listener()
    print('main')
    # # rospy.loginfo('Executive started')
    # demeter = DemeterExec()
    # rospy.sleep(1) # Wait for planning
    
    # while demeter.mission_success == False:
    #     demeter.get_data_mission() # Sets mission to get data in the last Waypoint
    #     # demeter.go_to_wp_mission('wp6') # Sets mission to go to specified Waypoint
    #     rospy.sleep(1) # Wait for planning
    # else:
    #     rospy.loginfo('Mission Completed!')   

    # rospy.spin()