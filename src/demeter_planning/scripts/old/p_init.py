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

def add_goal(goal_fact, goal_obj):   
    rospy.wait_for_service('rosplan_knowledge_base/update')
    try:  
        rospy.loginfo('Add Goal ' + goal_fact + ' ' + goal_obj)
        update_client = rospy.ServiceProxy('rosplan_knowledge_base/update', KnowledgeUpdateService)
        knowledge = KnowledgeItem()
        knowledge.knowledge_type=KnowledgeItem.FACT
        knowledge.attribute_name=goal_fact
        knowledge.values.append(diagnostic_msgs.msg.KeyValue("d", goal_obj))     
        resp = update_client(KnowledgeUpdateServiceRequest.ADD_GOAL, knowledge)
    except rospy.ServiceException:
        rospy.loginfo("Service call failed")    

def add_metric_min_total_time():   
    rospy.wait_for_service('rosplan_knowledge_base/update')
    try:  
        rospy.loginfo('Add Metric: Minimize total time')
        update_client = rospy.ServiceProxy('rosplan_knowledge_base/update', KnowledgeUpdateService)
        knowledge = KnowledgeItem()
        knowledge.knowledge_type=KnowledgeItem.EXPRESSION
        knowledge.optimization="minimize (total-time)"
        knowledge.expr.tokens = []
        resp = update_client(KnowledgeUpdateServiceRequest.ADD_METRIC, knowledge)
    except rospy.ServiceException:
        rospy.loginfo("Service call failed")  

def add_object(obj_name, obj_type):   
    rospy.wait_for_service('rosplan_knowledge_base/update')
    try:  
        rospy.loginfo('Add ' + obj_name + ' Object')
        update_client = rospy.ServiceProxy('rosplan_knowledge_base/update', KnowledgeUpdateService)
        knowledge = KnowledgeItem()
        knowledge.knowledge_type=KnowledgeItem.INSTANCE
        knowledge.instance_type=obj_type
        knowledge.instance_name=obj_name
        resp = update_client(KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE, knowledge)
    except rospy.ServiceException:
        rospy.loginfo("Service call failed")    

def add_fact(*fact):
    rospy.wait_for_service('rosplan_knowledge_base/update')
    try:
        update_client = rospy.ServiceProxy('rosplan_knowledge_base/update', KnowledgeUpdateService)     
        knowledge = KnowledgeItem()
        knowledge.knowledge_type=KnowledgeItem.FACT # Add Fact
        knowledge.attribute_name=fact[0] 
        knowledge.values.append(diagnostic_msgs.msg.KeyValue("v", fact[1]))
        if len(fact)==3:
            knowledge.values.append(diagnostic_msgs.msg.KeyValue("w", fact[2]))     
        rospy.loginfo('Add '+ str(fact) +' Fact')
        resp = update_client(KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE, knowledge)

    except rospy.ServiceException:
        rospy.loginfo("Service call failed") 

def problem_generation():
    rospy.loginfo("Waiting for problem generation service")
    rospy.wait_for_service('rosplan_problem_interface/problem_generation_server')
    try:
        rospy.loginfo("Calling problem generation service")
        rospy.ServiceProxy('rosplan_problem_interface/problem_generation_server',Empty)()
        rospy.loginfo("Problem file updated")
        
    except rospy.rospy.ServiceException:
        rospy.loginfo("Service problem generation call failed")
        

if __name__ == '__main__':
  

    # Update Knowledge Base
    add_object('data1','data')
    add_object('vehicle1','vehicle')
    
    # Add waypoints objects
    n_waypoints=7
    for i in range(n_waypoints):
        add_object('wp'+str(i),'waypoint')
        
    #Add facts
    add_fact('empty','vehicle1') # Define vehicle has no data
    add_fact('is-in','data1','wp6') # Define position of sensor
    add_fact('is-at-surface','wp0') # Define wp0 is at the surface        
    add_fact('is-at-surface','wp1') # Define wp1 is at the surface 

    # Allowed moviments            
    n_canmove=6
    for i in range(n_canmove):
        add_fact('can-move','wp'+str(i),'wp'+str(i+1)) # vehicle can move to next waypoint but can not move back
        add_fact('can-move','wp'+str(i+1),'wp0') # vehicle can move to surface from any waypoint
               
    # From which waypoints robots can localize themselves            
    add_fact('can-find','wp0','wp1')
    add_fact('can-find','wp2','wp3')
    add_fact('can-find','wp5','wp6')
    
    # TODO: Automatically add robot to waypoint!
    add_fact('at','vehicle1','wp0') # simulated fact!!!
    
    
    # Add goal
    add_goal('data-sent','data1')
    
    # Add minimize total time to problem file
    add_metric_min_total_time()
    
    # Automatically generate PDDL problem from KB snapshot (e.g. fetch knowledge from KB and create problem.pddl)
    # problem_generation()
    
    # Initialize Node
    #rospy.init_node('problem_init', anonymous=True)
    # Subscribe to Pose
    #sub = rospy.Subscriber('auv/pose_gt', Odometry, callback)
    
    #rospy.loginfo('Spin')
    #rospy.spin()