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
from action_interface import DemeterActionInterface

class InitProblem(object):

    def __init__(self):
        rospy.logdebug('py.init')
        # Write init position to param
        self.auv_name='auv'
        self.number_of_auvs = len(rospy.get_param('/init_populate_KB/vehicle_idx'))
        self.number_of_data_sensors = len(rospy.get_param('/init_populate_KB/data_idx'))
        self.turbines_xy = [rospy.get_param('/init_populate_KB/turbines_x'), rospy.get_param('/init_populate_KB/turbines_y')] # Turbines position
        self.num_turbines = len(self.turbines_xy[0])
        
        action_interface_object = DemeterActionInterface(self.auv_name)
        self.position = list()
        self.closer_wp = list()
        for vehicle in range(self.number_of_auvs):
            self.position.append(action_interface_object.get_position(vehicle))
            action_interface_object.set_init_position_param(self.position[vehicle], vehicle_index=vehicle)  
            rospy.set_param('/init_populate_KB/vehicle_initial_position/auv'+str(vehicle), [self.position[vehicle].x, self.position[vehicle].y, self.position[vehicle].z])
            self.closer_wp.append(action_interface_object.closer_wp([self.position[vehicle].x, self.position[vehicle].y, self.position[vehicle].z]))
        
        self.submerge_base_waypoints=action_interface_object.load_wp_config_from_file() # To get number of waypoints in yaml file
        self.number_of_base_waypoints = len(self.submerge_base_waypoints[0])

    def create_default_problem(self):
        # Update Knowledge Base
        for vehicle in range(self.number_of_auvs):
            self.add_object(self.auv_name+str(vehicle),'vehicle'+str(vehicle))
            self.add_fact('empty',self.auv_name+str(vehicle))
            self.add_fact('localized',self.auv_name+str(vehicle))
            self.add_fact('at',self.auv_name+str(vehicle),'wp_init_auv'+str(vehicle)) # Real initial position
            self.add_object('wp_init_auv'+str(vehicle),'waypoint') # Define waypoint object for initial position
            
        for data_sensor in range(self.number_of_data_sensors):
            # Define position of sensors            
            self.add_object('data'+str(data_sensor),'data')
            # First point is in the surface
            self.add_fact('is-at-surface','wp_turbine'+str(data_sensor)+'_point0')
                 
        for turbine in range(self.num_turbines):
            # Define several waypoints for each turbine
            for point in range(self.number_of_base_waypoints):
                self.add_object('wp_turbine'+str(turbine)+'_point'+str(point),'waypoint')
                # Allowed moviments            
                # vehicle can move to surface from any waypoint
                if point != 0:
                    self.add_fact('can-move','wp_turbine'+str(turbine)+'_point'+str(point),'wp_turbine'+str(turbine)+'_point0')
                if point != self.number_of_base_waypoints-1:
                    # vehicle can move to next waypoint but can not move back
                    self.add_fact('can-move','wp_turbine'+str(turbine)+'_point'+str(point),'wp_turbine'+str(turbine)+'_point'+str(point+1))
                    
        # # Define all turbines surface points
        # for i in range(self.num_turbines):
        #     self.add_object('wp_turbine'+str(i)+'_point0','waypoint')

        # Vehicle can move between initial position and closest waypoint
        for idx, fact in enumerate(self.closer_wp):
            self.add_fact('can-move', 'wp_init_auv'+str(idx), str(fact)) # vehicle can move to its closer waypoint from initial waypoint
            
        # All turbines are connected to the surface
        for i in range(self.num_turbines):
            for j in range(self.num_turbines):
                if i != j:
                    self.add_fact('can-move', 'wp_turbine'+str(i)+'_point0', 'wp_turbine'+str(j)+'_point0')
            
        rospy.loginfo('Problem file populated')
        # Add minimize total time to problem file
        self.add_metric_min_total_time()

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
    

if __name__ == '__main__':
    rospy.logdebug('py.init')
    rospy.init_node('init_position', anonymous=True)
    problem = InitProblem()
    problem.create_default_problem()