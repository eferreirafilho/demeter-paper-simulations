#!/usr/bin/env python
import rospy
from uuv_gazebo_ros_plugins_msgs.msg import FloatStamped
from std_msgs.msg import Float32, Bool

INIT_BATTERY_LEVEL = 100 # %
NUMBER_OF_THRUSTERS = 6
THRUSTERS_CONSUMPTION_FACTOR = 0.000003
RECHARGING_RATE = 0.01
RECHARGING_RATE_DEDICATED = 0.05
        
class BatteryController(object):

    def __init__(self):
        # Fetch AUV index and initialize variables
        self.vehicle_idx = rospy.get_param("/goal_allocation/vehicle_idx")
        # rospy.loginfo(self.vehicle_idx)
        # Initialize is_submerged status for each AUV
        self.is_submerged = [True] * len(self.vehicle_idx)
        self.vehicle_thruster_list = []
        self.mean_thruster_usage  = [0]*len(self.vehicle_idx)
        self.recharging  = [1]*len(self.vehicle_idx)
        self.is_surfaced = [False]*len(self.vehicle_idx)
        self.recharging_dedicated  = [False]*len(self.vehicle_idx)
        # Initialize the 'received' flags
        self.received_battery_level = [False] * len(self.vehicle_idx)
        self.received_recharging_dedicated = [False] * len(self.vehicle_idx)
        self.received_is_surfaced = [False] * len(self.vehicle_idx)
        # rospy.loginfo(self.mean_thruster_usage)
        self.battery_level = [INIT_BATTERY_LEVEL] * len(self.vehicle_idx)
        self.battery_pub = []
        self.rate = rospy.Rate(5)  # ROS Rate at 5Hz
         
        for idx in self.vehicle_idx:
            thruster_list = [0] *NUMBER_OF_THRUSTERS
            self.vehicle_thruster_list.append(thruster_list)
            rospy.Subscriber("/auv"+ str(idx)+ "/battery_level_emulated", Float32, self.battery_level_callback, callback_args=idx)
            rospy.Subscriber("/auv"+ str(idx)+ "/is_submerged", Bool , self.is_submerged_callback, callback_args=idx)
            rospy.Subscriber("/auv"+ str(idx)+ "/recharging_dedicated", Bool , self.recharging_dedicated_callback, callback_args=idx)
            battery_pub = rospy.Publisher("/auv" + str(idx) + "/battery_level_emulated", Float32, queue_size=1)
            self.battery_pub.append(battery_pub)
        self.create_thrusters_subscribers() # For all vehicles
        # self.rate.sleep()
        
    def publish_battery_level(self):
        # Update and publish battery level until ROS shutdown
        while not rospy.is_shutdown():
            self.update_battery_level()
            for i in range(len(self.vehicle_idx)):
                self.battery_pub[i].publish(self.battery_level[i])
            # self.rate.sleep()

    def update_battery_level(self):
        # Update battery level for each AUV
        for idx, level in enumerate(self.battery_level):
            # Check if we've received all necessary messages before attempting to update the battery level
            if not self.received_battery_level[idx] or not self.received_recharging_dedicated[idx] or not self.received_is_surfaced[idx]:
                continue
            recharging = RECHARGING_RATE*(self.recharging[idx])
            recharging_dedicated = RECHARGING_RATE_DEDICATED*(self.recharging_dedicated[idx])
            self.battery_level[idx] = (level - THRUSTERS_CONSUMPTION_FACTOR*(self.mean_thruster_usage[idx]) + recharging + recharging_dedicated)
            # rospy.loginfo('auv: ' + str(idx) + 'self.battery: ' + str(recharging) + ' dedicated: ' +str(recharging_dedicated))
            if self.battery_level[idx] >= 100:
                self.battery_level[idx] = 100
            if self.battery_level[idx] <= 0:
                self.battery_level[idx] = 0

    def create_thrusters_subscribers(self):
        # Define subscribers for thrusters
        for auv_idx in self.vehicle_idx:
            for thruster in range(NUMBER_OF_THRUSTERS):
                thruster_topic = "/auv" + str(auv_idx) + "/thrusters/" + str(thruster) + "/thrust"
                rospy.Subscriber(thruster_topic, FloatStamped, self.thruster_callback, callback_args=(auv_idx, thruster))

    def get_mean_thruster(self):
        # Calculate mean thrust of each AUV
        mean_abs_value = [0 for _ in range(len(self.vehicle_idx))]
        for idx, vehicle_list in enumerate(self.vehicle_thruster_list):
            mean_abs_value[idx] = sum(abs(x) for x in vehicle_list)/len(vehicle_list)
        return mean_abs_value
    
    def thruster_callback(self, thruster_msg, args):
        # Store thruster data and update mean usage
        vehicle_idx = int(args[0])
        thruster_idx = int(args[1])
        self.vehicle_thruster_list[vehicle_idx][thruster_idx] = thruster_msg.data
        self.mean_thruster_usage = self.get_mean_thruster()
            
    def battery_level_callback(self, msg, vehicle_idx):
        # Update battery level from callback
        self.battery_level[vehicle_idx] = msg.data
        self.received_battery_level[vehicle_idx] = True
        
    def recharging_dedicated_callback(self, msg, vehicle_idx):
        # Update recharging dedicated status from callback
        self.recharging_dedicated[vehicle_idx] = msg.data
        self.received_recharging_dedicated[vehicle_idx] = True
        
    def is_submerged_callback(self, msg, vehicle_idx):
        # Update recharging based on surface status from callback
        if msg.data == True:
            self.recharging[vehicle_idx] = 0
        elif msg.data == False:
            self.recharging[vehicle_idx] = 1
        self.received_is_surfaced[vehicle_idx] = True

if __name__ == '__main__':
    rospy.init_node('emulated_battery_monitor')
    battery = BatteryController()
    battery.publish_battery_level()
