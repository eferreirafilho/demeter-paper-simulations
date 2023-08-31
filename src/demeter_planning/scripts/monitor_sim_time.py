#!/usr/bin/env python

import rospy
from rosgraph_msgs.msg import Clock
import os
import rosnode

MAX_SIM_TIME = 200

def callback(msg):
    current_time = msg.clock.to_sec()
    if current_time >= MAX_SIM_TIME:  #  seconds in simulation time
        kill_all_ros_nodes()    

def main():
    rospy.init_node('time_checker', anonymous=True)
    rospy.Subscriber("/clock", Clock, callback)
    rospy.spin()

def kill_all_ros_nodes():
    os.system("killall -9 python roslaunch rosmaster")
    rospy.signal_shutdown("Time threshold reached!")
    
    nodes = rosnode.get_node_names()
    for node in nodes:
        rosnode.kill_nodes([node])
    rospy.signal_shutdown("Time threshold reached!")
        
if __name__ == '__main__':
    main()