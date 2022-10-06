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
from interface import DemeterActionInterface
from rosplan_interface import DemeterInterface
from p_init import InitProblem

class DemeterExec(object):
    def __init__(self, update_frequency=4.):
        rospy.init_node('demeter_executive')
        rospy.loginfo('Executive started')
        rospy.sleep(1) # Wait for planning
        self.goal_state = list()
        self.data_in_predicate = list()
        self.demeter_rosplan_interface = DemeterInterface(demeter=DemeterActionInterface())
        self.mission_success=False
        self.replanning=False
        self.allow_backwards_movement = False

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
        rospy.Service('%s/resume_plan' % rospy.get_name(), Empty, self.resume_plan)
        rospy.Subscriber('/rosplan_plan_dispatcher/action_feedback', ActionFeedback, self.check_action_feedback, queue_size=10)
        self._rate = rospy.Rate(update_frequency)
                
    def check_action_feedback(self,msg):
        if msg.status == ActionFeedback.ACTION_FAILED:
            self.halt_vehicle()
            self._rate.sleep()
            self.mission_success=False

    def resume_plan(self):
        rospy.Timer(self._rate.sleep_dur, self.execute_plan, oneshot=True)

    def get_data_mission(self):
        self._cancel_plan_proxy()
        demeter.clear_goals()
        demeter.get_data_set_goal()
        self._rate.sleep()
        demeter.execute_plan()

    def go_to_wp_mission(self,wp):
        self._cancel_plan_proxy()
        demeter.clear_goals() 
        demeter.goto_wp_set_goal(wp) 
        self._rate.sleep()
        demeter.execute_plan()

    def execute_plan(self, event=True):
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
        if self.replanning==True:
            if self.plan_approved():
                response = self._dispatch_proxy()
            else:
                return False
        else:
            response = self._dispatch_proxy()
            
        if response.goal_achieved:
           rospy.loginfo('Mission Succeed')
           self.mission_success=True
        else:
           rospy.logwarn('Mission Failed')
           self.mission_success=False
        return response.goal_achieved

    def plan_approved(self):
        i = 0
        while i < 2:
            answer = raw_input("Accept plan? [y] or [n]")
            if any(answer.lower() == f for f in ["yes", 'y', '1', 'ye']):
                print("Yes")
                return True
            else:
                return False

    def clear_goals(self):
        update_types = [
            KnowledgeUpdateServiceRequest.REMOVE_GOAL,
        ]
        for goal in self.goal_state:
            if not goal==[]:
                self.demeter_rosplan_interface.update_predicates(goal[0], goal[1], update_types) # pred_names, params, update_type        
        self.goal_state = []
        self.mission_success=False
        return True
        
    def get_data_set_goal(self):
        pred_names = [
            'data-sent'
        ]
        params = [[KeyValue('d', 'data1')]]
        self.goal_state.append(list([pred_names, params]))
        update_types = [
            KnowledgeUpdateServiceRequest.ADD_GOAL,
        ]
        succeed = self.demeter_rosplan_interface.update_predicates(pred_names,params,update_types)
        self._rate.sleep()
        return succeed
        
    def add_data_is_in_fact(self, goal_wp):
        pred_names = [
            'is-in'
        ]
        params = [[KeyValue('d', 'data1'), KeyValue('w',goal_wp)]]
        update_types = [
            KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE,
        ]
        self.data_in_predicate.append(list([pred_names,params]))
        succeed = self.demeter_rosplan_interface.update_predicates(pred_names,params,update_types)
        self._rate.sleep()
        return succeed

    def clear_data_is_in_fact(self):
        update_types = [
            KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE,
        ]
        for data in self.data_in_predicate:
            if not data==[]:
                self.demeter_rosplan_interface.update_predicates(data[0], data[1], update_types) # pred_names, params, update_type        
        self.data_in_predicate = []
        self._rate.sleep()
        return True
    
    def goto_wp_set_goal(self,goal_wp):
        pred_names = [
            'at'
        ]
        params = [[KeyValue('v', 'vehicle1'), KeyValue('w',goal_wp)]]
        self.goal_state.append(list([pred_names, params]))
        
        update_types = [
            KnowledgeUpdateServiceRequest.ADD_GOAL,
        ]
        succeed = self.demeter_rosplan_interface.update_predicates(pred_names,params,update_types)
        self._rate.sleep()
        return succeed
 
    def vehicle_surface(self):
        self.demeter_rosplan_interface.surface()

    def vehicle_send_to_origin(self):
        self.demeter_rosplan_interface.send_to_origin()
    
    def vehicle_localize_rotate(self):
        self.demeter_rosplan_interface.localize_rotate()

    def halt_vehicle(self):
        self.demeter_rosplan_interface.interface_halt()

    def cancel_mission(self):
        self._cancel_plan_proxy()
        self._rate.sleep()
        rospy.loginfo('Cancel Mission!')    

    def clear_mission(self):
        self.demeter_rosplan_interface.clear_data_sent_fact()
        demeter.clear_goals()
        demeter.clear_data_is_in_fact()
        self.demeter_rosplan_interface.clear_carry_vehicle_fact()
        self.demeter_rosplan_interface.clear_data_sent_fact()
        self.demeter_rosplan_interface.clear_interface_localization_error_log()
        self.cancel_mission()

    def allow_backwards_movement_problem_file_correction(self):
        problem = InitProblem()
        problem.allow_backwards_moviment()

    def gui_callback_listener(self, data):
        self._rate.sleep()
        if data.data[0]==str(0): # Replanning Inactive
            self.replanning=False
        elif data.data[0]==str(2): # Replanning Active
            self.replanning=True
        if data.data[1]==str(0): # Don't allow backwards moviment
            self.allow_backwards_movement=False
        elif data.data[1]==str(2): # Allow backwards moviment
            self.allow_backwards_movement=True
            self.allow_backwards_movement_problem_file_correction()
        if data.data[2]==str(0): # Don't check Localization errors
            self.verify_localization_errors=False
            self.demeter_rosplan_interface.verify_localization_errors_off()
        elif data.data[2]==str(2): # Check Localization errors
            self.verify_localization_errors=True
            self.demeter_rosplan_interface.verify_localization_errors_on()

        if data.data[3:17]=="Go To Waypoint":
            wp = data.data[18:]
            if self.replanning==False:
                demeter.go_to_wp_mission('wp'+str(wp))
            elif self.replanning==True:
                if demeter.mission_success==True:
                    rospy.logwarn('Mission Succeded! Clear Mission to continue')
                while demeter.mission_success == False:
                    demeter.go_to_wp_mission('wp'+str(wp))
        
        if data.data[3:11]=="Get Data":
            wp = data.data[12:]
            if self.replanning==False:
                demeter.clear_data_is_in_fact()
                demeter.add_data_is_in_fact('wp'+str(wp))
                demeter.get_data_mission()
            elif self.replanning==True:
                if demeter.mission_success==True:
                    rospy.logwarn('Mission Succeded! Clear Mission to continue')
                while demeter.mission_success == False:
                    demeter.clear_data_is_in_fact()
                    demeter.add_data_is_in_fact('wp'+str(wp))
                    demeter.get_data_mission()

        if data.data=="Clear Mission":
            self.demeter_rosplan_interface.clear_data_sent_fact()
            demeter.clear_goals()
            self.demeter_rosplan_interface.clear_data_sent_fact()
            demeter.clear_data_is_in_fact()
            self.demeter_rosplan_interface.clear_carry_vehicle_fact()
            self.clear_mission()

        if data.data=="Surface":
            self.vehicle_surface()
            rospy.logwarn('Vehicle sent to surface')

        if data.data=="Send to Origin":
            self.vehicle_send_to_origin()
            rospy.logwarn('Vehicle sent to origin')

        if data.data=="Localize":
            self.vehicle_localize_rotate()
            rospy.logwarn('Localize Vehicle (Rotate)')

    def gui_listener(self):
        rospy.Subscriber("planning/gui", String, self.gui_callback_listener)
        self._rate.sleep()
        rospy.spin()

if __name__ == '__main__':
    
    demeter = DemeterExec()
    demeter.gui_listener()
    rospy.spin()