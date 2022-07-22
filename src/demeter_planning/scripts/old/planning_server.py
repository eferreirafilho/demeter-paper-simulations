#!/usr/bin/env python
from time import sleep
from std_srvs.srv import Empty
import rospy


def problem_generation():
    rospy.loginfo("Waiting for problem generation service")
    rospy.wait_for_service('rosplan_problem_interface/problem_generation_server')
    try:
        rospy.loginfo("Calling problem generation service")
        rospy.ServiceProxy('rosplan_problem_interface/problem_generation_server',Empty)()
        rospy.loginfo("Problem file updated")
        
    except rospy.rospy.ServiceException:
        rospy.loginfo("Service problem generation call failed")
        
def planning_server():
    rospy.loginfo("Waiting for planning server service")
    rospy.wait_for_service('rosplan_planner_interface/planning_server')
    try:
        rospy.loginfo("Calling planning server service")
        rospy.ServiceProxy('rosplan_planner_interface/planning_server',Empty)()
        rospy.loginfo("Planning server called")
        
    except rospy.rospy.ServiceException:
        rospy.loginfo("Planning server service problem, call failed")
    
def planning_parser():
    rospy.loginfo("Waiting for planning parser service")
    rospy.wait_for_service('rosplan_parsing_interface/parse_plan')
    try:
        rospy.loginfo("Calling planning parser service")
        rospy.ServiceProxy('rosplan_parsing_interface/parse_plan',Empty)()
        rospy.loginfo("Parsing server called")
        
    except rospy.rospy.ServiceException:
        rospy.loginfo("Parsing server service problem, call failed")

if __name__ == '__main__':
    
    sleep(5)  # Wait for Plan to be generated
    problem_generation()
    sleep(5)
    planning_server()
    
    

  