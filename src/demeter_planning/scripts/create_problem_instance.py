#!/usr/bin/env python
from threading import Lock
from cmath import sqrt
from time import sleep
from std_srvs.srv import Empty
from std_msgs.msg import Float32
import rospy
from nav_msgs.msg import Odometry
from rosplan_knowledge_msgs.srv import *
from rosplan_knowledge_msgs.msg import KnowledgeItem
from diagnostic_msgs.msg import KeyValue
from geometry_msgs.msg import Pose
from action_interface import DemeterActionInterface
import re
import networkx as nx
import matplotlib.pyplot as plt
import pickle
import math
import roslib
from rospkg import RosPack

class PopulateKB(object):

    mutex = Lock()
    def __init__(self):
        self.SCALE_TRAVERSE_COSTS = 1
        self.SPEED = 0.35 # Scale speed 
        self.FULL_BATTERY = 20
        self.RECHARGE_RATE = 0.05 # While doing other tasks #TODO: Change here and in battery controller at the same time
        self.RECHARGE_RATE_DEDICATED = 5 #TODO: Change here and in battery controller at the same time

        self.valid_pose_received = False
        self.namespace = rospy.get_namespace()
        rospy.sleep(1)
        self.battery_level_subscribers()
        
        self.rate = rospy.Rate(1)  # 1Hz
        self.start_time = rospy.get_time()        
        self.package_path = roslib.packages.get_pkg_dir("demeter_planning")
        self.vehicle_id = self.extract_number_from_string(self.namespace)
        rospy.Subscriber(str(self.namespace)+'pose_gt', Odometry, self._pose_gt_cb, queue_size=10)
        try:
            wp_array = rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/waypoints")
            X = [wp[0] for wp in wp_array]
            Y = [wp[1] for wp in wp_array]
            Z = [wp[2] for wp in wp_array]
            self.waypoints_position = [X, Y, Z] 
        except rospy.ROSException:
            rospy.logfatal('waypoints not set in parameter')

        # Wait for position
        while not self.valid_pose_received and not rospy.is_shutdown():
            if self.valid_pose_received:
                rospy.logwarn(str(self.namespace) + ' pose received')
                break    

        # self.position = action_interface_object.get_position()
        # rospy.logwarn(str(self.namespace) + ' | Current pos: x: ' + str(self.position.x) + ' y: ' + str(self.position.y) )
        # action_interface_object.set_init_position_param(self.position)  
        # self.closer_wp = action_interface_object.closer_wp([self.position.x, self.position.y, self.position.z])
        self.closer_wp = self.compute_closer_wp()
        # rospy.logwarn(str(self.namespace) + ' | Closer waypoint: ' + str(self.closer_wp))
        # rospy.logwarn(str(self.namespace) + ' | Position: ' + str(self.position))
        self.load_graph()
        self.remove_turbines_from_graph()
        self.add_distances_as_weights()

        # rospy.logwarn(str(self.namespace) + ' | waypoints_position: ' + str(self.waypoints_position))
        
        closer_wp_position = [self.waypoints_position[0][self.closer_wp], self.waypoints_position[1][self.closer_wp], self.waypoints_position[2][self.closer_wp]]
        # rospy.logwarn(str(self.namespace) + ' | Closer waypoint position: ' + str(closer_wp_position))
        
        self.distance_to_closer_wp = self.distance(self.position, closer_wp_position)
        # rospy.logwarn('self.distance_to_closer_wp: ' + str(self.distance_to_closer_wp))
        # sleep(1)
        self.allocated_goals = self.load_allocation()
        
        if self.allocated_goals:
            self.add_goal_mission(self.allocated_goals[0])
            self.populate_KB()
        else:
            rospy.logwarn('No more goals for vehicle: ' + str(self.namespace))
                
    def _pose_gt_cb(self, msg):
        new_position = [msg.pose.pose.position.x, msg.pose.pose.position.y, msg.pose.pose.position.z]
        if new_position != [0,0,0]:
            self.valid_pose_received = True
            self.position = new_position
            
    def compute_closer_wp(self):
        dist = float('inf')
        closer_wp = None
        for i in range(len(self.waypoints_position[0])):
            dist_aux=sqrt((self.position[0] - self.waypoints_position[0][i])**2+(self.position[1] - self.waypoints_position[1][i])**2+(self.position[2] - self.waypoints_position[2][i])**2)
            if dist_aux.real<dist:
                dist=dist_aux.real
                closer_wp=i
        return closer_wp
    
    def populate_KB(self):
        self.init_position_to_KB()
        # rospy.logwarn(self.allocated_goals)
        target = self.get_sensor_contour_points(self.allocated_goals[0])
        reduced_waypoints = self.get_shortest_path_subgraph(int(self.closer_wp), 'general_waypoint', int(target))
        self.add_reduced_can_move(reduced_waypoints)
        self.add_object('vehicle'+str(self.vehicle_id), 'vehicle')
        self.add_object('currenttide', 'tide')
        self.add_fact('is-surfaced', 'vehicle'+str(self.vehicle_id))
        self.add_fact('empty', 'vehicle'+str(self.vehicle_id))
        # self.add_fact('not-recharging', 'vehicle'+str(self.vehicle_id))
        self.add_fact('idle', 'vehicle'+str(self.vehicle_id))
        self.update_functions('battery-level', [KeyValue('v', 'vehicle'+str(self.vehicle_id))], self.battery_level, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        # rospy.logwarn('Battery: ' + str(self.battery_level))
        self.update_functions('recharge-rate', [KeyValue('v', 'vehicle'+str(self.vehicle_id))], self.RECHARGE_RATE, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        self.update_functions('recharge-rate-dedicated', [KeyValue('v', 'vehicle'+str(self.vehicle_id))], self.RECHARGE_RATE_DEDICATED, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        # self.update_functions('total-missions-completed', [KeyValue('v', 'vehicle'+str(self.vehicle_id))], 0, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        self.update_functions('speed', [KeyValue('v', 'vehicle'+str(self.vehicle_id))], self.SPEED, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        self.predict_next_tides() # All facts related to tides
        # rospy.logwarn('Tides: ' + str(self.current_tide_level))    

    def add_goal_mission(self, target_turbine):   
        self.add_object('data'+str(target_turbine),'data')
        
        self.add_fact('is-in','data'+str(target_turbine),'turbine'+str(target_turbine))
        self.add_goal('data-sent', 'data'+str(target_turbine))
        sensor_contour_point = self.get_sensor_contour_points(target_turbine)
        self.add_fact('is-turbine-wp','waypoint'+str(sensor_contour_point),'turbine'+str(target_turbine))      
        
    def init_position_to_KB(self):
        self.add_object('wp_init_auv'+str(self.vehicle_id),'waypoint') # Define waypoint object for initial position
        self.add_object('turbine'+str(self.allocated_goals[0]),'turbine') # Define turbine objects
        self.add_fact('at','vehicle'+str(self.vehicle_id),'wp_init_auv'+str(self.vehicle_id)) # Real initial position
        
        # Vehicle can move between initial position and closest waypoint
        self.add_fact('can-move', 'wp_init_auv'+str(self.vehicle_id), 'waypoint'+str(self.closer_wp)) # vehicle can move to its closer waypoint from initial waypoint
        dist=round(float(self.distance_to_closer_wp.real),2)
        if dist == 0: #Workaround, PDDL complains about distance equal to zero
            dist = 0.01
        self.update_functions('traverse-cost', [KeyValue('w', 'wp_init_auv'+str(self.vehicle_id)), KeyValue('w', 'waypoint'+str(self.closer_wp))], self.SCALE_TRAVERSE_COSTS*dist, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)

    def load_graph(self):
        with open(self.package_path + "/params/scaled_visibility_G_with_contour_points.pickle", "rb") as f:
            self.scaled_G = pickle.load(f)

    def remove_turbines_from_graph(self):
        # Remove all turbine nodes
        turbine_nodes = [n for n, attrs in self.scaled_G.nodes(data=True) if attrs['description'] == 'turbine']
        self.scaled_G.remove_nodes_from(turbine_nodes)
        if nx.is_connected(self.scaled_G):
            # rospy.logwarn('Graph is connected, ok!')
            pass
        else:
            pass
            # rospy.logwarn('Graph is not connected, create another roadmap!')
        
    def add_distances_as_weights(self):
        # Add distances as weights
        node_pos=nx.get_node_attributes(self.scaled_G,'pos') 
        for u, v in self.scaled_G.edges():
            x1, y1 = node_pos[int(u)]
            x2, y2 = node_pos[int(v)]
            dist = ((x2 - x1) ** 2 + (y2 - y1) ** 2) ** 0.5
            self.scaled_G.edges[u, v]['weight'] = dist
            self.scaled_G.edges[v, u]['weight'] = dist
            
    def get_contour_points_list(self):
        contour_points = []
        # find all nodes with description 'contour_point'
        for node, data in self.scaled_G.nodes(data=True):
            if data['description'] == 'contour_point':
                contour_points.append(node)
        return contour_points
    
    def get_shortest_path_subgraph(self, source, source_type, target):
        # Build a new graph using only the relevant POIs  
        if source_type == 'general_waypoint':
            paths_and_distances = [(nx.dijkstra_path(self.scaled_G, source, target, weight='weight'),
                        nx.dijkstra_path_length(self.scaled_G, source, target, weight='weight'))]

        # Get the shortest path and the minimum distance
        shortest_path, min_distance = None, float('inf')
        for path, distance in paths_and_distances:
            if distance < min_distance:
                shortest_path = path
                min_distance = distance
        return shortest_path        
      
    def get_sensor_contour_points(self, target_turbine):
        # Get all contour points realted to turbine target_turbine
        contour_points = self.get_contour_points_list()
        sensor_contour_point = None
        max_x = float('-inf')
        for contour_point in contour_points:
            if self.scaled_G.nodes[contour_point]['related_to'] == target_turbine:
                x_value = self.scaled_G.nodes[contour_point]['pos'][0]
                if float(x_value) > float(max_x):
                    max_x = x_value
                    sensor_contour_point = contour_point
        return sensor_contour_point
    
    def add_reduced_can_move(self, reduced_waypoints):
        # Add can-move and traverse-cost only of relevant waypoints
        for i, wp in enumerate(reduced_waypoints[:-1]):
            node_from = reduced_waypoints[i]
            node_to = reduced_waypoints[i+1]
            self.add_fact('can-move', 'waypoint'+str(node_from), 'waypoint'+str(node_to))
            dist = round(self.scaled_G.edges[node_from, node_to]['weight'],2)
            self.update_functions('traverse-cost', [KeyValue('w', 'waypoint'+str(node_from)), KeyValue('w', 'waypoint'+str(node_to))], self.SCALE_TRAVERSE_COSTS*dist.real, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        for wp in reduced_waypoints:
            self.add_object('waypoint' + str(wp), 'waypoint')
            
    def load_allocation(self):
        # Load allocation of vehicles to goals from a goal allocation algorithm
        try:
            allocated_goals = rospy.get_param(self.namespace + 'goals_allocated')
            self.NUMBER_OF_TURBINES = len(allocated_goals)
            return allocated_goals
        except rospy.ROSException as e:
            print("Error, goals not allocated: ", str(e))

    def update_functions(self, func_name, params, func_values, update_type):
        self.mutex.acquire()
        success = True
        rospy.wait_for_service(str(self.namespace) +'rosplan_knowledge_base/update')
        self._knowledge_update_proxy = rospy.ServiceProxy(self.namespace +'rosplan_knowledge_base/update', KnowledgeUpdateService)                
        req = KnowledgeUpdateServiceRequest()
        req.knowledge.knowledge_type = KnowledgeItem.FUNCTION
        req.knowledge.attribute_name = func_name
        req.knowledge.values = params
        req.knowledge.function_value = func_values
        req.update_type = update_type
        success = success and self._knowledge_update_proxy(req).success
        self.mutex.release()
        return success
    
    def distance(self, p1, p2):
        return sqrt((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2 + (p1[2] - p2[2])**2)

    def add_object(self,obj_name, obj_type):   
        self.mutex.acquire()
        rospy.wait_for_service('rosplan_knowledge_base/update')
        try:  
            # rospy.loginfo('Add ' + obj_name + ' Object')
            update_client = rospy.ServiceProxy('rosplan_knowledge_base/update', KnowledgeUpdateService)
            knowledge = KnowledgeItem()
            knowledge.knowledge_type=KnowledgeItem.INSTANCE
            knowledge.instance_type=obj_type
            knowledge.instance_name=obj_name
            resp = update_client(KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE, knowledge)
        except rospy.ServiceException:
            rospy.loginfo("Service call failed")    
        self.mutex.release()
        
    def add_fact(self,*fact):
        self.mutex.acquire()
        rospy.wait_for_service('rosplan_knowledge_base/update')
        try:
            update_client = rospy.ServiceProxy('rosplan_knowledge_base/update', KnowledgeUpdateService)     
            knowledge = KnowledgeItem()
            knowledge.knowledge_type=KnowledgeItem.FACT # Add Fact
            knowledge.attribute_name=fact[0] 
            knowledge.values.append(diagnostic_msgs.msg.KeyValue("v", fact[1]))
            if len(fact)==3:
                knowledge.values.append(diagnostic_msgs.msg.KeyValue("w", fact[2]))     
            # rospy.loginfo('Add '+ str(fact) +' Fact')
            resp = update_client(KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE, knowledge)
        except rospy.ServiceException:
            rospy.loginfo("Service call failed") 
        self.mutex.release()

    def add_timed_initial_literals(self, seconds, bool_fact, *fact):
        self.mutex.acquire()
        rospy.wait_for_service('rosplan_knowledge_base/update')
        try:
            update_client = rospy.ServiceProxy('rosplan_knowledge_base/update', KnowledgeUpdateService)     
            knowledge = KnowledgeItem()
            knowledge.knowledge_type=KnowledgeItem.FACT # Add Fact
            timed_ros = rospy.get_rostime() + rospy.Duration.from_sec(seconds)
            knowledge.initial_time=timed_ros
            knowledge.is_negative=not bool_fact
            knowledge.attribute_name=fact[0] 
            knowledge.values.append(diagnostic_msgs.msg.KeyValue("v", fact[1]))
            if len(fact)==3:
                knowledge.values.append(diagnostic_msgs.msg.KeyValue("w", fact[2]))     
            # rospy.loginfo('Add '+ str(fact) +' Timed-initial-literal ' + str(seconds) + ' | ' + str(bool_fact))
            resp = update_client(KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE, knowledge)
        except rospy.ServiceException:
            rospy.loginfo("Service call failed") 
        self.mutex.release()

    def add_goal(self,goal_fact, goal_obj):
        self.mutex.acquire()
        rospy.wait_for_service('rosplan_knowledge_base/update')
        try:  
            update_client = rospy.ServiceProxy('rosplan_knowledge_base/update', KnowledgeUpdateService)
            knowledge = KnowledgeItem()
            knowledge.knowledge_type=KnowledgeItem.FACT
            knowledge.attribute_name=goal_fact
            knowledge.values.append(diagnostic_msgs.msg.KeyValue("d", goal_obj))     
            resp = update_client(KnowledgeUpdateServiceRequest.ADD_GOAL, knowledge)
        except rospy.ServiceException:
            rospy.loginfo("Service call failed")  
        self.mutex.release()
            
    def remove_goal(self, goal_fact, goal_obj):   
        self.mutex.acquire()
        rospy.wait_for_service('rosplan_knowledge_base/update')
        try:  
            update_client = rospy.ServiceProxy('rosplan_knowledge_base/update', KnowledgeUpdateService)
            knowledge = KnowledgeItem()
            knowledge.knowledge_type=KnowledgeItem.FACT
            knowledge.attribute_name=goal_fact
            knowledge.values.append(diagnostic_msgs.msg.KeyValue("d", goal_obj))     
            resp = update_client(KnowledgeUpdateServiceRequest.REMOVE_GOAL, knowledge)
        except rospy.ServiceException:
            rospy.loginfo("Service call failed")  
        self.mutex.release()        
        
    def remove_fact(self,*fact):
        self.mutex.acquire()        
        rospy.wait_for_service('rosplan_knowledge_base/update')
        try:
            update_client = rospy.ServiceProxy('rosplan_knowledge_base/update', KnowledgeUpdateService)     
            knowledge = KnowledgeItem()
            knowledge.knowledge_type=KnowledgeItem.FACT # Remove Fact
            knowledge.attribute_name=fact[0] 
            knowledge.values.append(diagnostic_msgs.msg.KeyValue("v", fact[1]))
            if len(fact)==3:
                knowledge.values.append(diagnostic_msgs.msg.KeyValue("w", fact[2]))     
            # rospy.loginfo('Remove '+ str(fact) +' Fact')
            resp = update_client(KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE, knowledge)
        except rospy.ServiceException:
            rospy.loginfo("Service call failed") 
        self.mutex.release()        
            
    def extract_number_from_string(self, string):
        match = re.search(r'\d+', string)
        if match:
            return int(match.group())
        else:
            return None

    def battery_level_subscribers(self):
        self.battery_level = [0]
        sub_topic = self.namespace + "battery_level_emulated"
        msg = rospy.wait_for_message(sub_topic, Float32)
        self.battery_level = msg.data

    def predict_next_tides(self):
        PERIOD_OF_TIDES = 360 # Period in seconds
        rospy.set_param('/period_of_tides', PERIOD_OF_TIDES)
        LOW_TIDES_THREDSHOLD = PERIOD_OF_TIDES/3.0
        rospy.set_param('/low_tides_thredshold', LOW_TIDES_THREDSHOLD)

        time = rospy.get_rostime().to_sec()
        time_in_tide_cycle = time % PERIOD_OF_TIDES  # get the current ROS time in seconds and use the remainder after dividing by P to simulate repeating cycle
        time_integer = time // PERIOD_OF_TIDES
        # rospy.logwarn("time: " + str(time))
        # rospy.logwarn("time in tide cycle: " + str(time_in_tide_cycle))
        # rospy.logwarn("time integer: " + str(time_integer))
        
        self.add_timed_initial_literals(0, False, 'tide-low', 'currenttide') # Past tides
        
        # Bring time to present
        if time_integer*PERIOD_OF_TIDES < time < time_integer*PERIOD_OF_TIDES + LOW_TIDES_THREDSHOLD: 
            self.add_timed_initial_literals(0, True, 'tide-low', 'currenttide') # Add tide low if it is low now
            self.add_timed_initial_literals(LOW_TIDES_THREDSHOLD, False, 'tide-low', 'currenttide') # If its low now add next not low

        # Add next tides transitions to problem.pddl        
        TIDES_SIMULATION_CYCLES = 5
        for i in range(TIDES_SIMULATION_CYCLES):
            self.add_timed_initial_literals(PERIOD_OF_TIDES + PERIOD_OF_TIDES*i, True, 'tide-low', 'currenttide')
            self.add_timed_initial_literals(PERIOD_OF_TIDES + PERIOD_OF_TIDES*i + LOW_TIDES_THREDSHOLD, False, 'tide-low', 'currenttide')

if __name__ == '__main__':
    rospy.logwarn('Populate KB for one vehicle, using its position')
    rospy.init_node('populate_KB', anonymous=True)
    problem = PopulateKB()