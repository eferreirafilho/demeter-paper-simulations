#!/usr/bin/env python

import rospy
from demeter_planning.srv import problem_reduction, problem_reductionResponse

def callback(request):
    
    rospy.logwarn('Received request to create a reducted problem file')
    
    print(request.auv_id)
    print(request.relevant_poi)
    return problem_reductionResponse(1)
    

def problem_reduction():
    rospy.init_node("problem_reduction_service")
    service = rospy.Service('problem_reduction', problem_reduction, callback)
    
    
    rospy.spin()
    

if __name__ == '__main__':
    problem_reduction()
    