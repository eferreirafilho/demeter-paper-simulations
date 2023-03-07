#!/usr/bin/env python
import rospy

class Roadmap(object):

    def load_get_data_allocation_parameters(self):
        self.vehicle_idx = rospy.get_param("/goal_allocation/vehicle_idx")
        self.data_idx = rospy.get_param("/goal_allocation/data_idx")
        self.poi_coordinates = rospy.get_param("/goal_allocation/poi_x"), rospy.get_param("/goal_allocation/poi_y") 
          

if __name__ == '__main__':
    rospy.logwarn('Roadmap')
    rospy.init_node('roadmap', anonymous=True)
    roadmap = Roadmap()