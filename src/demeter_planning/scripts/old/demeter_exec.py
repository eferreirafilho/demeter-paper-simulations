#!/usr/bin/env python

import rospy
from std_srvs.srv import Empty
from rosplan_dispatch_msgs.srv import DispatchService

class DEMETERExec(object):
    def __init__(self,update_frequency=4.):
        self.goal_state = list()
            # Service proxies
        rospy.loginfo('Waiting for rosplan services...')
        rospy.wait_for_service(
            '/rosplan_problem_interface/problem_generation_server')
        self._problem_proxy = rospy.ServiceProxy(
            '/rosplan_problem_interface/problem_generation_server', Empty)
        rospy.wait_for_service('/rosplan_planner_interface/planning_server')
        self._planner_proxy = rospy.ServiceProxy(
            '/rosplan_planner_interface/planning_server', Empty)
        rospy.wait_for_service('/rosplan_parsing_interface/parse_plan')
        self._parser_proxy = rospy.ServiceProxy(
            '/rosplan_parsing_interface/parse_plan', Empty)
        rospy.wait_for_service('/rosplan_plan_dispatcher/dispatch_plan')
        self._dispatch_proxy = rospy.ServiceProxy(
            '/rosplan_plan_dispatcher/dispatch_plan', DispatchService)
        self._cancel_plan_proxy = rospy.ServiceProxy(
            '/rosplan_plan_dispatcher/cancel_dispatch', Empty)
        # Service
        rospy.Service('%s/resume_plan' % rospy.get_name(), Empty,
                      self.resume_plan)
        # Auto call functions
        self._rate = rospy.Rate(update_frequency)
        #rospy.Timer(self._rate.sleep_dur, self.lowbat_return)

    def resume_plan(self, req):
        """
        Function to flag down external intervention, and replan
        """
        #TODO: self.uav.resume_plan()
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
        self._planner_proxy()
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
    
if __name__ == '__main__':
    rospy.init_node('demeter_executive')
    vehicle_obj = DEMETERExec()
    vehicle_obj.execute()
    rospy.spin()