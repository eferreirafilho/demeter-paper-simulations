#!/usr/bin/env python
import random
import rospy
from std_msgs.msg import Float32

class MockLocalizationError(object):
    
    
    def __init__(self):
        self.ERROR_GROW_FACTOR=0.001
        self.pub=rospy.Publisher('/planning/mock_localization_error/', Float32, queue_size=10)
        rospy.init_node('mock_localization_error',anonymous=True)
        rospy.loginfo('Creating mock localization error ...')
        self.rate = rospy.Rate(10)

    def random_time(self):
        return self.ERROR_GROW_FACTOR*random.randint(1,100)

    def publish_mock_localization_error(self):
        t=0
        while not rospy.is_shutdown():
            self.localization_error = t*self.random_time()
            self.pub.publish(self.localization_error)
            rospy.loginfo('Publishing mock localization error ...')
            rospy.loginfo(self.localization_error)
            self.rate.sleep()
            t=t+1 

if __name__ == '__main__':
    mockError = MockLocalizationError()
    try:
        mockError.publish_mock_localization_error()
    except rospy.ROSInterruptException:
        rospy.loginfo('Error publishing mock localization error ...')