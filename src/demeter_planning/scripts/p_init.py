#!/usr/bin/env python
from time import sleep
from std_srvs.srv import Empty
from geometry_msgs.msg import PoseStamped
import rospy
from nav_msgs.msg import Odometry
from rosplan_knowledge_msgs.srv import *
from rosplan_knowledge_msgs.msg import KnowledgeItem
from diagnostic_msgs.msg import KeyValue
from geometry_msgs.msg import Pose
# from init_position import InitPosition
from interface import DemeterActionInterface

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

    # Write init position to param
    rospy.init_node('init_position', anonymous=True)
    init_position = DemeterActionInterface()
    position = init_position.get_position()
    init_position.set_init_position_param(position)  
    init_position.append_to_plan_wp(position)
    closer_wp=init_position.closer_wp(position)

    waypoints_position=init_position.load_wp_config_from_file() # To get number of waypoints in yaml file
    
    # Add waypoints objects
    n_waypoints=len(waypoints_position[0])
    rospy.logwarn(n_waypoints)
    for i in range(n_waypoints+1): # Last waypoint is the initial position
        add_object('wp'+str(i),'waypoint')
        
    #Add facts
    add_fact('empty','vehicle1') # Define vehicle has no data
    # add_fact('is-in','data1','wp'+str(n_waypoints-1)) # Define position of sensor (in last Waypoint)
    # add_fact('is-at-surface','wp0') # Define wp0 is at the surface        
    add_fact('is-at-surface','wp0') # Define wp1 is at the surface 

    # Allowed moviments            
    n_canmove=n_waypoints-1
    for i in range(n_canmove):
        add_fact('can-move','wp'+str(i),'wp'+str(i+1)) # vehicle can move to next waypoint but can not move back
        add_fact('can-move','wp'+str(i+1),'wp0') # vehicle can move to surface from any waypoint
               
    add_fact('can-move','wp'+str(closer_wp),'wp'+str(n_waypoints)) # vehicle can move from initial waypoint to its closer waypoint
    add_fact('can-move','wp'+str(n_waypoints),'wp'+str(closer_wp)) # vehicle can move to its closer waypoint from initial waypoint 
    
    # From which waypoints robots can localize themselves            
    add_fact('can-find','wp0','wp1')
    add_fact('can-find','wp2','wp3')
    add_fact('can-find','wp5','wp6')
    
    # add_fact('at','vehicle1','wp1') # Simulated fact!!!
    add_fact('at','vehicle1','wp'+str(n_waypoints)) # Real initial position
    
    rospy.loginfo('Problem file created')
    
    # Add minimize total time to problem file
    add_metric_min_total_time()
    