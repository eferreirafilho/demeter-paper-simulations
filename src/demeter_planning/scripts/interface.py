#!/usr/bin/env python
from cmath import pi, sqrt
from turtle import position
import rospy
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped, Quaternion, Twist
from std_msgs.msg import Float32
from tf.transformations import quaternion_from_euler, quaternion_multiply

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
        self.localization_error_log=[]
        self.FILTER_FACTOR = 50 # Filter takes the mean of last FILTER_FACTOR element
        self.LOCALIZATION_THREDSHOLD = 5 # Localization error is too big
        self.verify_localization_errors = []
        self.localized = []
        self._rate = rospy.Rate(update_frequency)

        # Subscribers
        rospy.loginfo('Connecting ROS and Vehicle ...')
        rospy.Subscriber('/auv/pose_gt/', Odometry, self._pose_gt_cb, queue_size=10)
        rospy.Subscriber('/planning/mock_localization_error/', Float32, self._localization_callback, queue_size=10)
        # Publisher
        self.cmd_pose_pub=rospy.Publisher('/auv/cmd_pose/',PoseStamped, queue_size=10)
        self.cmd_vel_pub=rospy.Publisher('/auv/cmd_vel/',Twist, queue_size=10)

        self._wait(2) 
            
    def _wait(self, n_rate):
        for _ in range(n_rate):
            self._rate.sleep()
        
    def _pose_gt_cb(self, msg):
        self.odom_pose = msg

    def _localization_callback(self,msg):
        self.localization_error_log.append(msg.data)

    def filter_localization_error(self):
        try:
            if(len(self.localization_error_log))<self.FILTER_FACTOR:
                return sum(self.localization_error_log) / len(self.localization_error_log)
            else:
                return sum(self.localization_error_log[-self.FILTER_FACTOR:]) / len(self.localization_error_log[-self.FILTER_FACTOR:])
        except:
            rospy.loginfo('Cannot get localization error')

    def localization_error_too_big(self):
        if(self.filter_localization_error())>self.LOCALIZATION_THREDSHOLD and self.verify_localization_errors:
            rospy.logwarn('Localization error too big')
            self.localized = False
            return True
        else:
            self.localized = True
            return False
    
    def interface_verify_localization_errors_on(self):
        self.verify_localization_errors=True
        print('do not check true')

    def interface_verify_localization_errors_off(self):
        self.verify_localization_errors=False
        print('do not check false')

    def load_wp_config_from_file(self):
        waypoints = [rospy.get_param("/rosplan_demeter_exec/plan_wp_x"), rospy.get_param("/rosplan_demeter_exec/plan_wp_y"),rospy.get_param("/rosplan_demeter_exec/plan_wp_z")]
        return waypoints

    def append_to_plan_wp(self,position):
        self.waypoints_position=self.load_wp_config_from_file()
        self.waypoints_position[0].append(int(round(position.x)))
        self.waypoints_position[1].append(int(round(position.y)))
        self.waypoints_position[2].append(int(round(position.z)))
        rospy.set_param('/rosplan_demeter_exec/extended_plan_wp_x', self.waypoints_position[0])
        rospy.set_param('/rosplan_demeter_exec/extended_plan_wp_x', self.waypoints_position[1])
        rospy.set_param('/rosplan_demeter_exec/extended_plan_wp_x', self.waypoints_position[2])

    def append_to_waypoint_position(self,position):
        self.waypoints_position=self.load_wp_config_from_file()
        self.waypoints_position[0].append(int(round(position[0])))
        self.waypoints_position[1].append(int(round(position[1])))
        self.waypoints_position[2].append(int(round(position[2])))

    def closer_wp(self,position):
        dist=[]
        closer_wp=[]
        for i in range(len(self.waypoints_position[0])-1): # Don't compare with itself
            dist_aux=sqrt((position.x - self.waypoints_position[0][i])**2+(position.y - self.waypoints_position[1][i])**2+(position.z - self.waypoints_position[2][i])**2)
            if dist_aux.real<dist:
                dist=dist_aux.real
                closer_wp=i
        return closer_wp

    def do_move(self, waypoint, duration=rospy.Duration()):
        self.wp_reached = -1
        start = rospy.Time.now()
        self.set_current_target_wp(waypoint) # Set current waypoint to internal variable
        while (rospy.Time.now() - start < duration) and not (rospy.is_shutdown()) and ((waypoint != self.wp_reached)):
            self.publish_wp_cmd_pose_fixed_orientation(waypoint)
            self.update_wp_position(waypoint)
            if self._current_wp==waypoint: # Query if vehicle is at target WP
                self.wp_reached=waypoint # SUCCESS
                rospy.loginfo('Waypoint ' + str(waypoint) + ' reached!')
            self._rate.sleep()
        response = int(waypoint == self.wp_reached)
        if (rospy.Time.now() - start) > duration:
            response = self.OUT_OF_DURATION
        elif self.localization_error_too_big():
            response = self.ACTION_FAIL
        return response
    
    def do_get_data(self, duration=rospy.Duration()):
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
        self.get_init_position_param()
        self.append_to_waypoint_position(self.init_position)
        wp_set=[item[wp_index] for item in self.waypoints_position] # Get specified waypoint
        self.target_wp=wp_set

    def set_init_position_param(self, position):
        rospy.set_param('/planning/initial_position', [position.x, position.y, position.z])       

    def get_init_position_param(self):
        self.init_position = rospy.get_param('/planning/initial_position')       

    def update_wp_position(self,waypoint):
        wp = -1
        if not self.is_submerged():
            wp = 0 # Waypoint 0 is at the surface
        dist=sqrt((self.odom_pose.pose.pose.position.x - self.target_wp[0])**2+(self.odom_pose.pose.pose.position.y - self.target_wp[1])**2+(self.odom_pose.pose.pose.position.z - self.target_wp[2])**2)
        if dist.real < self.EPS_DISTANCE:
            wp = waypoint          
        self._current_wp = wp
        rospy.loginfo_throttle(2,'Distance to target WP: ' + str(round(dist.real,3)))
        
    def publish_wp_cmd_pose_fixed_orientation(self,waypoint): 
        cmd_pose=PoseStamped()      
        cmd_pose.pose.position.x=self.target_wp[0]
        cmd_pose.pose.position.y=self.target_wp[1]
        cmd_pose.pose.position.z=self.target_wp[2]
        cmd_pose.pose.orientation.x=0
        cmd_pose.pose.orientation.y=0
        cmd_pose.pose.orientation.z=0
        cmd_pose.pose.orientation.w=1
        self.cmd_pose_pub.publish(cmd_pose)
        
    def publish_position_fixed_orientation(self,pos):
        cmd_pose=PoseStamped()      
        cmd_pose.pose.position.x=pos.x
        cmd_pose.pose.position.y=pos.y
        cmd_pose.pose.position.z=pos.z
        cmd_pose.pose.orientation.x=0
        cmd_pose.pose.orientation.y=0
        cmd_pose.pose.orientation.z=0
        cmd_pose.pose.orientation.w=1
        self.cmd_pose_pub.publish(cmd_pose)

    def publish_cmd_pose(self,pos,ori):

        cmd_pose=PoseStamped()      
        cmd_pose.pose.position.x=pos.x
        cmd_pose.pose.position.y=pos.y
        cmd_pose.pose.position.z=pos.z
        cmd_pose.pose.orientation.x=ori.x
        cmd_pose.pose.orientation.y=ori.y
        cmd_pose.pose.orientation.z=ori.z
        cmd_pose.pose.orientation.w=ori.w
        self.cmd_pose_pub.publish(cmd_pose)
    
    def get_position(self):
        return self.odom_pose.pose.pose.position

    def get_orientation(self):
        return self.odom_pose.pose.pose.orientation
    
    def get_linear_velocity(self):
        return self.odom_pose.pose.pose.position

    def is_submerged(self):
        position=self.get_position()
        if position.z<self.SUBMERGED_Z:
            return True
        else:
            return False
        
    def goto_surface(self):
        position=self.get_position()
        position.z=self.SUBMERGED_Z_CMD # Submerge while in the same X and Y
        self.publish_position_fixed_orientation(position)

    def rotate_yaw(self,degrees):
        # TODO while with: http://wiki.ros.org/tf2/Tutorials/Quaternions#Relative_rotations

            # self.publish_cmd_pose(position, orientation)
            orientation=self.get_orientation()
            self._rate.sleep()
            
    def rotate_in_place(self):
        # TODO  rotate 
        print('30')
        self.rotate_yaw(30)

    def command_halt_vehicle(self):
        position=self.get_position()
        orientation=self.get_orientation()
        rospy.loginfo('Vehicle Halted! Position: ' + str(position))
        self.publish_cmd_pose(position,orientation)