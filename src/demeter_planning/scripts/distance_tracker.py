#!/usr/bin/env python3.8

import rospy
from nav_msgs.msg import Odometry
from rosgraph_msgs.msg import Clock
import csv
import os

DATA_FILE = "/root/ws_demeter_rosplan/distance_data.csv"

DISTANCE_THRESHOLD = 0.05  # Movements below this are considered noise.
ACCUMULATION_THRESHOLD = 1.0  # Once accumulated distance surpasses this, it's added to the total distance.

class DistanceTracker:
    def __init__(self):
        self.last_poses = {}
        self.distances = {}
        self.accumulated_distances = {}
        self.subscribers = []
        self.sim_time = None

        self.clock_sub = rospy.Subscriber('/clock', Clock, self.clock_callback)

        topics = [topic_tuple[0] for topic_tuple in rospy.get_published_topics()]

        for i in range(10):
            topic_name = "/auv{}/pose_gt".format(i)
            if topic_name in topics:
                sub = rospy.Subscriber(topic_name, Odometry, self.pose_callback, callback_args=i)
                self.subscribers.append(sub)

    def clock_callback(self, msg):
        self.sim_time = msg.clock

    def pose_callback(self, msg, auv_id):
        x = msg.pose.pose.position.x
        y = msg.pose.pose.position.y
        z = msg.pose.pose.position.z

        if auv_id not in self.last_poses:
            self.last_poses[auv_id] = (x, y, z)
            self.distances[auv_id] = 0.0
            self.accumulated_distances[auv_id] = 0.0
            return

        dx = x - self.last_poses[auv_id][0]
        dy = y - self.last_poses[auv_id][1]
        dz = z - self.last_poses[auv_id][2]
        distance = (dx**2 + dy**2 + dz**2)**0.5

        # Only add to the accumulated distance if above the noise threshold
        if distance > DISTANCE_THRESHOLD:
            self.accumulated_distances[auv_id] += distance

            if self.accumulated_distances[auv_id] >= ACCUMULATION_THRESHOLD:
                self.distances[auv_id] += self.accumulated_distances[auv_id]
                self.accumulated_distances[auv_id] = 0.0

        self.last_poses[auv_id] = (x, y, z)

    def save_data(self):
        try:
            with open(DATA_FILE, 'a') as file:
                writer = csv.writer(file)
                for auv_id, distance in self.distances.items():
                    writer.writerow([self.sim_time, auv_id, distance])
        except Exception as e:
            print(f"Error saving data: {e}")


if __name__ == '__main__':
    rospy.init_node('distance_tracker', anonymous=True)
    tracker = DistanceTracker()
    rospy.on_shutdown(tracker.save_data)
    rospy.spin()
