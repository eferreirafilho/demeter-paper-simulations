#!/usr/bin/env python
from cmath import pi, sqrt
from random import randint
from turtle import position
import rospy
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped, Quaternion, Twist
from std_msgs.msg import Float32
from tf.transformations import quaternion_from_euler, quaternion_multiply, euler_from_quaternion
from build_roadmaps import BuildRoadmaps

class DemeterActionInterface(object):

    OUT_OF_DURATION = -1
    OUT_OF_DURATION_FACTOR = 1.2
    ACTION_SUCCESS = 1
    ACTION_FAIL = 0
    EPS_DISTANCE = 0.2 # Distance we consider that vehicle is at a waypoint
    SUBMERGED_Z = 0.4 # Z Distance we consider that vehicle is on surface
    SUBMERGED_Z_CMD = 0.2 # Z Distance we send vehicle to surface
    EPS_ANGLE = 1 # Distance (degrees) we consider that a desired angle is achieved

    def __init__(self, namespace, update_frequency=10.):
        """
        A Class that interfaces ROSPlan and Demeter Vehicle for executing actions
        """
        rospy.logwarn(namespace)
        self.namespace=namespace
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
        self.waypoints_position = self.build_graph_get_waypoints()
        
        # Subscribers
        rospy.loginfo('Connecting ROS and Vehicle ...')
        # rospy.Subscriber('/mavros/local_position/odom', Odometry, self._pose_gt_cb, queue_size=10)#REAL ROBOT
        rospy.Subscriber(str(self.namespace)+'pose_gt', Odometry, self._pose_gt_cb, queue_size=10)
        # Publisher
        # self.cmd_pose_pub=rospy.Publisher('/mavros/adsetpoint/send',PoseStamped, queue_size=10) #REAL ROBOT
        self.cmd_pose_pub=rospy.Publisher(str(self.namespace)+'cmd_pose',PoseStamped, queue_size=10)
        
        init_position = self.get_position()
        self.set_init_position_param(init_position)

        self._wait(2) 
            
    def _wait(self, n_rate):
        for _ in range(n_rate):
            self._rate.sleep()
        
    def _pose_gt_cb(self, msg):
        self.odom_pose = msg

    def load_wp_config_from_file(self):
        waypoints = [rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/plan_wp_x"), rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/plan_wp_y"),rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/plan_wp_z")]
        return waypoints

    def load_origin_from_file(self):
        origin = [rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/origin_x"), rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/origin_y"),rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/origin_z")]
        return origin
    
    # def load_poi(self):
    #     scaled_poi_x = rospy.get_param("/build_roadmaps/scaled_poi_x")
    #     scaled_poi_y = rospy.get_param("/build_roadmaps/scaled_poi_y")
    #     self.Z_POI_DISTANCE = 0.5
    #     poi_coordinates = [scaled_poi_x, scaled_poi_y, [self.Z_POI_DISTANCE]*len(scaled_poi_y)]
    #     return poi_coordinates
    
    def build_graph_get_waypoints(self):
        Roadmap = BuildRoadmaps()
        Roadmap.build_and_scale_roadmap()
        waypoints_aux = Roadmap.get_poi_from_graph()
        # Z_POI_DISTANCE = -0.5
        # waypoints_aux.append([Z_POI_DISTANCE]*len(waypoints_aux[0]))
        return waypoints_aux
    
    def append_to_waypoint_position(self,position):
        # self.waypoints_position=self.load_wp_config_from_file()
        self.waypoints_position[0].append(float(round(position[0])))
        self.waypoints_position[1].append(float(round(position[1])))
        self.waypoints_position[2].append(float(round(position[2])))

    def closer_wp(self, position):
        dist = float('inf')
        closer_wp = None
        # rospy.logwarn('self.waypoints_positions')
        # rospy.logwarn(len(self.waypoints_position))
        # rospy.logwarn(type(self.waypoints_position))
        # rospy.logwarn(self.waypoints_position)
        
        # rospy.logwarn('position')
        # rospy.logwarn(position)
        # rospy.logwarn(type(position))
        
        for i in range(len(self.waypoints_position[0])): # Don't compare with itself
            dist_aux=sqrt((position[0] - self.waypoints_position[0][i])**2+(position[1] - self.waypoints_position[1][i])**2+(position[2] - self.waypoints_position[2][i])**2)
            if dist_aux.real<dist:
                dist=dist_aux.real
                closer_wp=i
        return closer_wp

    def do_move(self, waypoint, duration=rospy.Duration()):
        self.wp_reached = -1
        start = rospy.Time.now()
        rospy.logwarn('Moving to waypoint ' + str(waypoint))
        
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
        return response
    
    def do_get_data(self, data_location, duration=rospy.Duration()):
        rospy.logdebug('Interface: \'Get Data\' Action')
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
        rospy.logwarn('Setting target waypoint to: ' + str(wp_set))
        self.target_wp=wp_set

    def set_init_position_param(self, position):
        rospy.set_param(str(self.namespace)+'planning/initial_position', [position.x, position.y, position.z])       

    def get_init_position_param(self):
        self.init_position = rospy.get_param(str(self.namespace)+'planning/initial_position')       

    def update_wp_position(self,waypoint):
        wp = -1
        dist_x = sqrt((self.odom_pose.pose.pose.position.x - self.target_wp[0])**2)
        dist_y = sqrt((self.odom_pose.pose.pose.position.y - self.target_wp[1])**2)
        dist_z = sqrt((self.odom_pose.pose.pose.position.z - self.target_wp[2])**2)
        dist = (dist_x.real + dist_y.real + dist_z.real)
        if dist_x.real<self.EPS_DISTANCE and dist_y.real<self.EPS_DISTANCE and dist_z.real<self.EPS_DISTANCE:
            wp = waypoint          
        self._current_wp = wp
        rospy.loginfo_throttle(2,'Distance to target X: ' + str((dist_x.real,5)))
        rospy.loginfo_throttle(2,'Distance to target Y: ' + str((dist_y.real,5)))
        rospy.loginfo_throttle(2,'Distance to target Z: ' + str((dist_z.real,5)))
        rospy.loginfo_throttle(2,'self.target[0]: ' + str(self.target_wp[0]))
        rospy.loginfo_throttle(2,'self.target[1]: ' + str(self.target_wp[1]))
        rospy.loginfo_throttle(2,'self.target[2]: ' + str(self.target_wp[2]))
        rospy.loginfo_throttle(2,'Distance to target: ' + str((dist.real,5)))
        
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

    def goto_origin(self):
        origin = self.load_origin_from_file()
        position.x=float(origin[0])
        position.y=float(origin[1])
        position.z=float(origin[2])
        self.publish_position_fixed_orientation(position)
        return

    def orientation_comparison(self,q1,q2):
        q1_inv=q1
        q1_inv.w=-q1_inv.w
        qr = quaternion_multiply([q2.x,q2.y,q2.z,q2.w],[q1_inv.x,q1_inv.y,q1_inv.z,q1_inv.w])
        return qr

    def rotate_vehicle(self, rotate_angle, rotate_axis):
        orientation_q = self.get_orientation()
        orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        (current_roll, current_pitch, current_yaw) = euler_from_quaternion (orientation_list)
        if rotate_axis == 'roll': desired_orientation_list = quaternion_from_euler(current_roll + rotate_angle, current_pitch, current_yaw)
        if rotate_axis == 'pitch': desired_orientation_list = quaternion_from_euler(current_roll, current_pitch + rotate_angle, current_yaw)
        if rotate_axis == 'yaw': desired_orientation_list = quaternion_from_euler(current_roll, current_pitch, current_yaw + rotate_angle)
        (desired_roll, desired_pitch, desired_yaw) = euler_from_quaternion (desired_orientation_list)
        desired_orientation_q = Quaternion()
        desired_orientation_q.x, desired_orientation_q.y, desired_orientation_q.z, desired_orientation_q.w = desired_orientation_list[0], desired_orientation_list[1], desired_orientation_list[2], desired_orientation_list[3]  
        position_q = self.get_position() 
        self.publish_cmd_pose(position_q, desired_orientation_q)
        if rotate_axis == 'roll': 
            while abs(self.smallest_angular_distance(current_roll*(180/pi), desired_roll*(180/pi)))>self.EPS_ANGLE:
                orientation_q = self.get_orientation()
                orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
                (current_roll, current_pitch, current_yaw) = euler_from_quaternion (orientation_list)
            return True
        elif rotate_axis == 'pitch': 
            while abs(self.smallest_angular_distance(current_pitch*(180/pi), desired_pitch*(180/pi)))>self.EPS_ANGLE:
                orientation_q = self.get_orientation()
                orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
                (current_roll, current_pitch, current_yaw) = euler_from_quaternion (orientation_list)
            return True
        elif rotate_axis == 'yaw': 
            while abs(self.smallest_angular_distance(current_yaw*(180/pi), desired_yaw*(180/pi)))>self.EPS_ANGLE:
                orientation_q = self.get_orientation()
                orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
                (current_roll, current_pitch, current_yaw) = euler_from_quaternion (orientation_list)
            return True

    def smallest_angular_distance(self, targetA, sourceA):
        a = targetA - sourceA
        a = (a + 180) % 360 - 180
        return a

    def rotate_in_place(self):
        #30 degrees to each side
        self.rotate_vehicle(pi/6,'yaw')
        self.rotate_vehicle(-pi/6,'yaw')
        self.rotate_vehicle(-pi/6,'yaw')
        self.rotate_vehicle(pi/6,'yaw')
        # 360 degrees rotation:
        # for i in range(4):
        #     self.rotate_vehicle(pi/2,'yaw')

    def command_halt_vehicle(self):
        position=self.get_position()
        orientation=self.get_orientation()
        rospy.loginfo('Vehicle Halted! Position: ' + str(position))
        self.publish_cmd_pose(position,orientation)