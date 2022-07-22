#!/usr/bin/env python
from signal import pause
from std_srvs.srv import Empty
from turtle import position
from geometry_msgs.msg import PoseStamped
import rospy
from nav_msgs.msg import Odometry
from rosplan_knowledge_msgs.srv import *
from rosplan_knowledge_msgs.msg import KnowledgeItem
from diagnostic_msgs.msg import KeyValue
from p_init import add_fact

def callback(msg):
    x=msg.pose.pose.position.x
    y=msg.pose.pose.position.y
    z=msg.pose.pose.position.z
    #orientation_z=msg.pose.pose.orientation.z
    #orientation_w=msg.pose.pose.orientation.w
    rospy.loginfo('x: {}, y:{}, z:{},' .format(x,y,z))

    # TODO: verify all waypoints
    if z >= -1.2:
        rospy.loginfo("Vehicle on the Surface = wp0")
        add_fact('at','vehicle1','wp0')
        rospy.loginfo("Add Fact: (at vehicle1 wp0)")
        rospy.spin()
        rate.sleep()
    else:
        rospy.loginfo("Vehicle not on surface")
        rospy.loginfo("Submerging...")
        pub = rospy.Publisher('/auv/cmd_pose', PoseStamped, queue_size=10)
        rate = rospy.Rate(10) # 10hz
        cmd_pose=PoseStamped()
        cmd_pose.pose.position.x=x
        cmd_pose.pose.position.y=y
        cmd_pose.pose.position.z=-0.5
        cmd_pose.pose.orientation.x=0
        cmd_pose.pose.orientation.y=0
        cmd_pose.pose.orientation.z=0
        cmd_pose.pose.orientation.w=1
    
        #hello_str = "hello world %s" % rospy.get_time()
        rospy.loginfo('PoseStamped published')
        pub.publish(cmd_pose)
        rospy.spin()
        rate.sleep()
        

if __name__ == '__main__':
 
    # Initialize Node
    rospy.init_node('problem_init', anonymous=True)
    # Subscribe to Pose
    sub = rospy.Subscriber('auv/pose_gt', Odometry, callback)
    #sub = rospy.wait_for_message('auv/pose_gt',Odometry,callback)
    
    # Automatically generate PDDL problem from KB snapshot (e.g. fetch knowledge from KB and create problem.pddl)
    #problem_generation()
    
    #rospy.loginfo('Spin')
    rospy.spin()