#!/usr/bin/env python
import rospy
from uuv_gazebo_ros_plugins_msgs.msg import FloatStamped
from std_msgs.msg import Float32
from rosplan_dispatch_msgs.msg import ActionDispatch
from threading import Lock

INIT_BATTERY_LEVEL = 100 # %
NUMBER_OF_THRUSTERS = 6
THRUSTERS_CONSUMPTION_FACTOR = 0.0005
RECHARGING_RATE = 0.01
RECHARGING_RATE_DEDICATED = 3
        
class BatteryController(object):

    def __init__(self):
        self.vehicle_idx = rospy.get_param("/goal_allocation/vehicle_idx")
        rospy.logwarn(self.vehicle_idx)
        self.vehicle_thruster_list = []
        self.mean_thruster_usage  = [0]*len(self.vehicle_idx)
        self.recharging  = [1]*len(self.vehicle_idx)
        self.recharging_dedicated  = [0]*len(self.vehicle_idx)
        rospy.logwarn(self.mean_thruster_usage)
        self.battery_level = [INIT_BATTERY_LEVEL] * len(self.vehicle_idx)
        self.battery_pub = []
        self.rate = rospy.Rate(5)  # ROS Rate at 5Hz
         
        for idx in self.vehicle_idx:
            thruster_list = [0] *NUMBER_OF_THRUSTERS
            self.vehicle_thruster_list.append(thruster_list)
            rospy.Subscriber("/auv"+ str(idx)+ "/battery_level_emulated", Float32, self.battery_level_callback, callback_args=idx)
            battery_pub = rospy.Publisher("/auv" + str(idx) + "/battery_level_emulated", Float32, queue_size=1)
            self.battery_pub.append(battery_pub)

        self.define_thrusters_subscribers()
        self.rate.sleep()
        
        self.define_action_dispatch_subscribers()

    def publish_battery_level(self):
        while not rospy.is_shutdown():
            self.update_battery_level()
            for i in range(len(self.vehicle_idx)):
                self.battery_pub[i].publish(self.battery_level[i])
            self.rate.sleep()

    def update_battery_level(self):
        for idx, level in enumerate(self.battery_level):
            recharging = RECHARGING_RATE*(self.recharging[idx])
            recharging_dedicated = RECHARGING_RATE_DEDICATED*(self.recharging_dedicated[idx])
            self.battery_level[idx] = (level - THRUSTERS_CONSUMPTION_FACTOR*(self.mean_thruster_usage[idx]) + recharging + recharging_dedicated)
            # rospy.logwarn('auv: ' + str(idx) + 'self.battery: ' + str(recharging) + ' dedicated: ' +str(recharging_dedicated))
            if self.battery_level[idx] >= 100:
                self.battery_level[idx] = 100
            if self.battery_level[idx] <= 0:
                self.battery_level[idx] = 0

    def define_thrusters_subscribers(self):
        for auv_idx in self.vehicle_idx:
            for thruster in range(NUMBER_OF_THRUSTERS):
                thruster_topic = "/auv" + str(auv_idx) + "/thrusters/" + str(thruster) + "/thrust"
                rospy.Subscriber(thruster_topic, FloatStamped, self.thruster_callback, callback_args=(auv_idx, thruster))

    def define_action_dispatch_subscribers(self):
        for auv_idx in self.vehicle_idx:
            action_dispatch_topic = "/auv" + str(auv_idx) + "/rosplan_plan_dispatcher/action_dispatch"
            rospy.logwarn(action_dispatch_topic)
            rospy.Subscriber(action_dispatch_topic, ActionDispatch, self.action_dispatch_callback, callback_args=auv_idx, queue_size=10)
        
    def get_mean_thruster(self):
        mean_abs_value = [0 for _ in range(len(self.vehicle_idx))]
        for idx, vehicle_list in enumerate(self.vehicle_thruster_list):
            mean_abs_value[idx] = sum(abs(x) for x in vehicle_list)/len(vehicle_list)
        return mean_abs_value
    
    def thruster_callback(self, thruster_msg, args):
        vehicle_idx = int(args[0])
        thruster_idx = int(args[1])
        self.vehicle_thruster_list[vehicle_idx][thruster_idx] = thruster_msg.data
        self.mean_thruster_usage = self.get_mean_thruster()
        
    def action_dispatch_callback(self, msg, arg):
        rospy.logwarn(msg.name)
        if msg.name == 'wait-to-recharge':
            self.recharging_dedicated[arg] = 1
            rospy.logwarn('Recharging dedicated')
        if msg.name == 'move' or msg.name == 'localize-cable' or msg.name == 'submerge-mission': # Actions that stop wait-to-recharge action
            self.recharging_dedicated[arg] = 0
        if msg.name == 'move' or msg.name == 'transmit-data': # Actions on the surface
            self.recharging[arg] = 1
        else:
            self.recharging[arg] = 0
            
    def battery_level_callback(self, msg, vehicle_idx):
        self.battery_level[vehicle_idx] = msg.data

if __name__ == '__main__':
    rospy.loginfo('emulated_battery_monitor')
    rospy.init_node('emulated_battery_monitor')
    battery = BatteryController()
    battery.publish_battery_level()
