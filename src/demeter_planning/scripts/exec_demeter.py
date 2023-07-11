#!/usr/bin/env python
# ROS
import rospy
from std_srvs.srv import Empty
# ROSplan
from rosplan_dispatch_msgs.srv import DispatchService
from rosplan_dispatch_msgs.msg import ActionFeedback
from rosplan_knowledge_msgs.srv import KnowledgeUpdateServiceRequest
# Project
from action_interface import DemeterActionInterface
from rosplan_interface import DemeterInterface

class ExecDemeter(object):
    def __init__(self, update_frequency=4.):
        self._rate = rospy.Rate(update_frequency)
        self.namespace = self.get_namespace()
        self.demeter_rosplan_interface = DemeterInterface(demeter=DemeterActionInterface(namespace=self.namespace))
        self.mission_success = False
        self.goal_state = list()
        self.rosplan_services()
               
    def rosplan_services(self):
        # Service proxies: Problem Generation, Planning, Parsing, Dispatching
        rospy.loginfo('Waiting for rosplan services...')
        rospy.wait_for_service(str(self.namespace)+'rosplan_problem_interface/problem_generation_server')
        self._problem_proxy = rospy.ServiceProxy(str(self.namespace)+'rosplan_problem_interface/problem_generation_server', Empty)
        rospy.wait_for_service(str(self.namespace)+'rosplan_planner_interface/planning_server')
        self._planner_proxy = rospy.ServiceProxy(str(self.namespace)+'rosplan_planner_interface/planning_server', Empty)
        rospy.wait_for_service(str(self.namespace)+'rosplan_parsing_interface/parse_plan')
        self._parser_proxy = rospy.ServiceProxy(str(self.namespace)+'rosplan_parsing_interface/parse_plan', Empty)
        rospy.wait_for_service(str(self.namespace)+'rosplan_plan_dispatcher/dispatch_plan')
        self._dispatch_proxy = rospy.ServiceProxy(str(self.namespace)+'rosplan_plan_dispatcher/dispatch_plan', DispatchService)
        rospy.wait_for_service(str(self.namespace)+'rosplan_plan_dispatcher/cancel_dispatch')
        self._cancel_plan_proxy = rospy.ServiceProxy(str(self.namespace)+'rosplan_plan_dispatcher/cancel_dispatch', Empty)
        self.clear_KB()
        self.resume_plan()
      
        rospy.Subscriber(str(self.namespace)+'rosplan_plan_dispatcher/action_feedback', ActionFeedback, self.check_action_feedback, queue_size=10)
            
    def get_namespace(self):
        namespace = rospy.get_namespace()
        return namespace
    
    def check_action_feedback(self,msg):
        if msg.status == ActionFeedback.ACTION_FAILED:
            self.mission_success=False
            
    def resume_plan(self):
        rospy.Timer(self._rate.sleep_dur, self.execute_plan, oneshot=True)

    def execute_plan(self):
        rospy.logwarn('Generating mission plan ...')
        self._problem_proxy()
        try: 
            self._planner_proxy()
        except:
            rospy.logwarn('Planning attempt failed')
            self.mission_success=False
            return self.mission_success
        rospy.logwarn('Execute mission plan ...')
        self._parser_proxy()
        response = self._dispatch_proxy()
        rospy.logwarn('Response: ' + str(response))
            
        if response.goal_achieved:
           rospy.logwarn('Mission Succeed')
           self.mission_success=True
        else:
           rospy.logwarn('Mission Failed')
           self.mission_success=False
        return self.mission_success  
    
    def clear_KB(self):
        # self._clear_KB_proxy()
        try:
            rospy.wait_for_service(str(self.namespace)+'rosplan_knowledge_base/clear')
            self._clear_KB_proxy = rospy.ServiceProxy(str(self.namespace)+'rosplan_knowledge_base/clear', Empty)
        except rospy.ServiceException as e:
            rospy.logwarn("clear KB service error: %s", e)

    def resume_plan(self):
        try:
            rospy.Service('%s/resume_plan' % rospy.get_name(), Empty, self.resume_plan)
        except rospy.ServiceException as e:
            rospy.logwarn("Service already registered: %s", e)