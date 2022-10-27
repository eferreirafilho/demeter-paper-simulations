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
from interface import DemeterActionInterface

class InitProblem(object):

    def __init__(self):
        rospy.logdebug('py.init')
        # Write init position to param
        init_position = DemeterActionInterface()
        position = init_position.get_position()
        init_position.set_init_position_param(position)  
        init_position.append_to_plan_wp(position)
        self.closer_wp=init_position.closer_wp(position)
        self.waypoints_position=init_position.load_wp_config_from_file() # To get number of waypoints in yaml file
        self.n_waypoints=len(self.waypoints_position[0])
        self.n_canmove=self.n_waypoints-1

    def create_default_problem(self):
         # Update Knowledge Base
        self.add_object('data1','data')
        self.add_object('vehicle1','vehicle')

        # Add waypoints objects
        for i in range(self.n_waypoints+1): # Last waypoint is the initial position
            self.add_object('wp'+str(i),'waypoint')
            
        #Add facts
        self.add_fact('empty','vehicle1')
        # self.add_fact('is-in','data1','wp'+str(n_waypoints-1)) # Define position of sensor (in last Waypoint)
        self.add_fact('is-at-surface','wp0')        
        # self.add_fact('is-at-surface','wp1') 

        # Allowed moviments            
        for i in range(self.n_canmove):
            self.add_fact('can-move','wp'+str(i),'wp'+str(i+1)) # vehicle can move to next waypoint but can not move back
            self.add_fact('can-move','wp'+str(i+1),'wp0') # vehicle can move to surface from any waypoint
                
        self.add_fact('can-move','wp'+str(self.closer_wp),'wp'+str(self.n_waypoints)) # vehicle can move from initial waypoint to its closer waypoint
        self.add_fact('can-move','wp'+str(self.n_waypoints),'wp'+str(self.closer_wp)) # vehicle can move to its closer waypoint from initial waypoint 
        
        # Localized
        self.add_fact('localized','vehicle1')

        # self.add_fact('at','vehicle1','wp1') # Simulated fact!!!
        self.add_fact('at','vehicle1','wp'+str(self.n_waypoints)) # Real initial position
        
        rospy.loginfo('Problem file created')
        
        # Add minimize total time to problem file
        self.add_metric_min_total_time()

    def add_can_move_backwards(self):
        for i in range(self.n_canmove):
            self.add_fact('can-move','wp'+str(i+1),'wp'+str(i)) # vehicle can move to next waypoint but can not move back

    def remove_can_move_surface(self):
        for i in range(self.n_canmove-1):
            self.remove_fact('can-move','wp'+str(i+2),'wp'+str(0))

    def add_goal(self,goal_fact, goal_obj):   
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

    def add_metric_min_total_time(self):   
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

    def add_object(self,obj_name, obj_type):   
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

    def add_fact(self,*fact):
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

    def remove_fact(self,*fact):
        rospy.wait_for_service('rosplan_knowledge_base/update')
        try:
            update_client = rospy.ServiceProxy('rosplan_knowledge_base/update', KnowledgeUpdateService)     
            knowledge = KnowledgeItem()
            knowledge.knowledge_type=KnowledgeItem.FACT # Remove Fact
            knowledge.attribute_name=fact[0] 
            knowledge.values.append(diagnostic_msgs.msg.KeyValue("v", fact[1]))
            if len(fact)==3:
                knowledge.values.append(diagnostic_msgs.msg.KeyValue("w", fact[2]))     
            rospy.loginfo('Remove '+ str(fact) +' Fact')
            resp = update_client(KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE, knowledge)
        except rospy.ServiceException:
            rospy.loginfo("Service call failed") 

    def problem_generation(self):
        rospy.loginfo("Waiting for problem generation service")
        rospy.wait_for_service('rosplan_problem_interface/problem_generation_server')
        try:
            rospy.loginfo("Calling problem generation service")
            rospy.ServiceProxy('rosplan_problem_interface/problem_generation_server',Empty)()
            rospy.loginfo("Problem file updated")
            
        except rospy.rospy.ServiceException:
            rospy.loginfo("Service problem generation call failed")

    def allow_backwards_moviment(self):
        self.add_can_move_backwards()
        self.remove_can_move_surface()
    

if __name__ == '__main__':
    rospy.logdebug('py.init')
    rospy.init_node('init_position', anonymous=True)
    problem = InitProblem()
    problem.create_default_problem()