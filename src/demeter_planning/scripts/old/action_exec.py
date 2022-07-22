#!/usr/bin/env python

import rospy
from rosplan_dispatch_msgs.msg import ActionDispatch, ActionFeedback, CompletePlan
from geometry_msgs.msg import PoseStamped


def publish_wp(x,y,z):
    pub = rospy.Publisher('/auv/cmd_pose', PoseStamped, queue_size=10)
    rate = rospy.Rate(10) # 10hz
    cmd_pose=PoseStamped()
    cmd_pose.pose.position.x=x
    cmd_pose.pose.position.y=y
    cmd_pose.pose.position.z=z
    cmd_pose.pose.orientation.x=0
    cmd_pose.pose.orientation.y=0
    cmd_pose.pose.orientation.z=0
    cmd_pose.pose.orientation.w=1

    while not rospy.is_shutdown():
        pub.publish(cmd_pose)
        rospy.loginfo('Pose Published x: '+ str(x) +' y: ' + str(y) +' z: '+ str(z))
        
        rate.sleep()
            
def publish_action_feedback():
    # Publish action feedback
    feedback_msg = ActionFeedback()
    feedback_msg.action_id = 0
    feedback_msg.status = feedback_msg.ACTION_SUCCEEDED_TO_GOAL_STATE
    print(feedback_msg)
    feedback_publisher = rospy.Publisher('/rosplan_plan_dispatcher/action_feedback',ActionFeedback,queue_size=10)
    feedback_publisher.publish(feedback_msg)
            

def dispatch_callback(msg):
    
    # Get Planning Waypoints Parameters from file
    
    rospy.loginfo("Callback dispatcher subscriber")
    
    if(msg.name == 'move'):
        # msg: vehicle, from, to
        move_to_wp=((msg.parameters[2]).value)[2] #Index of waypoint vehicle has to move to
        plan_wps = [rospy.get_param("/rosplan_demeter_exec/plan_wp_x"), rospy.get_param("/rosplan_demeter_exec/plan_wp_y"),rospy.get_param("/rosplan_demeter_exec/plan_wp_z")]
        
        rospy.loginfo('Next WP')
        publish_wp(plan_wps[0][int(move_to_wp)],plan_wps[1][int(move_to_wp)],plan_wps[2][int(move_to_wp)])
        rospy.loginfo('publish wp')

if __name__ == '__main__':
    
    rospy.init_node('action_dispatch_callback', anonymous=True)
    sub = rospy.Subscriber('/rosplan_plan_dispatcher/action_dispatch',ActionDispatch,dispatch_callback)
    
    publish_action_feedback()
    publish_action_feedback()
    publish_action_feedback()
    publish_action_feedback()
    publish_action_feedback()

    rospy.spin()