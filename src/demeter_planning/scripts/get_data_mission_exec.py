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
from p_init import InitProblem


class DemeterExec(object):
    def __init__(self, auv_name, update_frequency):
        rospy.init_node('demeter_get_data_executive')
        rospy.loginfo('Executive started')
        rospy.sleep(2) # Wait for planning
        self.goal_state = list()
        self.data_in_predicate = list()
        # current_auv_name=rospy.get_param('/rosplan_demeter_exec/current_auv_name')
        # rospy.logwarn('AUV name in EXEC:'+  current_auv_name)
        self.demeter_rosplan_interface = DemeterInterface(demeter=DemeterActionInterface(auv_name,update_frequency=10.))
        # self.demeter_rosplan_interface = DemeterInterface(demeter=DemeterActionInterface('auv1',update_frequency=10.))
        self.mission_success=False
        waypoints_position = [rospy.get_param("/rosplan_demeter_exec/plan_wp_x"), rospy.get_param("/rosplan_demeter_exec/plan_wp_y"),rospy.get_param("/rosplan_demeter_exec/plan_wp_z")]
        last_waypoint_number = len(waypoints_position[0])-1
        self.data_in_wp = last_waypoint_number
        
        
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
            # self.halt_vehicle()
            self._rate.sleep()
            self.mission_success=False

    def resume_plan(self):
        rospy.Timer(self._rate.sleep_dur, self.execute_plan, oneshot=True)

    def get_data_mission(self):
        demeter.add_data_is_in_fact('data0','wp_turbine0_point'+str(self.data_in_wp))
        demeter.add_data_is_in_fact('data1','wp_turbine1_point'+str(self.data_in_wp))
        self._cancel_plan_proxy()
        demeter.clear_goals()
        demeter.get_data_set_goal('data0')
        demeter.get_data_set_goal('data1')
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
        response = self._dispatch_proxy()
        rospy.logwarn(response)
            
        if response.goal_achieved:
           rospy.loginfo('Executive Mission Succeed')
           self.mission_success=True
        else:
           rospy.logwarn('Executive Mission Failed')
           self.mission_success=False
        return response.goal_achieved

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
        
    def get_data_set_goal(self, data_goal):
        pred_names = [
            'data-sent'
        ]
        params = [[KeyValue('d', data_goal)]]
        self.goal_state.append(list([pred_names, params]))
        update_types = [
            KnowledgeUpdateServiceRequest.ADD_GOAL,
        ]
        succeed = self.demeter_rosplan_interface.update_predicates(pred_names,params,update_types)
        self._rate.sleep()
        return succeed
        
    def add_data_is_in_fact(self, data_goal, goal_wp):
        pred_names = [
            'is-in'
        ]
        params = [[KeyValue('d', data_goal), KeyValue('w',goal_wp)]]
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

    def halt_vehicle(self):
        self.demeter_rosplan_interface.interface_halt()

    def cancel_mission(self):
        self._cancel_plan_proxy()
        self._rate.sleep()
        rospy.loginfo('Cancel Mission!')    

if __name__ == '__main__':
    print('demeter get data mission exec')
    demeter = DemeterExec(auv_name='auv', update_frequency=4.)
    demeter.get_data_mission()
    rospy.spin()