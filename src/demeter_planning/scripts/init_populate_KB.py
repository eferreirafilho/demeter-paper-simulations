#!/usr/bin/env python
import rospy
import random
from rosplan_knowledge_msgs.srv import *
from rosplan_knowledge_msgs.msg import KnowledgeItem, diagnostic_msgs
from threading import Lock


from diagnostic_msgs.msg import KeyValue

class InitPopulateKB(object):

    mutex = Lock()
    def __init__(self):
        self._knowledge_update_proxy = rospy.ServiceProxy('/rosplan_knowledge_base/update', KnowledgeUpdateService)
        self.turbines_coordinates = self.load_turbines_coordinates_from_param()        
        self.vehicle_idx, self.data_idx = self.load_get_data_allocations_from_param()       
        rospy.loginfo('InitPopulateKB: Turbines coordinates: %s', self.turbines_coordinates) 
        rospy.loginfo('InitPopulateKB: Vehicles indexes: %s', self.vehicle_idx)

        # Add the data loaded from param to the KB
        self.add_data_instances()
        # Add the vehicles loaded from param to the KB
        self.add_vehicle_instances()
        # Add the waypoints to the KB
        NUMBER_OF_WAYPOINTS_PER_TURBINE = 6
        self.add_waypoint_instances(NUMBER_OF_WAYPOINTS_PER_TURBINE)
        
        # Add the waypoints to the KB
        self.add_predicates('can-move', 'turbine0wp1', KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
        
        
    def load_turbines_coordinates_from_param(self):
        coordinates = [rospy.get_param('/init_populate_KB/turbines_x'), rospy.get_param('/init_populate_KB/turbines_y')]
        return coordinates
            
    def load_get_data_allocations_from_param(self):
        robot_idx, data_idx = [rospy.get_param('/init_populate_KB/vehicle_idx'), rospy.get_param('/init_populate_KB/data_idx')]
        return robot_idx, data_idx

    def add_data_instances(self):
        for i in range(len(self.data_idx)):
            self.add_instance('data', 'data'+str(i), KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
            
    def add_vehicle_instances(self):
        for i in range(len(self.vehicle_idx)):
            self.add_instance('vehicle', 'vehicle'+str(i), KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
            
    def add_waypoint_instances(self, number_of_waypoints_per_turbine):
        # count_wp=0
        for i in range(len(self.turbines_coordinates[0])):
            for j in range(number_of_waypoints_per_turbine):
                self.add_instance('waypoint', 'turbine'+str(i)+'wp'+str(j), KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE)
                
    def add_instance(self, instance_type, instance_name, update_type):
        self.mutex.acquire()
        req = KnowledgeUpdateServiceRequest()
        req.knowledge.knowledge_type = KnowledgeItem.INSTANCE
        req.knowledge.instance_type = instance_type
        req.knowledge.instance_name = instance_name
        req.update_type = update_type
        if not self._knowledge_update_proxy(req).success:
            rospy.logerr("KCL: (%s) Instance was not added!" % rospy.get_name())
        self.mutex.release()
            
    def add_predicates(self, predicate_name, predicate_params, update_type):
        self.mutex.acquire()
        print('predicate_name: ', predicate_name)
        print('predicate_params: ', predicate_params)
        req = KnowledgeUpdateServiceRequest()
        req.knowledge.knowledge_type = KnowledgeItem.FACT
        req.knowledge.attribute_name = predicate_name
        req.knowledge.values = predicate_params
        req.update_type = update_type        
        self.mutex.release()

if __name__ == '__main__':
    rospy.logdebug('init_populate_KB.py')
    rospy.init_node('init_populate_KB', anonymous=True)
    problem = InitPopulateKB()