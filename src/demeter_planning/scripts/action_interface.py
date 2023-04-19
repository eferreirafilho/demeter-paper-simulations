#!/usr/bin/env python
from cmath import pi, sqrt
from random import randint
from turtle import position
import rospy
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped, Quaternion, Twist, Point
from std_msgs.msg import Float32
from tf.transformations import quaternion_from_euler, quaternion_multiply, euler_from_quaternion
from build_roadmaps import BuildRoadmaps

class DemeterActionInterface(object):

    OUT_OF_DURATION = -1
    OUT_OF_DURATION_FACTOR = 1.2
    ACTION_SUCCESS = 1
    ACTION_FAIL = 0
    EPS_DISTANCE = 0.2 # Distance we consider that vehicle is at a waypoint
    SUBMERGED_Z = -1.5 # Z Distance we consider that vehicle is on surface
    SUBMERGED_Z_CMD = -1 # Z Distance we send vehicle to surface
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
        wp_array = rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/waypoints")
        X = [wp[0] for wp in wp_array]
        Y = [wp[1] for wp in wp_array]
        Z = [wp[2] for wp in wp_array]
        self.waypoints_position = [X, Y, Z] 
        # Subscribers
        rospy.loginfo('Connecting ROS and Vehicle ...')
        # rospy.Subscriber('/mavros/local_position/odom', Odometry, self._pose_gt_cb, queue_size=10) # REAL ROBOT
        rospy.Subscriber(str(self.namespace)+'pose_gt', Odometry, self._pose_gt_cb, queue_size=10)
        # Publisher
        # self.cmd_pose_pub=rospy.Publisher('/mavros/adsetpoint/send',PoseStamped, queue_size=10) # REAL ROBOT
        self.cmd_pose_pub=rospy.Publisher(str(self.namespace)+'cmd_pose',PoseStamped, queue_size=10)
        init_position = self.get_position()
        self.set_init_position_param(init_position)
        self._wait(2) 
            
    def _wait(self, n_rate):
        for _ in range(n_rate):
            self._rate.sleep()
        
    def _pose_gt_cb(self, msg):
        self.odom_pose = msg

    def load_submerge_wp_from_param(self):
        waypoints = [rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/plan_wp_x"), rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/plan_wp_y"),rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/plan_wp_z")]
        return waypoints

    def load_origin_from_file(self):
        origin = [rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/origin_x"), rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/origin_y"),rospy.get_param(str(self.namespace)+"rosplan_demeter_exec/origin_z")]
        return origin
    
    def append_to_waypoint_position(self, pos):      
        self.waypoints_position[0].append(float(round(pos[0])))
        self.waypoints_position[1].append(float(round(pos[1])))
        self.waypoints_position[2].append(float(round(pos[2])))

    def closer_wp(self, pos):
        dist = float('inf')
        closer_wp = None
        for i in range(len(self.waypoints_position[0])): # Don't compare with itself
            dist_aux=sqrt((pos[0] - self.waypoints_position[0][i])**2+(pos[1] - self.waypoints_position[1][i])**2+(pos[2] - self.waypoints_position[2][i])**2)
            if dist_aux.real<dist:
                dist=dist_aux.real
                closer_wp=i
        return closer_wp

    # Actions
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
    
    def do_inspect_turbine(self, turbine, duration=rospy.Duration()):
        rospy.logdebug('Interface: \'Inspect Turbine\' Action')
        response = self.ACTION_FAIL
        start = rospy.Time.now()
        start_pos = self.odom_pose.pose.pose.position
        turbine_pos = self.get_turbine_start_position(int(turbine))
        submerge_wp = self.load_submerge_wp_from_param()
        # Offset the waypoints with the turbine position in a single pass.
        submerge_wp = [[x + turbine_pos[0], y + turbine_pos[1], z] for x, y, z in zip(submerge_wp[0], submerge_wp[1], submerge_wp[2])]
        pos = Point()
        while (rospy.Time.now() - start < duration) and not (rospy.is_shutdown()) and not (response == self.ACTION_SUCCESS):
            self._rate.sleep()
            for wp_x, wp_y, wp_z in submerge_wp:
                pos.x, pos.y, pos.z = wp_x, wp_y, wp_z
                while self.squared_distance(self.odom_pose.pose.pose.position, pos) > self.EPS_DISTANCE**2:
                    self.publish_position_fixed_orientation(pos)
                    completion_percentage = 'Inspecting turbine: ' + "{0:.0%}".format(((rospy.Time.now() - start)/duration))
                    rospy.loginfo_throttle(1,completion_percentage)
            
            while self.squared_distance(self.odom_pose.pose.pose.position, start_pos) > self.EPS_DISTANCE**2:
                self.publish_position_fixed_orientation(start_pos)
                completion_percentage = 'Returning to submerge point: ' + "{0:.0%}".format(((rospy.Time.now() - start)/duration))
                rospy.loginfo_throttle(1,completion_percentage)
                response = self.ACTION_SUCCESS     
            rospy.loginfo('Data acquired!')
                
        if (rospy.Time.now() - start) > self.OUT_OF_DURATION_FACTOR*duration:
            response = self.OUT_OF_DURATION        
        return response
    
    def do_upload_data_histograms(self, duration=rospy.Duration()):
        rospy.logdebug('Interface: Mock \'Upload Data Histograms\' Action')
        start = rospy.Time.now()
        while (rospy.Time.now() - start < duration) and not (rospy.is_shutdown()):
            self._rate.sleep()
            completion_percentage = 'Uploading Data Histograms: ' + "{0:.0%}".format(((rospy.Time.now() - start)/duration))
            rospy.loginfo_throttle(1,completion_percentage)
        response = self.ACTION_SUCCESS #MOCK SUCCESS     
        rospy.loginfo('Histograms uploaded!')
        if (rospy.Time.now() - start) > self.OUT_OF_DURATION_FACTOR*duration:
            response = self.OUT_OF_DURATION        
        return response
    
    def do_surface(self, duration=rospy.Duration()):
        rospy.logdebug('Interface: \'Surface\' Action')
        start = rospy.Time.now()
        while (rospy.Time.now() - start < duration) and not (rospy.is_shutdown()) and self.odom_pose.pose.pose.position.z < self.SUBMERGED_Z:
            self.surface_if_submerged()   
            completion_percentage = 'Surfacing: ' + "{0:.0%}".format(((rospy.Time.now() - start)/duration))
            rospy.loginfo_throttle(1,completion_percentage)
            self._rate.sleep()
        response = self.ACTION_SUCCESS #MOCK SUCCESS     
        rospy.loginfo('Surfaced!')
        if (rospy.Time.now() - start) > self.OUT_OF_DURATION_FACTOR*duration:
            response = self.OUT_OF_DURATION        
        return response
    
    def do_harvest_energy(self, duration=rospy.Duration()):
        rospy.logdebug('Interface: Mock \'harvest-energy (recharging) \' Action') # Actual action is handled in BatteryController class
        start = rospy.Time.now()
        while (rospy.Time.now() - start < duration) and not (rospy.is_shutdown()):
                self._rate.sleep()
                completion_percentage = 'Harvesting energy (recharging) ' + "{0:.0%}".format(((rospy.Time.now() - start)/duration))
                rospy.loginfo_throttle(1,completion_percentage)
        response = self.ACTION_SUCCESS     
        rospy.loginfo('Recharged!')
        if (rospy.Time.now() - start) > self.OUT_OF_DURATION_FACTOR*duration:
            response = self.OUT_OF_DURATION        
        return response
    
    def squared_distance(self, p1, p2):
        return (p1.x - p2.x)**2 + (p1.y - p2.y)**2 + (p1.z - p2.z)**2
    
    def do_localize_cable(self, turbine, duration=rospy.Duration()):
        rospy.logdebug('Interface: Mock \'Localize\' Action')
        start = rospy.Time.now()
        turbine_pos = self.get_turbine_start_position(int(turbine))
        # Mock action: Go to the countor point more to the right (to avoid collision with the pole)        
        DELTA_X = 5
        DELTA_Z = -10
        pos = Point()
        pos.x=float(turbine_pos[0] + DELTA_X)
        pos.y=float(turbine_pos[1])
        pos.z=float(DELTA_Z)
        while (rospy.Time.now() - start < duration) and not (rospy.is_shutdown()):
            self.publish_position_fixed_orientation(pos)
            self._rate.sleep()
            completion_percentage = 'Localizing ' + "{0:.0%}".format(((rospy.Time.now() - start)/duration))
            rospy.loginfo_throttle(1,completion_percentage)
        response = self.ACTION_SUCCESS     
        rospy.loginfo('Localizing!')
        if (rospy.Time.now() - start) > self.OUT_OF_DURATION_FACTOR*duration:
            response = self.OUT_OF_DURATION        
        return response
    
    def get_turbine_start_position(self, turbine):
        param = rospy.get_param(str(self.namespace) + 'rosplan_demeter_exec/scaled_turbines_xy')
        turbine_pos = param[turbine]
        return turbine_pos
    
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

    def update_wp_position(self, waypoint):
        wp = -1
        dist_x = sqrt((self.odom_pose.pose.pose.position.x - self.target_wp[0])**2)
        dist_y = sqrt((self.odom_pose.pose.pose.position.y - self.target_wp[1])**2)
        dist_z = sqrt((self.odom_pose.pose.pose.position.z - self.target_wp[2])**2)
        dist = (dist_x.real + dist_y.real + dist_z.real)
        if dist_x.real<self.EPS_DISTANCE and dist_y.real<self.EPS_DISTANCE and dist_z.real<self.EPS_DISTANCE:
            wp = waypoint          
        self._current_wp = wp
        rospy.loginfo_throttle(5,'Distance to target: ' + str((dist.real,5)))
        
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
        rospy.logwarn(self.odom_pose.pose.pose.position)
        return self.odom_pose.pose.pose.position

    def get_orientation(self):
        return self.odom_pose.pose.pose.orientation
    
    def get_linear_velocity(self):
        return self.odom_pose.pose.pose.position

    def is_submerged(self):
        # current_pos=self.get_position()
        rospy.logwarn('Position z' + str(self.odom_pose.pose.pose.position.z))
        rospy.logwarn('SUBMERGED Z' + str(self.SUBMERGED_Z))
        if float(self.odom_pose.pose.pose.position.z)<float(self.SUBMERGED_Z):
            rospy.logwarn(float(self.odom_pose.pose.pose.position.z))
            rospy.logwarn(float(self.SUBMERGED_Z))
            rospy.logwarn('submerged!!')
            return True
        else:
            rospy.logwarn('surfaced!!')
            return False
    
    def surface_if_submerged(self):
        rospy.loginfo('Surfacing...')
        pos = Point()
        pos.x = self.odom_pose.pose.pose.position.x
        pos.y = self.odom_pose.pose.pose.position.y
        pos.z = self.SUBMERGED_Z
        self.publish_position_fixed_orientation(pos)
        self._wait(2) 
        
    def goto_surface(self):
        pos = Point()
        pos = self.odom_pose.pose.pose.position
        pos.z=self.SUBMERGED_Z_CMD # Submerge while in the same X and Y
        self.publish_position_fixed_orientation(pos)

    def goto_origin(self):
        origin = self.load_origin_from_file()
        pos = Point()
        pos.x=float(origin[0])
        pos.y=float(origin[1])
        pos.z=float(origin[2])
        self.publish_position_fixed_orientation(pos)
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

    def command_halt_vehicle(self):
        position=self.get_position()
        orientation=self.get_orientation()
        rospy.loginfo('Vehicle Halted! Position: ' + str(position))
        self.publish_cmd_pose(position,orientation)