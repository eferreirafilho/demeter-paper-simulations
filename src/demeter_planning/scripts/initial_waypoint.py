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
        self.poi_position = action_interface_object.load_poi()
        closer_wp_position = [self.poi_position[0][self.closer_wp],  self.poi_position[1][self.closer_wp], self.poi_position[2][self.closer_wp]]
        self.distance_to_closer_wp = self.distance(self.position, closer_wp_position)
        self.init_position_to_KB()
        self.roadmap_edges = self.poi_connections()
        self.build_graph()
        self.load_allocation()
        self.build_reduced_graph()
        self.add_reduced_can_move()
        
    def init_position_to_KB(self):
            self.add_object('wp_init_auv'+str(self.vehicle_id),'waypoint') # Define waypoint object for initial position
            self.add_fact('at','vehicle'+str(self.vehicle_id),'wp_init_auv'+str(self.vehicle_id)) # Real initial position
            # Vehicle can move between initial position and closest waypoint
            self.add_fact('can-move', 'wp_init_auv'+str(self.vehicle_id), 'waypoint'+str(self.closer_wp)) # vehicle can move to its closer waypoint from initial waypoint
            dist=float(self.distance_to_closer_wp.real)
            self.update_functions('traverse-cost', [KeyValue('w', 'wp_init_auv'+str(self.vehicle_id)), KeyValue('w', 'waypoint'+str(self.closer_wp))], dist, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)

    def poi_connections(self):
        edges = [rospy.get_param(str(self.namespace)+"init_populate_KB/edges_i"), rospy.get_param(str(self.namespace)+"init_populate_KB/edges_j")]
        return edges
    
    def build_graph(self):
        self.G = nx.Graph()
        # Add nodes from poi_coordinates param
        for i in range(len(self.poi_position[0])):
            self.G.add_node(i, pos = (self.poi_position[0][i], self.poi_position[1][i], self.poi_position[2][i]))
        # Add edges from poi_connections param
        for i in range(len(self.roadmap_edges[0])):
            self.G.add_edge(self.roadmap_edges[0][i],self.roadmap_edges[1][i])
        
    def get_shortest_path_subgraph(self, source, target):
        # Build a new graph using only the relevant POIs
        shortest_path = nx.shortest_path(self.G, source=source, target=target, weight='weight')

        # Extract the subgraph consisting of nodes in the shortest path
        subgraph_nodes = set(shortest_path)
        subgraph_edges = [(shortest_path[i], shortest_path[i+1]) for i in range(len(shortest_path)-1)]
        shortest_path_subgraph = self.G.subgraph(subgraph_nodes).edge_subgraph(subgraph_edges)
        return shortest_path_subgraph
    
    def build_reduced_graph(self):
        combined_pois = []
        combined_pois.extend(self.allocated_goals)
        combined_pois.append(self.closer_wp)
        rospy.logwarn('combined_pois')   
        rospy.logwarn(combined_pois)   
        self.reduced_G = nx.Graph()
        
        # Create subgraphs for every pair of POI
        for poi_i in combined_pois:
            for poi_j in combined_pois:
                if poi_i != poi_j:
                    partial_subgraph = self.get_shortest_path_subgraph(int(poi_i), int(poi_j))
                    self.reduced_G.add_nodes_from(partial_subgraph.nodes())
                    self.reduced_G.add_edges_from(partial_subgraph.edges())
        rospy.logwarn(self.reduced_G.nodes())
        rospy.logwarn(self.reduced_G.edges())
    
    def add_reduced_can_move(self):
        # Add can-move and traverse-cost only of relevant POI
        for u, v in self.reduced_G.edges():
            self.add_fact('can-move', 'waypoint'+str(u), 'waypoint'+str(v))
            self.add_fact('can-move', 'waypoint'+str(v), 'waypoint'+str(u))
            p1 = self.G.nodes[u]['pos']
            p2 = self.G.nodes[v]['pos']
            dist = sqrt((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2)
            self.update_functions('traverse-cost', [KeyValue('w', 'waypoint'+str(u)), KeyValue('w', 'waypoint'+str(v))], dist.real, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
            # Euclidean distance is the same. Will change when using directed weighted graphs
            dist = sqrt((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2)
            self.update_functions('traverse-cost', [KeyValue('w', 'waypoint'+str(v)), KeyValue('w', 'waypoint'+str(u))], dist.real, KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
            
    
    def load_allocation(self):
        self.allocated_goals = rospy.get_param(self.namespace + 'goals_allocated')
        rospy.logwarn(self.allocated_goals)

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
            
    def extract_number_from_string(self, string):
        match = re.search(r'\d+', string)
        if match:
            return int(match.group())
        else:
            return None

if __name__ == '__main__':
    rospy.logwarn('Include Close Waypoint in KB')
    rospy.init_node('init_position', anonymous=True)
    problem = InitWaypoint()