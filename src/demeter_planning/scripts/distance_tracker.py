#!/usr/bin/env python3.8

import rospy
from nav_msgs.msg import Odometry
from std_msgs.msg import Int32MultiArray
from rosgraph_msgs.msg import Clock
from openpyxl import load_workbook
import os
import datetime
import pandas as pd

DATA_FILE = "/root/ws_demeter_rosplan/distance_data.xlsx"
DISTANCE_THRESHOLD = 0.05
ACCUMULATION_THRESHOLD = 1.0

class DistanceTracker:
    def __init__(self):
        self.setup_parameters_and_subscribers()
        self.setup_filename()

    def setup_parameters_and_subscribers(self):
        self.wait_for_params()
        self.vehicles_idx = rospy.get_param("/goal_allocation/vehicle_idx")
        self.number_of_turbines = len(rospy.get_param('/goal_allocation/scaled_turbines_xy'))
        self.last_poses = {}
        self.distances = {}
        self.accumulated_distances = {}

        self.clock_sub = rospy.Subscriber('/clock', Clock, self.clock_callback)
        self.mission_completed_data_sub = rospy.Subscriber('/data_topic', Int32MultiArray, self.mission_completed_cb)

        topics = [topic_tuple[0] for topic_tuple in rospy.get_published_topics()]

        for i in self.vehicles_idx:
            topic_name = f"/auv{i}/pose_gt"
            if topic_name in topics:
                rospy.Subscriber(topic_name, Odometry, self.pose_callback, callback_args=i)

    def setup_filename(self):
        now = datetime.datetime.now()
        date_time_str = now.strftime('%H%M_%m%d')
        self.sheet_name = f"turbines{self.number_of_turbines}_vehicles{len(self.vehicles_idx)}_{date_time_str}"
        if len(self.sheet_name) > 31:
            self.sheet_name = self.sheet_name[:28] + "..."
        rospy.set_param('/data_save_filename', self.sheet_name)

    def wait_for_params(self):
        while not (rospy.has_param("/goal_allocation/vehicle_idx") and rospy.has_param('/goal_allocation/scaled_turbines_xy')):
            rospy.loginfo("Waiting for the required parameters...")
            rospy.sleep(1)

    def clock_callback(self, msg):
        self.sim_time = rospy.Time.now().secs

    def pose_callback(self, msg, auv_id):
        x, y, z = msg.pose.pose.position.x, msg.pose.pose.position.y, msg.pose.pose.position.z
        if auv_id not in self.last_poses:
            self.initialize_pose_and_distance(auv_id, x, y, z)
            return

        distance = self.calculate_distance(auv_id, x, y, z)
        if distance > DISTANCE_THRESHOLD:
            self.accumulated_distances[auv_id] += distance
            if self.accumulated_distances[auv_id] >= ACCUMULATION_THRESHOLD:
                self.distances[auv_id] += self.accumulated_distances[auv_id]
                self.accumulated_distances[auv_id] = 0.0

        self.last_poses[auv_id] = (x, y, z)

    def initialize_pose_and_distance(self, auv_id, x, y, z):
        self.last_poses[auv_id] = (x, y, z)
        self.distances[auv_id] = 0.0
        self.accumulated_distances[auv_id] = 0.0

    def calculate_distance(self, auv_id, x, y, z):
        dx, dy, dz = x - self.last_poses[auv_id][0], y - self.last_poses[auv_id][1], z - self.last_poses[auv_id][2]
        return (dx**2 + dy**2 + dz**2)**0.5

    def mission_completed_cb(self, msg):
        vehicle_id, turbine_inspected, inspection_time = msg.data[0], msg.data[1], msg.data[2]
        total_distance = self.distances.get(vehicle_id, 0.0)
        df_mission = pd.DataFrame([[vehicle_id, turbine_inspected, inspection_time, total_distance]], 
                                  columns=['Vehicle ID', 'Turbine Inspected', 'Time', 'Distance so Far'])
        self.append_to_excel(df_mission)

    def append_to_excel(self, df_mission):
        if os.path.exists(DATA_FILE):
            with pd.ExcelWriter(DATA_FILE, engine='openpyxl', mode='a') as writer:
                if self.sheet_name in writer.sheets:
                    # Load existing data
                    df_existing = pd.read_excel(DATA_FILE, sheet_name=self.sheet_name, engine='openpyxl')
                    # Append new data
                    df_combined = pd.concat([df_existing, df_mission], ignore_index=True)
                    # Remove the old sheet and write combined data to a new one
                    writer.book.remove(writer.book[self.sheet_name])
                    df_combined.to_excel(writer, sheet_name=self.sheet_name, index=False)
                else:
                    df_mission.to_excel(writer, sheet_name=self.sheet_name, index=False)
        else:
            df_mission.to_excel(DATA_FILE, sheet_name=self.sheet_name, index=False)

    def save_distance_data(self):
        data_rows = [[self.sim_time, auv_id, distance] for auv_id, distance in self.distances.items()]
        df = pd.DataFrame(data_rows, columns=['Time', 'AUV_ID', 'Total Distance'])
        self.append_to_excel(df)
        
if __name__ == '__main__':
    rospy.init_node('distance_tracker', anonymous=True)
    tracker = DistanceTracker()
    rospy.on_shutdown(tracker.save_distance_data)
    rospy.spin()
