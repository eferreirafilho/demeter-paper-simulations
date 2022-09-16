#!/usr/bin/env python
from cmath import sqrt
import rospy
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped
import yaml

class DemeterActionInterface(object):

    OUT_OF_DURATION = -1
    OUT_OF_DURATION_FACTOR = 1.2
    ACTION_SUCCESS = 1
    ACTION_FAIL = 0
    EPS_DISTANCE = 1e-01 # Distance we consider that vehicle is at a waypoint
    SUBMERGED_Z = -0.5 # Z Distance we consider that vehicle is on surface
    SUBMERGED_Z_CMD = -0.4 # Z Distance we send vehicle to surface

    def __init__(self, update_frequency=10.):
        """
        A Class that interfaces ROSPlan and Demeter Vehicle for executing actions
        """
        self.wp_reached = -1
        self.init_position = []
        self.waypoints_position = ['']
        self.previous_mode = ''
        self.current_mode = ''
        self.external_intervened = False
        self.waypoints = list()
        self._current_wp = -1
        self.target_wp = -1
        self.odom_pose = Odometry()
        self._rate = rospy.Rate(update_frequency)

        # Subscribers
        rospy.loginfo('Connecting ROS and Vehicle ...')
        rospy.Subscriber('/auv/pose_gt/', Odometry, self._pose_gt_cb, queue_size=10)
        # Publisher
        self.cmd_pose_pub=rospy.Publisher('/auv/cmd_pose/',PoseStamped, queue_size=10)

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
    
    def load_wp_config_from_file(self):
        """
        Load waypoints configuration from file under params folder
        """
        waypoints = [rospy.get_param("/rosplan_demeter_exec/plan_wp_x"), rospy.get_param("/rosplan_demeter_exec/plan_wp_y"),rospy.get_param("/rosplan_demeter_exec/plan_wp_z")]
        return waypoints

    def append_to_plan_wp(self,position):
        """
        Append waypoint to plan_wp parameter
        """
        self.waypoints_position=self.load_wp_config_from_file()
        self.waypoints_position[0].append(int(round(position.x)))
        self.waypoints_position[1].append(int(round(position.y)))
        self.waypoints_position[2].append(int(round(position.z)))
        rospy.set_param('plan_wp_x', self.waypoints_position[0])
        rospy.set_param('plan_wp_y', self.waypoints_position[1])
        rospy.set_param('plan_wp_z', self.waypoints_position[2])

    def append_to_waypoint_position(self,position):
        """
        Append waypoint to waypoint position variable
        """
        self.waypoints_position=self.load_wp_config_from_file()
        self.waypoints_position[0].append(int(round(position[0])))
        self.waypoints_position[1].append(int(round(position[1])))
        self.waypoints_position[2].append(int(round(position[2])))

    def closer_wp(self,position):
        """
        Closer waypoint
        """
        # waypoints=self.load_wp_config_from_file()
        dist=[]
        closer_wp=[]
        for i in range(len(self.waypoints_position[0])-1): # Don't compare with itself
            dist_aux=sqrt((position.x - self.waypoints_position[0][i])**2+(position.y - self.waypoints_position[1][i])**2+(position.z - self.waypoints_position[2][i])**2)
            if dist_aux.real<dist:
                dist=dist_aux.real
                closer_wp=i

        return closer_wp

    def do_move(self, waypoint, duration=rospy.Duration()):
        """
        Go to specific waypoint action
        """
        self.wp_reached = -1
        start = rospy.Time.now()
        self.set_current_target_wp(waypoint) # Set current waypoint to internal variable
              
        while (rospy.Time.now() - start < duration) and not (rospy.is_shutdown()) and ((waypoint != self.wp_reached)):
            self.publish_wp_cmd_pose(waypoint)
            self.update_wp_position(waypoint)
            if self._current_wp==waypoint: # Query if vehicle is at target WP
                self.wp_reached=waypoint # SUCCESS
                rospy.loginfo('Waypoint ' + str(waypoint) + ' reached!')
            self._rate.sleep()
            rospy.loginfo_throttle(5,'Moving ... ' )

        response = int(waypoint == self.wp_reached)
                
        if (rospy.Time.now() - start) > duration:
            response = self.OUT_OF_DURATION
 
        return response
    
    def do_get_data(self, duration=rospy.Duration()):
        """
        Get data action
        """
        rospy.logdebug('Interface: Mock \'Get Data\' Action')
        start = rospy.Time.now()
        while (rospy.Time.now() - start < duration) and not (rospy.is_shutdown()):
            self._rate.sleep()
            completion_percentage = 'Getting data: ' + "{0:.0%}".format(((rospy.Time.now() - start)/duration))
            rospy.loginfo_throttle(1,completion_percentage)
            
        response = self.ACTION_SUCCESS #MOCK SUCCESS     
        rospy.loginfo('Data acquired!')
        
        if (rospy.Time.now() - start) > self.OUT_OF_DURATION_FACTOR*duration:
            response = self.OUT_OF_DURATION        
        
        return response
    
    def do_transmit_data(self, duration=rospy.Duration()):
        """
        Go to specific waypoint action
        """
        rospy.logdebug('Interface: Mock \'Transmit\' Action')
        start = rospy.Time.now()
        while (rospy.Time.now() - start < duration) and not (rospy.is_shutdown()):
            self._rate.sleep()
            completion_percentage = 'Transmitting data: ' + "{0:.0%}".format(((rospy.Time.now() - start)/duration))
            rospy.loginfo_throttle(1,completion_percentage)
            
        response = self.ACTION_SUCCESS #MOCK SUCCESS     
        rospy.loginfo('Data transmitted!')
        if (rospy.Time.now() - start) > self.OUT_OF_DURATION_FACTOR*duration:
            response = self.OUT_OF_DURATION        
        
        return response
        
    def set_current_target_wp(self, wp_index):
        """
        Set target wp for vehicle to go
        """      
        self.get_init_position_param()
        self.append_to_waypoint_position(self.init_position)

        wp_set=[item[wp_index] for item in self.waypoints_position] # Get specified waypoint
        self.target_wp=wp_set

        rospy.loginfo('Target waypoint set to self.target_wp')

    def set_init_position_param(self, position):
        """
        Set the initial position to param
        """      
        rospy.set_param('planning_initial_position', [position.x, position.y, position.z])       
        rospy.loginfo('Initial position set to param file')

    def get_init_position_param(self):
        """
        Get the initial position param
        """      
        self.init_position = rospy.get_param('planning_initial_position')       

    def update_wp_position(self,waypoint):
        """
        Update vehicle position in terms of waypoint
        """
        wp = -1
        if not self.is_submerged():
            wp = 0 # Waypoint 0 is all the surface minus wp1
        dist=sqrt((self.odom_pose.pose.pose.position.x - self.target_wp[0])**2+(self.odom_pose.pose.pose.position.y - self.target_wp[1])**2+(self.odom_pose.pose.pose.position.z - self.target_wp[2])**2)
        if dist.real < self.EPS_DISTANCE:
            wp = waypoint          
        self._current_wp = wp
        # rospy.logwarn_throttle(3,'WP: ' + str(wp))                
        rospy.loginfo_once('Distance to target WP: ' + str(dist.real))
        
    def publish_wp_cmd_pose(self,waypoint):
        """
        Publish target position and fixed orientation to cmd_pose
        """
        cmd_pose=PoseStamped()      
        cmd_pose.pose.position.x=self.target_wp[0]
        cmd_pose.pose.position.y=self.target_wp[1]
        cmd_pose.pose.position.z=self.target_wp[2]
        cmd_pose.pose.orientation.x=0
        cmd_pose.pose.orientation.y=0
        cmd_pose.pose.orientation.z=0
        cmd_pose.pose.orientation.w=1
        self.cmd_pose_pub.publish(cmd_pose)
        
    def publish_cmd_pose(self,pos):
        """
        Publish target position and fixed orientation to cmd_pose
        """
        cmd_pose=PoseStamped()      
        cmd_pose.pose.position.x=pos.x
        cmd_pose.pose.position.y=pos.y
        cmd_pose.pose.position.z=pos.z
        cmd_pose.pose.orientation.x=0
        cmd_pose.pose.orientation.y=0
        cmd_pose.pose.orientation.z=0
        cmd_pose.pose.orientation.w=1
        self.cmd_pose_pub.publish(cmd_pose)
    
    def get_position(self):
        """
        Get position of vehicle
        """
        return self.odom_pose.pose.pose.position
    
    def is_submerged(self):
        """
        Check if vehicle is on surface or submerged
        """
        position=self.get_position()
        if position.z<self.SUBMERGED_Z:
            return True
        else:
            return False
        
    def goto_surface(self):
        """
        Send vehicle to surface
        """
        position=self.get_position()
        position.z=self.SUBMERGED_Z_CMD # Submerge while in the same X and Y
        self.publish_cmd_pose(position)
        