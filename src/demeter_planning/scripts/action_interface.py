#!/usr/bin/env python
from cmath import pi, sqrt
from random import randint
from turtle import position
import rospy
from nav_msgs.msg import Odometry
from geometry_msgs.msg import PoseStamped, Quaternion, Twist
from std_msgs.msg import Float32
from tf.transformations import quaternion_from_euler, quaternion_multiply, euler_from_quaternion
from functools import partial
import numpy as np
import re

class DemeterActionInterface(object):

    OUT_OF_DURATION = -1
    OUT_OF_DURATION_FACTOR = 1.2
    ACTION_SUCCESS = 1
    ACTION_FAIL = 0
    EPS_DISTANCE = 0.2 # Distance we consider that vehicle is at a waypoint
    SUBMERGED_Z = 0.4 # Z Distance we consider that vehicle is on surface
    SUBMERGED_Z_CMD = 0.2 # Z Distance we send vehicle to surface
    EPS_ANGLE = 1 # Distance (degrees) we consider that a desired angle is achieved

    def __init__(self, auv_name, update_frequency=10.0):
        """
        A Class that interfaces ROSPlan and Demeter Vehicle for executing actions
        """
        self.init_position = []
        self.waypoints_position = ['']
        self.turbine_waypoints = []
        self.external_intervened = False
        self.waypoints = list()
        self.wp_reached = list()
        self._current_wp = list()
        self.target_wp = list()
        self.odom_pose = []
        self.cmd_pose_pub = []
        self.number_of_vehicles = len(rospy.get_param('/init_populate_KB/vehicle_idx')) # Number of vehicles
        self.number_of_data_sensors = len(rospy.get_param('/init_populate_KB/data_idx')) # Number of data sensors
        self.turbines_xy = [rospy.get_param('/init_populate_KB/turbines_x'), rospy.get_param('/init_populate_KB/turbines_y')] # Turbines position
        self.num_turbines = len(self.turbines_xy[0])
        for i in range(self.number_of_vehicles):
            self.odom_pose.append(Odometry())
            self._current_wp.append(-1)
            self.target_wp.append(-1)
            self.wp_reached.append(-1)

        self.base_waypoints = self.load_base_waypoints()
        self.populate_turbine_waypoints()
        self._rate = rospy.Rate(update_frequency)

        rospy.loginfo('Connecting ROS and Vehicle ...')
        for vehicle_index in range(self.number_of_vehicles):
            # Subscribers
            rospy.Subscriber('/auv'+str(vehicle_index)+'/pose_gt', Odometry, self._pose_gt_cb, vehicle_index, queue_size=10)
            # Publishers        
            pub = rospy.Publisher('/auv'+str(vehicle_index)+'/cmd_pose', PoseStamped, queue_size=10)
            self.cmd_pose_pub.append(pub)

        self._wait(1) 
            
    def _wait(self, n_rate):
        for _ in range(n_rate):
            self._rate.sleep()
        
    def _pose_gt_cb(self, msg, vehicle_index):
        self.odom_pose[vehicle_index] = msg

    def load_wp_config_from_file(self):
        waypoints = [rospy.get_param("/rosplan_demeter_exec/plan_wp_x"), rospy.get_param("/rosplan_demeter_exec/plan_wp_y"),rospy.get_param("/rosplan_demeter_exec/plan_wp_z")]
        return waypoints
    
    def load_base_waypoints(self):
        self.base_waypoints = [rospy.get_param("/rosplan_demeter_exec/plan_wp_x"), rospy.get_param("/rosplan_demeter_exec/plan_wp_y"),rospy.get_param("/rosplan_demeter_exec/plan_wp_z")]
        return self.base_waypoints

    def populate_turbine_waypoints(self):
        for turbine in range(self.num_turbines):
            turbine_x = self.turbines_xy[0][turbine]
            turbine_y = self.turbines_xy[1][turbine]
            self.turbine_waypoints.append([])
            for p in range(len(self.base_waypoints[0])):
                # turbine_waypoint contains the waypoints shifted for each turbine
                self.turbine_waypoints[turbine].append([turbine_x + self.base_waypoints[0][p], turbine_y + self.base_waypoints[1][p], self.base_waypoints[2][p]])
            
    def load_origin_from_file(self):
        origin = [rospy.get_param("/rosplan_demeter_exec/origin_x"), rospy.get_param("/rosplan_demeter_exec/origin_y"),rospy.get_param("/rosplan_demeter_exec/origin_z")]
        return origin

    def append_to_waypoint_position(self,position):
        self.waypoints_position=self.load_wp_config_from_file()
        self.waypoints_position[0].append(float(round(position[0])))
        self.waypoints_position[1].append(float(round(position[1])))
        self.waypoints_position[2].append(float(round(position[2])))

    def closer_wp(self, position):
        '''Returns the closest waypoint in the PDDL format'''
        closest_distance = 1e10
        closest_point = None
        closest_index = None
        for turbine, sublist in enumerate(self.turbine_waypoints):
            for point, coord in enumerate(sublist):
                distance = sqrt((position[0] - coord[0])**2 + (position[1] - coord[1])**2 + (position[2] - coord[2])**2)
                if distance.real < closest_distance.real:
                    closest_distance = distance
                    closest_point = coord
                    closest_index = (turbine,point)
        return str('wp_turbine'+str(closest_index[0])+'_point'+str(closest_index[1]))

    def do_move(self, vehicle_index, waypoint, duration=rospy.Duration()):
        vehicle_index_int = int(vehicle_index[3]) 
        self.wp_reached[vehicle_index_int] = -1
        start = rospy.Time.now()
        self.set_current_target_wp(waypoint, vehicle_index_int) # Set current waypoint to internal variable
        while (rospy.Time.now() - start < duration) and not (rospy.is_shutdown()) and ((waypoint != self.wp_reached[vehicle_index_int])):
            self.publish_wp_cmd_pose_fixed_orientation(vehicle_index_int)
            self.update_wp_position(waypoint,vehicle_index_int)
            
            if self._current_wp[vehicle_index_int]==waypoint: # Query if vehicle is at target WP
                self.wp_reached[vehicle_index_int]=waypoint # SUCCESS
            self._rate.sleep()
            print('Moving to waypoint: ' + waypoint)
        response = int(waypoint == self.wp_reached[vehicle_index_int])
        print('Vehicle ' + str(vehicle_index_int) + ' response: ' + str(response))
        if (rospy.Time.now() - start) > duration:
            response = self.OUT_OF_DURATION
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
        
    def set_current_target_wp(self, waypoint_string, vehicle_index):     
        turbine_idx, point_idx = [int(x) for x in re.findall(r'\d+', waypoint_string)]
        target_position = self.turbine_waypoints[turbine_idx][point_idx]
        self.target_wp[vehicle_index] = [target_position[0], target_position[1], target_position[2]]

    def set_init_position_param(self, position, vehicle_index):
        rospy.set_param('/planning/initial_position/auv' + str(vehicle_index), [position.x, position.y, position.z])       

    def update_wp_position(self,waypoint,vehicle_index):
        wp = -1
        
        dist_x = sqrt((self.odom_pose[vehicle_index].pose.pose.position.x - self.target_wp[vehicle_index][0])**2)
        dist_y = sqrt((self.odom_pose[vehicle_index].pose.pose.position.y - self.target_wp[vehicle_index][1])**2)
        dist_z = sqrt((self.odom_pose[vehicle_index].pose.pose.position.z - self.target_wp[vehicle_index][2])**2)
        # rospy.logwarn_throttle(1,'DISTANCES: ')
        # rospy.logwarn_throttle(1,dist_x.real)
        # rospy.logwarn_throttle(1,dist_y.real)
        # rospy.logwarn_throttle(1,dist_z.real)
        if dist_x.real<self.EPS_DISTANCE and dist_y.real<self.EPS_DISTANCE and dist_z.real<self.EPS_DISTANCE:
            wp = waypoint
        self._current_wp[vehicle_index] = wp
        
        
        # rospy.loginfo_throttle(2,'Distance to target X: ' + str((dist_x.real,5)))
        # rospy.loginfo_throttle(2,'Distance to target Y: ' + str((dist_y.real,5)))
        # rospy.loginfo_throttle(2,'Distance to target Z: ' + str((dist_z.real,5)))
        # rospy.loginfo_throttle(2,'self.target[0]: ' + str(self.target_wp[0]))
        # rospy.loginfo_throttle(2,'self.target[1]: ' + str(self.target_wp[1]))
        # rospy.loginfo_throttle(2,'self.target[2]: ' + str(self.target_wp[2]))
        
    def publish_wp_cmd_pose_fixed_orientation(self, vehicle_index): 
        cmd_pose=PoseStamped()      
        cmd_pose.pose.position.x=self.target_wp[vehicle_index][0]
        cmd_pose.pose.position.y=self.target_wp[vehicle_index][1]
        cmd_pose.pose.position.z=self.target_wp[vehicle_index][2]
        cmd_pose.pose.orientation.x=0
        cmd_pose.pose.orientation.y=0
        cmd_pose.pose.orientation.z=0
        cmd_pose.pose.orientation.w=1
        # rospy.loginfo_throttle(1,'Publishing waypoint: ' + str(cmd_pose))
        self.cmd_pose_pub[vehicle_index].publish(cmd_pose)
        
    def publish_position_fixed_orientation(self, pos, vehicle_index):
        cmd_pose=PoseStamped()      
        cmd_pose.pose.position.x=pos.x
        cmd_pose.pose.position.y=pos.y
        cmd_pose.pose.position.z=pos.z
        cmd_pose.pose.orientation.x=0
        cmd_pose.pose.orientation.y=0
        cmd_pose.pose.orientation.z=0
        cmd_pose.pose.orientation.w=1
        self.cmd_pose_pub[vehicle_index].publish(cmd_pose)

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
    
    def get_position(self,vehicle_index):
        return self.odom_pose[vehicle_index].pose.pose.position

    def get_orientation(self, vehicle_index):
        return self.odom_pose[vehicle_index].pose.pose.orientation
    
    def get_linear_velocity(self, vehicle_index):
        return self.odom_pose[vehicle_index].pose.pose.position

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
        print(q2)
        print(q1_inv)
        qr = quaternion_multiply([q2.x,q2.y,q2.z,q2.w],[q1_inv.x,q1_inv.y,q1_inv.z,q1_inv.w])
        return qr

    def rotate_vehicle(self, rotate_angle, rotate_axis, vehicle_index):
        orientation_q = self.get_orientation(vehicle_index)
        orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
        (current_roll, current_pitch, current_yaw) = euler_from_quaternion (orientation_list)
        if rotate_axis == 'roll': desired_orientation_list = quaternion_from_euler(current_roll + rotate_angle, current_pitch, current_yaw)
        if rotate_axis == 'pitch': desired_orientation_list = quaternion_from_euler(current_roll, current_pitch + rotate_angle, current_yaw)
        if rotate_axis == 'yaw': desired_orientation_list = quaternion_from_euler(current_roll, current_pitch, current_yaw + rotate_angle)
        (desired_roll, desired_pitch, desired_yaw) = euler_from_quaternion (desired_orientation_list)
        desired_orientation_q = Quaternion()
        desired_orientation_q.x, desired_orientation_q.y, desired_orientation_q.z, desired_orientation_q.w = desired_orientation_list[0], desired_orientation_list[1], desired_orientation_list[2], desired_orientation_list[3]  
        position_q = self.get_position(vehicle_index) 
        self.publish_cmd_pose(position_q, desired_orientation_q)
        if rotate_axis == 'roll': 
            while abs(self.smallest_angular_distance(current_roll*(180/pi), desired_roll*(180/pi)))>self.EPS_ANGLE:
                orientation_q = self.get_orientation(vehicle_index)
                orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
                (current_roll, current_pitch, current_yaw) = euler_from_quaternion (orientation_list)
            return True
        elif rotate_axis == 'pitch': 
            while abs(self.smallest_angular_distance(current_pitch*(180/pi), desired_pitch*(180/pi)))>self.EPS_ANGLE:
                orientation_q = self.get_orientation(vehicle_index)
                orientation_list = [orientation_q.x, orientation_q.y, orientation_q.z, orientation_q.w]
                (current_roll, current_pitch, current_yaw) = euler_from_quaternion (orientation_list)
            return True
        elif rotate_axis == 'yaw': 
            while abs(self.smallest_angular_distance(current_yaw*(180/pi), desired_yaw*(180/pi)))>self.EPS_ANGLE:
                orientation_q = self.get_orientation(vehicle_index)
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

    def command_halt_vehicle(self,vehicle_index):
        position=self.get_position(vehicle_index)
        orientation=self.get_orientation(vehicle_index)
        rospy.loginfo('Vehicle Halted! Position: ' + str(position))
        self.publish_cmd_pose(position,orientation)