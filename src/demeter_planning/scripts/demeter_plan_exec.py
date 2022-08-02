#!/usr/bin/env python

# 3rd Party Packages

# ROS Packages
from signal import pause
from turtle import position

from dbus import Interface
import rospy
from diagnostic_msgs.msg import KeyValue
from rosplan_dispatch_msgs.srv import DispatchService
from rosplan_knowledge_msgs.srv import KnowledgeUpdateServiceRequest
from std_srvs.srv import Empty
from interface import DemeterActionInterface
from rosplan_interface import DemeterInterface

class DemeterExec(object):
    def __init__(self, update_frequency=4.):
        self.goal_state = list()
        self.demeter = DemeterInterface(name='demeter1',demeter=DemeterActionInterface())
        # Service proxies: Problem Generation, Planning, Parsing, Dispatching
        rospy.loginfo('Waiting for rosplan services...')
        rospy.wait_for_service('/rosplan_problem_interface/problem_generation_server')
        self._problem_proxy = rospy.ServiceProxy('/rosplan_problem_interface/problem_generation_server', Empty)
        rospy.wait_for_service('/rosplan_planner_interface/planning_server')
        self._planner_proxy = rospy.ServiceProxy('/rosplan_planner_interface/planning_server', Empty)
        rospy.wait_for_service('/rosplan_parsing_interface/parse_plan')
        self._parser_proxy = rospy.ServiceProxy('/rosplan_parsing_interface/parse_plan', Empty)
        rospy.wait_for_service('/rosplan_plan_dispatcher/dispatch_plan')
        self._dispatch_proxy = rospy.ServiceProxy('/rosplan_plan_dispatcher/dispatch_plan', DispatchService)
        self._cancel_plan_proxy = rospy.ServiceProxy('/rosplan_plan_dispatcher/cancel_dispatch', Empty)
        # Service
        rospy.Service('%s/resume_plan' % rospy.get_name(), Empty, self.resume_plan)
        # Auto call functions
        self._rate = rospy.Rate(update_frequency)
                
        
    def resume_plan(self, req):
        """
        Function to flag down external intervention, and replan
        """
        self.demeter.resume_plan()
        rospy.Timer(self._rate.sleep_dur, self.execute, oneshot=True)
        return list()
    

    def execute(self, event=True):
        """
        Execute plan using ROSPlan
        """
        rospy.loginfo('Generating mission plan ...')
        self._problem_proxy()
        self._rate.sleep()
        rospy.loginfo('Planning ...')
        try: 
            self._planner_proxy()
        except:
            rospy.logwarn('Planning attempt failed')
        self._rate.sleep()
        rospy.loginfo('Execute mission plan ...')
        self._parser_proxy()
        self._rate.sleep()
        response = self._dispatch_proxy()
        if response.goal_achieved:
           rospy.loginfo('Mission Succeed')
        else:
           rospy.loginfo('Mission Failed')
        return response.goal_achieved

    def clear_mission(self):
        """
        Clear all goals
        """
        update_types = [
            KnowledgeUpdateServiceRequest.REMOVE_GOAL,
        ]
        for goal in self.goal_state:
            self.demeter.update_predicates(goal[0], goal[1], update_types) # pred_names, params, update_type
        
        self.goal_state = [list(), list()]
        
    def get_data_mission(self):
        """
        Spike Demo mission: Retrieve data from a WP and transmit from the surface
        """
        pred_names = [
            'data-sent'
        ]
        params = [[KeyValue('d', 'data1')]]
        self.goal_state.append(list([pred_names, params]))
        update_types = [
            KnowledgeUpdateServiceRequest.ADD_GOAL,
        ]
        succeed = self.demeter.update_predicates(pred_names,params,update_types)
        self._rate.sleep()
        return succeed
    
    def goto_wp_mission(self,goal_wp):
        """
        Toy mission
        """
        pred_names = [
            'at'
        ]
        params = [[KeyValue('v', 'vehicle1'), KeyValue('w',goal_wp)]]
        # self.goal_state = (pred_names, params)
        self.goal_state.append(list([pred_names, params]))
        
        update_types = [
            KnowledgeUpdateServiceRequest.ADD_GOAL,
        ]
        succeed = self.demeter.update_predicates(pred_names,params,update_types)
        self._rate.sleep()
        return succeed
    
    def set_home(self,goal_wp):
        """
        Define wp0 as 'home', 
        """
        pass
 
if __name__ == '__main__':
    rospy.init_node('demeter_executive')
    
        
    rospy.loginfo('Exec started')
    rospy.sleep(1) # Wait for planning
    demeter = DemeterExec()
       
    # demeter.set_init_position() # Sets the initial position in KB
    
    demeter.get_data_mission() # Sets goal    
    demeter.goto_wp_mission('wp1') # Sets goal
    demeter.goto_wp_mission('wp2') # Sets goal
    
    rospy.sleep(1) # Wait for planning
    
    while not demeter.execute():
        rospy.logwarn_once('Planner Failed, submerging ... ')
        demeter.clear_mission() # Clear all goals
        # submerge()
        rospy.sleep(1) # Wait for planning
        demeter.get_data_mission() # Sets goal    
        
        demeter.goto_wp_mission('wp0') # Sets goal
        demeter.execute() # Replan
    else:
        rospy.logwarn('Planner Succeded ')   
        
    rospy.logwarn('Spin')
    rospy.spin()