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
        rospy.logwarn('Populating KB with robots initial position')
        self.namespace = rospy.get_namespace()
        self.vehicle_id = self.extract_number_from_string(self.namespace)
        action_interface_object = DemeterActionInterface(self.namespace)
        self.position = action_interface_object.get_position()
        action_interface_object.set_init_position_param(self.position)  
        self.closer_wp = action_interface_object.closer_wp([self.position.x, self.position.y, self.position.z])
        self.build_graph()
        closer_wp_position = [self.poi_position[0][self.closer_wp],  self.poi_position[1][self.closer_wp], self.poi_position[2][self.closer_wp]]
        self.distance_to_closer_wp = self.distance(self.position, closer_wp_position)
        self.init_position_to_KB()
        self.load_allocation()
        self.build_reduced_graph()
        self.add_reduced_can_move()
        
        # self.draw_roadmap()
        # self.draw_weights()
        # self.draw_vehicle()
        # self.draw_turbines_labels()
        plt.show()
        
        # Mission test
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

    def add_goal_mission(self, goal):   
        self.add_object('data'+str(goal),'data')
        self.add_fact('is-in','data'+str(goal),'waypoint'+str(goal))
        self.add_goal('data-sent', 'data'+str(goal))
        
    def print_turbine_dist_to_zero(self):
        NUMBER_OF_TURBINES=60
        for i in range(len(self.poi_position[0])):
            if i < NUMBER_OF_TURBINES:
                dist_to_zero = sqrt(self.poi_position[0][i]**2 + self.poi_position[1][i]**2)
        
    def init_position_to_KB(self):
            self.add_object('wp_init_auv'+str(self.vehicle_id),'waypoint') # Define waypoint object for initial position
            self.add_fact('at','vehicle'+str(self.vehicle_id),'wp_init_auv'+str(self.vehicle_id)) # Real initial position
            
            # InitProblem.add_fact(self, 'at','vehicle'+str(self.vehicle_id),'wp_init_auv'+str(self.vehicle_id)) # Real initial position
            # Vehicle can move between initial position and closest waypoint
            self.add_fact('can-move', 'wp_init_auv'+str(self.vehicle_id), 'waypoint'+str(self.closer_wp)) # vehicle can move to its closer waypoint from initial waypoint
            dist=float(self.distance_to_closer_wp.real)
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
            
    def get_shortest_path_subgraph(self, source, target_turbine):
        # Build a new graph using only the relevant POIs
        countor_points = []
        # find all nodes with description 'countor_point'
        for node, data in self.scaled_G.nodes(data=True):
            if data['description'] == 'countor_point':
                countor_points.append(node)
        
        # find the shortest path from node 'source' to the closest countor point of target turbine
        shortest_path = None
        min_distance = float('inf')

        for countor_point in countor_points:
            # check if the countor point is related to the target turbine
            if self.scaled_G.nodes[countor_point]['related_to'] == target_turbine:
                # compute the shortest path from node 'source' to this countor point
                path = nx.dijkstra_path(self.scaled_G, source, countor_point, weight='weight')
                distance = nx.dijkstra_path_length(self.scaled_G, source, countor_point, weight='weight')
                # update the shortest path if this path is shorter
                if distance < min_distance:
                    shortest_path = path
                    min_distance = distance
        
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
        
        # Create subgraphs for every pair of turbine in the allocated goals
        for poi_i in combined_pois:
            for poi_j in combined_pois:
                if poi_i != poi_j:
                    partial_subgraph = self.get_shortest_path_subgraph(int(poi_i), int(poi_j))
                    self.reduced_G.add_nodes_from(partial_subgraph.nodes())
                    self.reduced_G.add_edges_from(partial_subgraph.edges())
                    
        # Create subgraphs from vehicle's closer waypoint to every turbine in the allocated goals
        for poi_i in combined_pois:
                    partial_subgraph = self.get_shortest_path_subgraph(int(self.closer_wp), int(poi_i))
                    self.reduced_G.add_nodes_from(partial_subgraph.nodes())
                    self.reduced_G.add_edges_from(partial_subgraph.edges())
    
    def add_reduced_can_move(self):
        # Add can-move and traverse-cost only of relevant POI
        for u, v in self.reduced_G.edges():
            self.add_fact('can-move', 'waypoint'+str(u), 'waypoint'+str(v))
            self.add_fact('can-move', 'waypoint'+str(v), 'waypoint'+str(u))
            dist = self.scaled_G.edges[u, v]['weight']
            self.update_functions('traverse-cost', [KeyValue('w', 'waypoint'+str(u)), KeyValue('w', 'waypoint'+str(v))], dist.real, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
            # Euclidean distance is the same. Will change when using directed weighted graphs
            dist = self.scaled_G.edges[v, u]['weight']
            self.update_functions('traverse-cost', [KeyValue('w', 'waypoint'+str(v)), KeyValue('w', 'waypoint'+str(u))], dist.real, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
    
    def load_allocation(self):
        # Load allocation of vehicles to goals from a goal allocation algorithm
        try:
            self.allocated_goals = rospy.get_param(self.namespace + 'goals_allocated')
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