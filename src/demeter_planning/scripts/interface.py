#!/usr/bin/env python

from sre_constants import SUCCESS
from turtle import distance
import rospy

from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped


class DemeterActionInterface(object):

    OUT_OF_DURATION = -1
    ACTION_SUCCESS = 1
    ACTION_FAIL = 0

    def __init__(self, update_frequency=10.):
        """
        A Class that interfaces ROSPlan and Demeter Vehicle for executing actions
        """
        self.wp_reached = -1
        self.previous_mode = ''
        self.current_mode = ''
        self.external_intervened = False
        self.waypoints = list()
        self._current_wp = -1
        self.odom_pose = Odometry()

        # TODO: UUV Service proxies

        self._rate = rospy.Rate(update_frequency)

        # Subscribers
        rospy.loginfo('Connecting ROS and Vehicle ...')
        self.pub=rospy.Subscriber('/auv/pose_gt/', Odometry, self._pose_gt_cb, queue_size=10)

        self._wait(2) 
            
    def _wait(self, n_rate):
        """
        Sleep for n times rate
        """
        for _ in range(n_rate):
            self._rate.sleep()
        
    def _pose_gt_cb(self, msg):
        """
        Demeter pose callback
        """
        self.odom_pose = msg
    
    # TODO: 
    def load_wp_config_from_file(self):
        """
        Load waypoints configuration from file under params folder
        """
        waypoints = [rospy.get_param("/rosplan_demeter_exec/plan_wp_x"), rospy.get_param("/rosplan_demeter_exec/plan_wp_y"),rospy.get_param("/rosplan_demeter_exec/plan_wp_z")]
        return waypoints
    
    def do_move(self, waypoint, duration=rospy.Duration(60, 0)):
        """
        Go to specific waypoint action
        """
        rospy.loginfo('Interface: WP'+ str(waypoint) + ' inside \'Go To\' Action')
        self.wp_reached = -1
        start = rospy.Time.now()
        self.set_current_target_wp(waypoint)

        rospy.loginfo('Waypoints Set!!!')
                
        # TODO: Send cmd_pose and verify if robot has reached the pose 
        # while (rospy.Time.now() - start < duration) and not (rospy.is_shutdown()) and ((waypoint != self.wp_reached)):
        #     rospy.loginfo('Send cmd_pose')          
        #     rospy.loginfo('Querying distance to waypoint...')
        #     self.wp_reached_query(waypoint)
        #     self._rate.sleep()

        self.wp_reached=waypoint # MOCK SUCCESS 
        
        response = int(waypoint == self.wp_reached)
                
        if (rospy.Time.now() - start) > duration:
            response = self.OUT_OF_DURATION
 
        return response
    
    def do_get_data(self, duration=rospy.Duration(60, 0)):
        """
        Get data action
        """
        rospy.loginfo('Interface: Mock \'Get Data\' Action')
        start = rospy.Time.now()

        if (rospy.Time.now() - start) > duration:
            response = self.OUT_OF_DURATION
        response = self.ACTION_SUCCESS #MOCK SUCCESS # TODO
        return response
    
    def do_transmit_data(self, duration=rospy.Duration(60, 0)):
        """
        Go to specific waypoint action
        """
        rospy.loginfo('Interface: Mock \'Transmit\' Action')
        start = rospy.Time.now()

        if (rospy.Time.now() - start) > duration:
            response = self.OUT_OF_DURATION
        response = self.ACTION_SUCCESS #MOCK SUCCESS # TODO
        return response
    
    def set_current_target_wp(self, wp_index):
        """
        Set target wp for UAV to go
        """
        #print('Set current target WP: ', wp_index)
        
        waypoints=self.load_wp_config_from_file() # Load the waypoints yaml everytime a new WP will be set
        wp_set=[item[wp_index] for item in waypoints] # Get specified waypoint
        rospy.set_param('wp_plan_set',wp_set)       
        rospy.loginfo('Waypoint set to ROS parameter /wp_plan_set')
        rospy.loginfo(wp_set)

    def wp_reached_query(self, waypoint):
        """
        Check if robot has reached set waypoint
        """
        rospy.loginfo(self.odom_pose.pose.pose.position.x)
        #if distance(self,)
        
        #if SUCCESS
        #self.wp_reached=waypoint
              
        # waypoints=self.load_wp_config_from_file() # Load the waypoints yaml everytime a new WP will be set
        # wp_set=[item[wp_index] for item in waypoints] # Get specified waypoint
        # rospy.set_param('wp_plan_set',wp_set)       
        # rospy.loginfo('Waypoint set to ROS parameter /wp_plan_set')

    def update_wp_position(self, event):
        """
        Update vehicle position in terms of waypoint
        """
        wp = -1
        for idx, waypoint in enumerate(self.waypoints):
            x_cond = abs(self.odom_pose.pose.pose.position.x - waypoint.x_lat) < 1e-05
            y_cond = abs(self.odom_pose.pose.pose.position.y - waypoint.x_lat) < 1e-05
            z_cond = abs(self.odom_pose.pose.pose.position.z - waypoint.x_lat) < 1e-05
            if x_cond and y_cond and z_cond:
                wp = idx
                break
        self._current_wp = wp
        
    def publish_wp_cmd_pose(self,pub,waypoint):
        cmd_pose=PoseStamped()
        cmd_pose.pose.position.x=x
        cmd_pose.pose.position.y=y
        cmd_pose.pose.position.z=-0.5
        cmd_pose.pose.orientation.x=0
        cmd_pose.pose.orientation.y=0
        cmd_pose.pose.orientation.z=0
        cmd_pose.pose.orientation.w=1
        rospy.loginfo('PoseStamped published')
        pub.publish(cmd_pose)
        #rospy.spin()
        #rate.sleep()