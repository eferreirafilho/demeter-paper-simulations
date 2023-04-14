#!/usr/bin/env python

import sys
import rospy
from rosplan_knowledge_msgs.srv import *
from rosplan_knowledge_msgs.msg import *

query = []

def call_service():
    print("Waiting for service")
    rospy.wait_for_service('/auv0/rosplan_knowledge_base/query_state')
    try:
        print("Calling Service")
        query_proxy = rospy.ServiceProxy('/auv0/rosplan_knowledge_base/query_state', KnowledgeQueryService)
        resp1 = query_proxy(query)
        print("Response is:", resp1.results)
    except rospy.ServiceException as e:
        print("Service call failed: %s", e)

if __name__ == "__main__":

    # QUERY 1 (battery-level auv0)
    query1 = KnowledgeItem()
    query1 = ExprBase()
    query1.knowledge_type = KnowledgeItem.FUNCTION
    query1.attribute_name = "battery-level"
    query1.values.append(diagnostic_msgs.msg.KeyValue("v", "vehicle0"))
    # query1.values.append(diagnostic_msgs.msg.KeyValue("wp", "wp0"))
    query.append(query1)

    call_service()
    sys.exit(1)