#!/usr/bin/env python

import rospy
from rosgraph_msgs.msg import Clock
import os
import rosnode

MAX_SIM_TIME = rospy.get_param('/monitor_sim_time/sim_stop_time')

def callback(msg):
    current_time = msg.clock.to_sec()
    if current_time >= MAX_SIM_TIME:  #  seconds in simulation time
        kill_all_ros_nodes()    

def main():
    rospy.init_node('time_checker', anonymous=True)
    rospy.Subscriber("/clock", Clock, callback)
    rospy.spin()

def kill_all_ros_nodes():
    os.system('rosnode kill -a')  # Kills all nodes
    os.system("killall -9 rosmaster")
    os.system("killall -9 roscore")
    os.system("killall -9 rosout")
        
if __name__ == '__main__':
    main()