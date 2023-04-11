#!/usr/bin/env python
from threading import Lock
from cmath import sqrt
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
import re
import networkx as nx
import matplotlib.pyplot as plt
import pickle
import roslib
from rospkg import RosPack

class PopulateKB(object):

    mutex = Lock()
    def __init__(self):
        rospy.logwarn('Create Problem - Populating KB with robots initial position and goals')
        sleep(5)
        self.SCALE_TRAVERSE_COSTS = 0.1
        self.namespace = rospy.get_namespace()
        self.package_path = roslib.packages.get_pkg_dir("demeter_planning")

        self.vehicle_id = self.extract_number_from_string(self.namespace)
        action_interface_object = DemeterActionInterface(self.namespace)

        self.position = action_interface_object.get_position()
        action_interface_object.set_init_position_param(self.position)  
        self.closer_wp = action_interface_object.closer_wp([self.position.x, self.position.y, self.position.z])
        self.load_graph()
        self.remove_turbines_from_graph()
        self.add_distances_as_weights()
                        
        self.poi_position = rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/waypoints")
        
        closer_wp_position = self.poi_position[self.closer_wp]
        
        self.distance_to_closer_wp = self.distance(self.position, closer_wp_position)
        rospy.logwarn('self.distance_to_closer_wp')
        rospy.logwarn(self.distance_to_closer_wp)
        self.allocated_goals = self.load_allocation()

        self.init_position_to_KB()
        target = self.get_sensor_countor_points(self.allocated_goals[0])
        reduced_waypoints = self.get_shortest_path_subgraph(int(self.closer_wp), 'general_waypoint', int(target))
        self.add_reduced_can_move(reduced_waypoints)
        self.add_object('vehicle'+str(self.vehicle_id), 'vehicle')
        self.add_object('currenttide', 'tide')
        # if not action_interface_object.is_submerged():
        self.add_fact('is-surfaced', 'vehicle'+str(self.vehicle_id))
        self.add_fact('empty', 'vehicle'+str(self.vehicle_id))
        self.add_fact('tide-low', 'currenttide')
        self.add_fact('not-recharging', 'vehicle'+str(self.vehicle_id))
        FULL_BATTERY = 100 # TODO: keep track of battery
        RECHARGE_RATE = 1 
        RECHARGE_RATE_DEDICATED = 100 
        self.update_functions('battery-amount', [KeyValue('v', 'vehicle'+str(self.vehicle_id))], FULL_BATTERY, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        self.update_functions('recharge-rate', [KeyValue('v', 'vehicle'+str(self.vehicle_id))], RECHARGE_RATE, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        self.update_functions('recharge-rate-dedicated', [KeyValue('v', 'vehicle'+str(self.vehicle_id))], RECHARGE_RATE_DEDICATED, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        SPEED = 100000 
        self.update_functions('total-missions-completed', [KeyValue('v', 'vehicle'+str(self.vehicle_id))], 0, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        self.update_functions('speed', [KeyValue('v', 'vehicle'+str(self.vehicle_id))], SPEED, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        
        
        
        # self.draw_roadmap()
        # self.draw_weights()
        # self.draw_vehicle()
        # self.draw_turbines_labels()
        # plt.show()
        
        # Get all allocated goals
        # for goal in self.allocated_goals:
            # self.add_goal_mission(goal)
        
        rospy.logwarn('Create problem instance: self.allocated_goals')
        rospy.logwarn(self.allocated_goals)
        # Clear KB
        # for goal in self.allocated_goals:
        #     self.remove_fact('data-sent', 'data'+str(goal))
        #     self.remove_goal('data-sent', 'data'+str(goal))

        
        self.add_goal_mission(self.allocated_goals[0])
        
    def draw_roadmap(self):
        pos_dict = nx.get_node_attributes(self.G,'pos')
        self.xy_pos = []
        for key in pos_dict:
            val = pos_dict[key][:2]
            self.xy_pos.append(val)
        nx.draw(self.G,pos=self.xy_pos,node_size=10,with_labels=True)
        
    def draw_weights(self):
        labels=nx.get_edge_attributes(self.G,'weight')
        nx.draw_networkx_edge_labels(self.G,self.xy_pos,edge_labels=labels,font_size=5)
        
    def draw_vehicle(self):
        pos = [self.position.x, self.position.y]
        plt.plot(pos[0], pos[1], 'rs', markersize=10)

    def add_goal_mission(self, target_turbine):   
        self.add_object('data'+str(target_turbine),'data')
        self.add_fact('is-in','data'+str(target_turbine),'turbine'+str(target_turbine))
        self.add_goal('data-sent', 'data'+str(target_turbine))
        rospy.logwarn('target_turbine')
        rospy.logwarn(target_turbine)
        sensor_countor_point = self.get_sensor_countor_points(target_turbine)
        rospy.logwarn('sensor_countor_point')
        rospy.logwarn(sensor_countor_point)
        self.add_fact('is-turbine-wp','waypoint'+str(sensor_countor_point),'turbine'+str(target_turbine))      
   
        
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
        with open(self.package_path + "/params/scaled_visibility_G_with_turbines.pickle", "rb") as f:
            self.scaled_G = pickle.load(f)

    def remove_turbines_from_graph(self):
        # Remove all turbine nodes
        turbine_nodes = [n for n, attrs in self.scaled_G.nodes(data=True) if attrs['description'] == 'turbine']
        self.scaled_G.remove_nodes_from(turbine_nodes)
        # self.poi_position = Roadmap.build_roadmap_get_waypoints()
        if nx.is_connected(self.scaled_G):
            rospy.logwarn('Graph is connected, ok!')
        else:
            rospy.logwarn('Graph is not connected, create another roadmap!')
        
    def add_distances_as_weights(self):
        # Add distances as weights
        node_pos=nx.get_node_attributes(self.scaled_G,'pos') 
        for u, v in self.scaled_G.edges():
            x1, y1 = node_pos[int(u)]
            x2, y2 = node_pos[int(v)]
            dist = ((x2 - x1) ** 2 + (y2 - y1) ** 2) ** 0.5
            self.scaled_G.edges[u, v]['weight'] = dist
            self.scaled_G.edges[v, u]['weight'] = dist
            
    def get_countor_points_list(self):
        countor_points = []
        # find all nodes with description 'countor_point'
        for node, data in self.scaled_G.nodes(data=True):
            if data['description'] == 'countor_point':
                countor_points.append(node)
        return countor_points
    
    def get_shortest_path_subgraph(self, source, source_type, target):
        # Build a new graph using only the relevant POIs  
        rospy.logwarn('source: ' + str(source))      
        rospy.logwarn('source_type: ' + str(source_type))      
        rospy.logwarn('target: ' + str(target))      
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
      
    def get_sensor_countor_points(self, target_turbine):
        countor_points = self.get_countor_points_list()
        sensor_countor_point = None
        max_x = float('-inf')
        for countor_point in countor_points:
            if self.scaled_G.nodes[countor_point]['related_to'] == target_turbine:
                x_value = self.scaled_G.nodes[countor_point]['pos'][0]
                if float(x_value) > float(max_x):
                    max_x = x_value
                    sensor_countor_point = countor_point

        return sensor_countor_point
    
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
            rospy.logwarn('Number of Turbines for vehicle: ' + str(self.namespace) + ' is: '+ str(self.NUMBER_OF_TURBINES))
            rospy.logwarn('Turbines: ' + str(allocated_goals))
            return allocated_goals
        except rospy.ROSException as e:
            # Handle the exception
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
        return sqrt((p1.x - p2[0])**2 + (p1.y - p2[1])**2 + (p1.z - p2[2])**2)

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
            
    def remove_goal(self, goal_fact, goal_obj):   
        rospy.wait_for_service('rosplan_knowledge_base/update')
        try:  
            rospy.loginfo('Remove Goal ' + goal_fact + ' ' + goal_obj)
            update_client = rospy.ServiceProxy('rosplan_knowledge_base/update', KnowledgeUpdateService)
            knowledge = KnowledgeItem()
            knowledge.knowledge_type=KnowledgeItem.FACT
            knowledge.attribute_name=goal_fact
            knowledge.values.append(diagnostic_msgs.msg.KeyValue("d", goal_obj))     
            resp = update_client(KnowledgeUpdateServiceRequest.REMOVE_GOAL, knowledge)
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
            
    def extract_number_from_string(self, string):
        match = re.search(r'\d+', string)
        if match:
            return int(match.group())
        else:
            return None

if __name__ == '__main__':
    rospy.logwarn('Populate KB for one vehicle, using its position')
    rospy.init_node('populate_KB', anonymous=True)
    problem = PopulateKB()