#!/usr/bin/env python

# 3rd Party Packages

# ROS Packages
from logging.config import listen
import rospy
from diagnostic_msgs.msg import KeyValue
from rosplan_dispatch_msgs.srv import DispatchService
from rosplan_dispatch_msgs.msg import ActionFeedback
from rosplan_knowledge_msgs.srv import KnowledgeUpdateServiceRequest
from std_srvs.srv import Empty
from interface import DemeterActionInterface
from rosplan_interface import DemeterInterface
import rospy
from std_msgs.msg import String

class DemeterExec(object):
    def __init__(self, update_frequency=4.):
        rospy.init_node('demeter_executive')
        rospy.loginfo('Executive started')
        rospy.sleep(1) # Wait for planning
        self.goal_state = list()
        self.data_in_predicate = list()
        self.demeter = DemeterInterface(demeter=DemeterActionInterface())
        self.mission_success=False

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
        # Subscribers
        rospy.Subscriber('/rosplan_plan_dispatcher/action_feedback', ActionFeedback, self.check_action_feedback, queue_size=10)
        # Auto call functions
        self._rate = rospy.Rate(update_frequency)
                
    def check_action_feedback(self,msg):
        """
        Check action feedback
        """
        if msg.status == ActionFeedback.ACTION_FAILED:
            self._rate.sleep()
            self.mission_success=False

    def resume_plan(self):
        """
        Function to flag down external intervention, and replan
        """
        rospy.Timer(self._rate.sleep_dur, self.execute, oneshot=True)

    def get_data_mission(self):
        """
        Cancel current plan and define goal to get and transmit the data in the last waypoint in the yaml file
        """
        self._cancel_plan_proxy()
        demeter.clear_goals() # Clear all goals
        demeter.get_data_set_goal() # Sets goal   
        self._rate.sleep()
        demeter.execute()

    def go_to_wp_mission(self,wp):
        """
        Cancel current plan and define goal: go to specified waypoint
        """
        self._cancel_plan_proxy()
        demeter.clear_goals() # Clear all goals
        demeter.goto_wp_set_goal(wp) # Sets goal
        self._rate.sleep()
        demeter.execute()

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
           self.mission_success=True
        else:
           rospy.loginfo('Mission Failed')
           self.mission_success=False
        return response.goal_achieved

    def clear_goals(self):
        """
        Clear all goals
        """
        update_types = [
            KnowledgeUpdateServiceRequest.REMOVE_GOAL,
        ]
        for goal in self.goal_state:
            if not goal==[]:
                self.demeter.update_predicates(goal[0], goal[1], update_types) # pred_names, params, update_type        
        self.goal_state = []
        self.mission_success=False
        return True
        
    def get_data_set_goal(self):
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
        
    def add_data_wp_location(self, goal_wp):
        """
        Spike Demo mission: add current data waypoint
        """
        pred_names = [
            'is-in'
        ]
        params = [[KeyValue('d', 'data1'), KeyValue('w',goal_wp)]]
        update_types = [
            KnowledgeUpdateServiceRequest.ADD_KNOWLEDGE,
        ]
        self.data_in_predicate.append(list([pred_names,params]))
        succeed = self.demeter.update_predicates(pred_names,params,update_types)
        self._rate.sleep()
        return succeed

    def clear_data_wp_location(self):
        """
        Spike Demo mission: clear all is-in data waypoint knowledge
        """
        update_types = [
            KnowledgeUpdateServiceRequest.REMOVE_KNOWLEDGE,
        ]
        for data in self.data_in_predicate:
            if not data==[]:
                self.demeter.update_predicates(data[0], data[1], update_types) # pred_names, params, update_type        
        self.data_in_predicate = []
        self._rate.sleep()
        return True
    
    def goto_wp_set_goal(self,goal_wp):
        """
        Go to especific waypoint
        """
        pred_names = [
            'at'
        ]
        params = [[KeyValue('v', 'vehicle1'), KeyValue('w',goal_wp)]]
        self.goal_state.append(list([pred_names, params]))
        
        update_types = [
            KnowledgeUpdateServiceRequest.ADD_GOAL,
        ]
        succeed = self.demeter.update_predicates(pred_names,params,update_types)
        self._rate.sleep()
        return succeed
 
    def vehicle_surface(self):
        """
        Send vehicle to surface 
        """
        self.demeter.surface()

    def cancel_mission(self):
        """
        Cancel and clear mission 
        """
        demeter.clear_goals() # Clear all goals
        demeter.clear_data_wp_location() # Clear data-in predicates
        # self.demeter.clear_data_sent_fact()
        self._cancel_plan_proxy()

        self._rate.sleep()
        rospy.loginfo('Cancel Mission!')    

    def gui_callback_listener(self, data):
        demeter.cancel_mission()
        self._rate.sleep()
        # print(data.data)
        # print(data.data[0])
        # print(type(data.data[0]))
        # print(type(0))
        # print(data.data[1:15])

        if data.data[1:15]=="Go To Waypoint":
            wp = data.data[16:]
            if data.data[0]==str(0):
                demeter.go_to_wp_mission('wp'+str(wp))
            elif data.data[0]==str(2): # Replanning Active
                while demeter.mission_success == False:
                    demeter.go_to_wp_mission('wp'+str(wp))
                    
        if data.data[1:9]=="Get Data":
            wp = data.data[10:]
            if data.data[0]==str(0):
                # self.demeter.clear_data_sent_fact()
                demeter.clear_data_wp_location()
                demeter.add_data_wp_location('wp'+str(wp))
                demeter.get_data_mission()
            elif data.data[0]==str(2): # Replanning Active
                while demeter.mission_success == False:
                    # self.demeter.clear_data_sent_fact()
                    demeter.clear_data_wp_location()
                    demeter.add_data_wp_location('wp'+str(wp))
                    demeter.get_data_mission()

        if data.data=="Clear Mission":
            print(self.demeter.data_sent_query())
            self.demeter.clear_data_sent_fact()
            # self.demeter.add_empty_vehicle_fact()
            # demeter.clear_data_wp_location() # Clear data-in predicates

            print(self.demeter.data_sent_query())

            # demeter.cancel_mission()
        rospy.loginfo('callback')    

    def gui_listener(self):
        # rospy.init_node('gui_subscriber', anonymous=True)
        rospy.Subscriber("planning/gui", String, self.gui_callback_listener)
        self._rate.sleep()
        rospy.loginfo('inside listener method')    

        rospy.spin()

if __name__ == '__main__':
    
    # rospy.init_node('demeter_executive')
    # rospy.loginfo('Executive started')
    demeter = DemeterExec()
    rospy.sleep(1) # Wait for planning
    # demeter.get_data_mission()
    
    # while demeter.mission_success == False:
    # rospy.loginfo_throttle('Listening')   
    demeter.gui_listener()
        

    #     demeter.get_data_mission() # Sets mission to get data in the last Waypoint
    #     # demeter.go_to_wp_mission('wp6') # Sets mission to go to specified Waypoint
    #     rospy.sleep(1) # Wait for planning
    # else:
    rospy.spin()