#!/usr/bin/env python3.8
import rospy
from goal_allocation_sa import Allocation

class ImproveAllocation(object):
    def __init__(self):
        self.load_parameters()
        while not rospy.is_shutdown():
            if not self.is_allocating_now:
                rospy.sleep(2)
                self.global_allocation = self.get_global_allocation()
                self.individual_allocation = self.get_individual_allocation()
                goal_allocation.time_window = goal_allocation.compute_next_time_window()
                self.current_cost = goal_allocation.objective_function(self.global_allocation)
                self.best_solution, self.best_cost = goal_allocation.simulated_annealing()
                # if allocation improved and conditions respected, add the new allocation to individual parameters
                # Cost should be smaller
                if self.best_cost < self.current_cost:
                    self.update_individual_allocation(self.best_solution)
                    
            else:
                rospy.loginfo_throttle(5,"Do not improve allocation now. Wait...")
            self.load_parameters()

    def update_individual_allocation(self, new_allocation):
        set_global_allocation = True
        for idx, vehicle_allocation in enumerate(self.individual_allocation):
            # Getting the remaining tasks that should be at the beginning of the new allocation
            global_remaining_allocation = self.global_allocation[idx][:len(self.global_allocation[idx]) - len(vehicle_allocation)]
            
            # Compare initial part of new allocation with remaining global allocation
            initial_allocation_part = new_allocation[idx][:len(global_remaining_allocation)]
            global_allocation_not_empty = len(self.global_allocation[idx]) > 0
            new_allocation_not_empty = len(new_allocation[idx]) > 0
            different_first_element = global_allocation_not_empty and new_allocation_not_empty and self.global_allocation[idx][0] != new_allocation[idx][0]
            if initial_allocation_part != global_remaining_allocation or different_first_element:
                # rospy.loginfo('Not Updated: The new allocation does not start with the remaining global allocation or the first goal does not match.')
                set_global_allocation = False
                break  # No need to check further as we already found a mismatch

        if set_global_allocation:
            # rospy.logwarn('Setting Improved Allocation: ' + str(new_allocation))
            
            for idx, vehicle_allocation in enumerate(self.individual_allocation):
                rospy.set_param('/auv' + str(idx) + '/goals_allocated', new_allocation[idx])        
            rospy.set_param('/goals_allocation/global_allocation', new_allocation)

    def load_parameters(self):
        while not rospy.is_shutdown():
            try:
                self.number_of_vehicles = self.get_number_of_vehicles()
                self.global_allocation = self.get_global_allocation()
                rospy.sleep(1)
                self.individual_allocation = self.get_individual_allocation()
                self.is_allocating_now = self.allocating_now()
                break
            except KeyError:
                rospy.logwarn_throttle(5, "Improve allocation: All parameters not set yet. Retrying in 1 second...")
                rospy.sleep(1)

    def print_params(self):
        rospy.loginfo(self.number_of_vehicles)
        rospy.loginfo(self.global_allocation)
        rospy.loginfo(self.individual_allocation)

    def print_allocation(self):
        rospy.loginfo("Global Current Allocation: " + str(self.global_allocation) + " Current cost: " + str(self.current_cost))
        rospy.loginfo("Individual Current Allocation: " + str(self.individual_allocation) + " Current cost: " + str(self.current_cost))
        rospy.loginfo("New Allocation: " + str(self.best_solution) + " Best cost: " + str(self.best_cost))
        rospy.loginfo("Number of turbines:" + str(len(goal_allocation.turbines)))

    def allocating_now(self):
        return rospy.get_param('/goals_allocation/allocating_now')

    def get_global_allocation(self):
        return rospy.get_param('/goals_allocation/global_allocation')

    def get_individual_allocation(self):
        individual_allocation = [None] * self.number_of_vehicles
        for idx in range(self.number_of_vehicles):
            individual_allocation[idx] = rospy.get_param('/auv' + str(idx) + '/goals_allocated')    
        return individual_allocation

    def get_number_of_vehicles(self):
        vehicles_idx = rospy.get_param("/goal_allocation/vehicle_idx")
        return len(vehicles_idx)

if __name__ == '__main__':
      
    rospy.init_node('improve_allocation', anonymous=True)
    
    goal_allocation = Allocation(reallocation = False)
    improve_allocation = ImproveAllocation()
    
    rospy.spin() 
