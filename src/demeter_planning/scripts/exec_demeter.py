#!/usr/bin/env python
# ROS
import rospy
from diagnostic_msgs.msg import KeyValue
from std_srvs.srv import Empty
from std_msgs.msg import String
# ROSplan
from rosplan_dispatch_msgs.srv import DispatchService
from rosplan_dispatch_msgs.msg import ActionFeedback
from rosplan_knowledge_msgs.srv import KnowledgeUpdateServiceRequest
# Project
from action_interface import DemeterActionInterface
from rosplan_interface import DemeterInterface
from create_problem_instance import PopulateKB

class ExecDemeter(object):
    def __init__(self, update_frequency=4.):
        self._rate = rospy.Rate(update_frequency)
        rospy.sleep(2) # Wait for planning
        self.namespace = self.get_namespace()
        self.demeter_rosplan_interface = DemeterInterface(demeter=DemeterActionInterface(namespace=self.namespace))
        self.mission_success = False
        self.goal_state = list()
        self.rosplan_services()
        # self.clear_mission()
        rospy.sleep(2) # Wait for planning
        
        # Plan
        # self.rosplan_services()
               
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
        self._cancel_plan_proxy = rospy.ServiceProxy(str(self.namespace)+'rosplan_plan_dispatcher/cancel_dispatch', Empty)
        try:
            rospy.Service('%s/resume_plan' % rospy.get_name(), Empty, self.resume_plan)
        except rospy.ServiceException as e:
            rospy.logwarn("Service already registered: %s", e)
        rospy.Subscriber(str(self.namespace)+'rosplan_plan_dispatcher/action_feedback', ActionFeedback, self.check_action_feedback, queue_size=10)
            
    def get_namespace(self):
        namespace = rospy.get_namespace()
        return namespace
    
    def check_action_feedback(self,msg):
        if msg.status == ActionFeedback.ACTION_FAILED:
            self._rate.sleep()
            self.mission_success=False
            
    def resume_plan(self):
        rospy.Timer(self._rate.sleep_dur, self.execute_plan, oneshot=True)

    def execute_plan(self, event=True):
        rospy.loginfo('Generating mission plan ...')
        self._problem_proxy()
        self._rate.sleep()
        rospy.loginfo('Planning ...')
        try: 
            self._planner_proxy()
        except:
            rospy.logwarn('Planning attempt failed')
            self.mission_success=False
            return self.mission_success
        self._rate.sleep()
        rospy.loginfo('Execute mission plan ...')
        self._parser_proxy()
        self._rate.sleep()
        response = self._dispatch_proxy()
            
        if response.goal_achieved:
           rospy.loginfo('Mission Succeed')
           self.mission_success=True
        else:
           rospy.logwarn('Mission Failed')
           self.mission_success=False
           return self.mission_success
        
    def mission_completed(self):
        return self.mission_success
    
    def get_data_set_goal(self, data):
        pred_names = [
            'data-sent'
        ]
        params = [[KeyValue('d', data)]]
        self.goal_state.append(list([pred_names, params]))
        update_types = [
            KnowledgeUpdateServiceRequest.ADD_GOAL,
        ]
        succeed = self.demeter_rosplan_interface.update_predicates(pred_names,params,update_types)
        self._rate.sleep()
        return succeed
    
    def cancel_mission(self):
        self.mission_success = False
        self._cancel_plan_proxy()
        self._rate.sleep()
        rospy.loginfo('Cancel Mission!')    
    
    def clear_mission(self):
        self.demeter_rosplan_interface.clear_data_sent_fact()
        # demeter.clear_goals()
        # demeter.clear_data_is_in_fact()
        self.demeter_rosplan_interface.clear_carry_vehicle_fact()
        # self.demeter_rosplan_interface.clear_data_sent_fact()
        self.cancel_mission()
     

# if __name__ == '__main__':
    # print('demeter_plan_exec')
    # rospy.loginfo('Executive started')
    # rospy.init_node('demeter_executive')
    
    
    # demeter = ExecDemeter()
    # # demeter.rosplan_services()
    
    # while not rospy.is_shutdown():
    #     mission_counter=0
    #     demeter.execute_plan()
        # while not demeter.mission_success:
        #     demeter._rate.sleep()
        # # Shift allocation
        # demeter.clear_mission()
        # demeter.shift_allocation_param()
        # mission_counter = mission_counter + 1
        # demeter._rate.sleep()
        # demeter.clear_mission()

    # rospy.spin()