#!/usr/bin/env python
import rospy
from uuv_gazebo_ros_plugins_msgs.msg import FloatStamped
from std_msgs.msg import Float32

class BatteryController(object):
    def __init__(self):
        INIT_BATTERY_LEVEL = 100 # %
        self.NUMBER_OF_THRUSTERS = 6
        self.vehicle_idx = rospy.get_param("/goal_allocation/vehicle_idx")
        rospy.logwarn(self.vehicle_idx)
        self.vehicle_thruster_list = []
        self.mean_thruster_usage  = [0]*len(self.vehicle_idx)
        rospy.logwarn(self.mean_thruster_usage)
        self.battery_level = [INIT_BATTERY_LEVEL] * len(self.vehicle_idx)
        self.battery_pub = []
        rate = rospy.Rate(1) # ROS Rate at 5Hz
         
        for idx in self.vehicle_idx:
            thruster_list = [0] * self.NUMBER_OF_THRUSTERS
            self.vehicle_thruster_list.append(thruster_list)
            rospy.Subscriber("/auv"+ str(idx)+ "/battery_level_emulated", Float32, self.battery_callback, callback_args=idx)
            battery_pub = rospy.Publisher("/auv" + str(idx) + "/battery_level_emulated", Float32, queue_size=1)
            self.battery_pub.append(battery_pub)
            rate.sleep()

        self.define_thrusters_subscribers()

        for i in range(len(self.vehicle_idx)):
            self.battery_pub[i].publish(INIT_BATTERY_LEVEL)

        rospy.spin()

    def define_thrusters_subscribers(self):
        for auv_idx in self.vehicle_idx:
            for thruster in range(self.NUMBER_OF_THRUSTERS):
                thruster_topic = "/auv" + str(auv_idx) + "/thrusters/" + str(thruster) + "/thrust"
                rospy.Subscriber(thruster_topic, FloatStamped, self.thruster_callback, callback_args=(auv_idx, thruster))

    def thruster_callback(self, thruster_msg, args):
        vehicle_idx = int(args[0])
        thruster_idx = int(args[1])
        self.vehicle_thruster_list[vehicle_idx][thruster_idx] = thruster_msg.data
        self.mean_thruster_usage = self.get_mean_thruster()
        
        
    def get_mean_thruster(self):
        mean_abs_value = [0 for _ in range(len(self.vehicle_idx))]
        for idx, vehicle_list in enumerate(self.vehicle_thruster_list):
            mean_abs_value[idx] = sum(abs(x) for x in vehicle_list)/len(vehicle_list)
        return mean_abs_value

    def battery_callback(self, msg, arg):
        vehicle_idx = int(arg)
        BATTERY_USAGE_FACTOR = 0.00001
        # rospy.logwarn('battery-level: ' + str(msg.data))
        # rospy.logwarn('self.mean_thruster_usag: ' + str(self.mean_thruster_usage))
        # rospy.logwarn('self.mean_thruster_usag: ' + str(type(self.mean_thruster_usage)))
        
        self.battery_level[vehicle_idx] = (msg.data - BATTERY_USAGE_FACTOR*(self.mean_thruster_usage[arg]))
        battery_pub = self.battery_pub[arg]
        battery_pub.publish(self.battery_level[vehicle_idx])

if __name__ == '__main__':
    rospy.loginfo('emulated_battery_monitor')
    rospy.init_node('emulated_battery_monitor')
    battery = BatteryController()
