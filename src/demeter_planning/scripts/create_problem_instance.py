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
from build_roadmaps import BuildRoadmaps

class InitWaypoint(object):

    mutex = Lock()
    def __init__(self):
        rospy.logwarn('Create Problem - Populating KB with robots initial position and goals')
        self.namespace = rospy.get_namespace()
        self.vehicle_id = self.extract_number_from_string(self.namespace)
        action_interface_object = DemeterActionInterface(self.namespace)
        self.position = action_interface_object.get_position()
        action_interface_object.set_init_position_param(self.position)  
        self.closer_wp = action_interface_object.closer_wp([self.position.x, self.position.y, self.position.z])
        self.build_graph()
        closer_wp_position = [self.poi_position[0][self.closer_wp],  self.poi_position[1][self.closer_wp], self.poi_position[2][self.closer_wp]]
        self.distance_to_closer_wp = self.distance(self.position, closer_wp_position)
        rospy.logwarn('self.distance_to_closer_wp')
        rospy.logwarn(self.distance_to_closer_wp)
        self.load_allocation()

        self.init_position_to_KB()
        self.build_reduced_graph()
        self.add_reduced_can_move()
        
        # self.draw_roadmap()
        # self.draw_weights()
        # self.draw_vehicle()
        # self.draw_turbines_labels()
        # plt.show()
        
        # Get all allocated goals
        # for goal in self.allocated_goals:
            # self.add_goal_mission(goal)
        
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
            for turbine in self.allocated_goals:
                self.add_object('turbine'+str(turbine),'turbine') # Define turbine objects
                
            self.add_fact('at','vehicle'+str(self.vehicle_id),'wp_init_auv'+str(self.vehicle_id)) # Real initial position
            
            # Vehicle can move between initial position and closest waypoint
            self.add_fact('can-move', 'wp_init_auv'+str(self.vehicle_id), 'waypoint'+str(self.closer_wp)) # vehicle can move to its closer waypoint from initial waypoint
            dist=round(float(self.distance_to_closer_wp.real),2)
            if dist == 0: #Workaround, PDDL complains about distance equal to zero
                dist = 0.01
            self.update_functions('traverse-cost', [KeyValue('w', 'wp_init_auv'+str(self.vehicle_id)), KeyValue('w', 'waypoint'+str(self.closer_wp))], dist, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)

    def build_graph(self):
        Roadmap = BuildRoadmaps()
        self.scaled_G = Roadmap.build_and_scale_roadmap()
        # Remove all turbine nodes
        turbine_nodes = [n for n, attrs in self.scaled_G.nodes(data=True) if attrs['description'] == 'turbine']
        self.scaled_G.remove_nodes_from(turbine_nodes)
        self.poi_position = Roadmap.get_poi_from_graph()

        if nx.is_connected(self.scaled_G):
            rospy.logwarn('Graph is connected, ok!')
        else:
            rospy.logwarn('Graph is not connected, create another roadmap!')

        node_pos=nx.get_node_attributes(self.scaled_G,'pos') 
        # Add distances as weights
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
        countor_points = self.get_countor_points_list()

        # if source_type == 'waypoint':
        #     paths_and_distances = [(nx.dijkstra_path(self.scaled_G, source, point, weight='weight'),
        #                             nx.dijkstra_path_length(self.scaled_G, source, point, weight='weight'))
        #                         for point in countor_points 
        #                         if self.scaled_G.nodes[point]['related_to'] == target]
        # elif source_type == 'turbine':
        #     paths_and_distances = [(nx.dijkstra_path(self.scaled_G, point1, point2, weight='weight'),
        #                             nx.dijkstra_path_length(self.scaled_G, point1, point2, weight='weight'))
        #                         for point1 in countor_points
        #                         if self.scaled_G.nodes[point1]['related_to'] == source
        #                         for point2 in countor_points
        #                         if self.scaled_G.nodes[point2]['related_to'] == target]
        # else: # source: waypoint and target: waypoint source_type=general_waypoint
        if source_type == 'general_waypoint':
            paths_and_distances = [(nx.dijkstra_path(self.scaled_G, source, target, weight='weight'),
                        nx.dijkstra_path_length(self.scaled_G, source, target, weight='weight'))]

        # Get the shortest path and the minimum distance
        shortest_path, min_distance = None, float('inf')
        for path, distance in paths_and_distances:
            if distance < min_distance:
                shortest_path = path
                min_distance = distance
        rospy.logwarn(source_type)                            
        rospy.logwarn('shortest_path')
        rospy.logwarn(shortest_path)
        rospy.logwarn(source)
        rospy.logwarn(target)
        
        # Extract the subgraph consisting of nodes in the shortest path
        subgraph_nodes = set(shortest_path)
        subgraph_edges = [(shortest_path[i], shortest_path[i+1]) for i in range(len(shortest_path)-1)]
        shortest_path_subgraph = self.scaled_G.subgraph(subgraph_nodes).edge_subgraph(subgraph_edges)
        return shortest_path_subgraph
    

    def build_reduced_graph(self):
        combined_pois = []
        combined_pois.extend(self.allocated_goals)
        # combined_pois.append(self.closer_wp)
        self.reduced_G = nx.Graph()
        
        rospy.logwarn(combined_pois)
        
        # # Create subgraphs for every pair of turbines in the allocated goals
        # for poi_i in combined_pois:
        #     for poi_j in combined_pois:
        #         if poi_i != poi_j:
        #             partial_subgraph = self.get_shortest_path_subgraph(int(poi_i), 'turbine', int(poi_j))
        #             self.reduced_G.add_nodes_from(partial_subgraph.nodes())
        #             self.reduced_G.add_edges_from(partial_subgraph.edges())
                    
        # # Create subgraphs from vehicle's closer waypoint to every turbine in the allocated goals
        # for poi_i in combined_pois:
        #     partial_subgraph = self.get_shortest_path_subgraph(int(self.closer_wp), 'waypoint', int(poi_i))
        #     self.reduced_G.add_nodes_from(partial_subgraph.nodes())
        #     self.reduced_G.add_edges_from(partial_subgraph.edges())
        
        # Create subgraphs from vehicle's closer waypoint to every countor point closest to the sensor for each turbine in the allocated goals
        for poi_i in combined_pois:
            rospy.logwarn('poi_i')
            rospy.logwarn(poi_i)
            
            target = self.get_sensor_countor_points(poi_i)
            rospy.logwarn(target)
            rospy.logwarn(type(target))
            partial_subgraph = self.get_shortest_path_subgraph(int(self.closer_wp), 'general_waypoint', int(target))
            self.reduced_G.add_nodes_from(partial_subgraph.nodes())
            self.reduced_G.add_edges_from(partial_subgraph.edges())
    
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
        rospy.logwarn('sensor_countor_point')
        rospy.logwarn(sensor_countor_point)
        return sensor_countor_point
    
    def add_reduced_can_move(self):
        # Add can-move and traverse-cost only of relevant POI
        for u, v in self.reduced_G.edges():
            self.add_fact('can-move', 'waypoint'+str(u), 'waypoint'+str(v))
            self.add_fact('can-move', 'waypoint'+str(v), 'waypoint'+str(u))
            dist = round(self.scaled_G.edges[u, v]['weight'],2)
            self.update_functions('traverse-cost', [KeyValue('w', 'waypoint'+str(u)), KeyValue('w', 'waypoint'+str(v))], dist.real, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
            # Euclidean distance is the same. Will change when using directed weighted graphs
            dist = round(self.scaled_G.edges[v, u]['weight'],2)
            self.update_functions('traverse-cost', [KeyValue('w', 'waypoint'+str(v)), KeyValue('w', 'waypoint'+str(u))], dist.real, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
    
    def load_allocation(self):
        # Load allocation of vehicles to goals from a goal allocation algorithm
        try:
            self.allocated_goals = rospy.get_param(self.namespace + 'goals_allocated')
            self.NUMBER_OF_TURBINES = len(self.allocated_goals)
            rospy.logwarn('Number of Turbines for vehicle: ' + str(self.namespace) + ' is: '+ str(self.NUMBER_OF_TURBINES))
            rospy.logwarn('Turbines: ' + str(self.allocated_goals))
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
    rospy.logwarn('Populate KB for one vehicle, using its position')
    rospy.init_node('populate_KB', anonymous=True)
    problem = InitWaypoint()