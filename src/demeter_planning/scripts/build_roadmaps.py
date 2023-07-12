#!/usr/bin/env python3.8
import rospy
import networkx as nx
import matplotlib.pyplot as plt
from itertools import combinations
from scipy.spatial import Voronoi, voronoi_plot_2d
import numpy as np
import yaml
import os
import roslib
from rospkg import RosPack
import pickle

class BuildRoadmaps(object):
    def __init__(self):
        rospy.logwarn('Build Roadmaps')
        self._rate = rospy.Rate(10)
        self.DISTANCE_TO_TURBINE = 0.18
        self.NUMBER_OF_TURBINES_CONSIDERED = 15
        self.VISIBILITY_RADIUS = 1.2
        self.BOUNDS_MAP = 50
        self.package_path = roslib.packages.get_pkg_dir("demeter_planning")
            
    def set_number_of_contour_points(self, number):
        self.NUMBER_OF_CONTOUR_POINTS = number        
            
    def load_turbines_xy(self):
        turbines_xy = rospy.get_param("/build_roadmaps/turbines_x"), rospy.get_param("/build_roadmaps/turbines_y")
        first_n_turbines = (turbines_xy[0][:self.NUMBER_OF_TURBINES_CONSIDERED], turbines_xy[1][:self.NUMBER_OF_TURBINES_CONSIDERED]) # To reduce number of turbines in gazebo
        first_n_turbines = self.convert_minutes_to_km(first_n_turbines)
        return first_n_turbines

    def load_corners_xy(self):
        corners_xy = rospy.get_param("/build_roadmaps/corners_x"), rospy.get_param("/build_roadmaps/corners_y") 
        corners_xy = self.convert_minutes_to_km(corners_xy)
        return corners_xy
        
    def convert_minutes_to_km(self, minutes):
        ONE_MINUTE_TO_KM = 1.85
        result = []
        for corner in minutes:
            converted_corner = [x * ONE_MINUTE_TO_KM for x in corner]
            result.append(converted_corner)
        return result
    
    def _wait(self, n_rate):
        for _ in range(n_rate):
            self._rate.sleep()
      
    def create_visibility_graph(self, turbines_xy, corners_xy):
        
        visibility_G = nx.Graph()       
        corners = np.array(corners_xy).T
        # Set corners as nodes
        for corner_point in corners:
            visibility_G.add_node(visibility_G.number_of_nodes(), pos = corner_point, description = 'corner', related_to = 'NaN')
        obstacles = self.create_contour_point(turbines_xy)

        # Set contour points as nodes
        EPSILON = 0.001
        for turbine, obs in enumerate(obstacles):
            scaled_obs = self.scaled_obstacle(obs, scale_factor=1+EPSILON) # Scale obstacle a little to use the points in the visibility graph
            # points = np.concatenate((points, scaled_obs), axis=0)
            for contour_point in scaled_obs:
                visibility_G.add_node(max(visibility_G.nodes())+1, pos = contour_point, description = 'contour_point', related_to = turbine)

        node_positions = []
        # Get all pos attributes concatenated in a numpy array
        for _, attrs in visibility_G.nodes(data=True):
            node_positions.append(attrs['pos'])
            node_positions_array = np.array(node_positions)

        # Iterate through all pairs of points (p1, p2) except when they are the same
        for node1, p1 in enumerate(node_positions_array):
            for node2, p2 in enumerate(node_positions_array):
                dist = np.linalg.norm(p1 - p2)  # compute the Euclidean distance between p1 and p2
                if dist > self.VISIBILITY_RADIUS: # compute only within a region
                    continue
                if p1.tolist() != p2.tolist():
                    obstructed = False
                    # Check if there is an obstacle intersecting the line between p1 and p2
                    for obs in obstacles:
                        if not obstructed:
                            for i in range(len(obs)):
                                # Get consecutive vertices (a, b) of the obstacle polygon
                                if i < len(obs) - 1:
                                    a = obs[i]
                                    b = obs[i + 1]
                                else:
                                    a = obs[i]
                                    b = obs[0]
                                
                                # If line between p1 and p2 intersects with edge (a, b), set obstructed to True
                                if self.intersects(p1, p2, a, b):
                                    obstructed = True
                                    break

                    # If line between p1 and p2 is not obstructed, add an edge between them in visibility graph
                    if not obstructed:
                        visibility_G.add_edge(node1, node2, weight = dist)
                        
                        
        return visibility_G, obstacles

    def intersects(self, p1, p2, a, b):
        v1 = p2 - p1
        v2 = a - p1
        v3 = b - p1
        c1 = np.cross(v1, v2)
        c2 = np.cross(v1, v3)
        v4 = b - a
        v5 = p1 - a
        v6 = p2 - a
        c3 = np.cross(v4, v5)
        c4 = np.cross(v4, v6)
        if np.sign(c1) != np.sign(c2) and np.sign(c3) != np.sign(c4):
            return True
        else:
            return False
    
    def create_contour_point(self, turbines_xy): 
        '''Contour points are considered obstacles in the visibility graph'''
        contour_points=[]
        for turbine in range(self.NUMBER_OF_TURBINES_CONSIDERED):
            obs_aux = self.generate_equidistant_points(turbines_xy[0][turbine], turbines_xy[1][turbine], self.NUMBER_OF_CONTOUR_POINTS, self.DISTANCE_TO_TURBINE)
            contour_points.append(obs_aux)
        return contour_points
    
    def scaled_obstacle(self, obs, scale_factor):
        centroid = np.mean(obs, axis=0)
        # Scale the polygon along both axes
        obs_scaled = np.array([[(coord[0] - centroid[0]) * scale_factor + centroid[0],
                                (coord[1] - centroid[1]) * scale_factor + centroid[1]] for coord in obs])   
        return obs_scaled
    
    def plot_visibility_graph(self, visibility_G, obstacles=None):
        fig, ax = plt.subplots()

        # Plot the edges of the graph
        for edge in visibility_G.edges():
            p1, p2 = edge[0], edge[1]
            plt.plot([visibility_G.nodes[p1]["pos"][0], visibility_G.nodes[p2]["pos"][0]], [visibility_G.nodes[p1]["pos"][1], visibility_G.nodes[p2]["pos"][1]], color='blue', linewidth=0.5)

        # Plot the nodes of the graph
        for node in visibility_G.nodes():
            plt.scatter(visibility_G.nodes[node]["pos"][0], visibility_G.nodes[node]["pos"][1], color='red', s=20)
            # Text in all nodes
            # plt.text(visibility_G.nodes[node]["pos"][0], visibility_G.nodes[node]["pos"][1], node, fontsize=9, color='black')

        if obstacles is not None:
            # Plot the obstacles
            for i, obs in enumerate(obstacles):
                obs_x = [point[0] for point in obs]
                obs_y = [point[1] for point in obs]
                obs_x.append(obs[0][0])
                obs_y.append(obs[0][1])

                plt.fill(obs_x, obs_y, 'gray', alpha=0.4, label = 'Safe Regions')
                plt.plot(obs_x, obs_y, color='red', linewidth = 1.0)
                # Plot obstacle number
                obs_center_x = sum(obs_x[:-1]) / len(obs_x[:-1])
                obs_center_y = sum(obs_y[:-1]) / len(obs_y[:-1])
                plt.text(0.9998*obs_center_x, 0.9998*obs_center_y, str(i), fontsize=12, color='black')

        # Remove the text from axis
        plt.gca().set_xticklabels([])
        plt.gca().set_yticklabels([])
        ax.set_aspect('equal', adjustable='box')
        plt.xlabel("X")
        plt.ylabel("Y")
        plt.title("Visibility Graph based Roadmap")

        # Manually set the legend
        vis_safe_roads = plt.Line2D([], [], color='blue', linewidth=0.5, label='Safe roads')
        vis_contour_points = plt.Line2D([], [], color='red', marker='o', markersize=5, label='Turbine contour points')
        plt.legend(handles=[vis_safe_roads, vis_contour_points], loc='best')
        plt.show()
        
    def remove_disconected_nodes(self, graph):
        disconected_nodes = list(nx.isolates(graph))
        graph.remove_nodes_from(disconected_nodes)
        return graph
                    
    def scale_graph(self, graph):
        normalized_poi = self.normalize_around_zero(nx.get_node_attributes(graph, 'pos'))
        nx.set_node_attributes(graph, normalized_poi, 'pos')
        scaled_turbines_xy = []
        for node, data in graph.nodes(data=True):
            if data['description'] == 'turbine':
                pos = data['pos']
                scaled_turbines_xy.append(pos)
        return graph, scaled_turbines_xy
        
    def add_turbines_to_graph(self, graph, turbines_xy):
               
        for turbine in range(len(turbines_xy[0])):
            graph.add_node(max(graph.nodes)+1, pos = np.array([turbines_xy[0][turbine], turbines_xy[1][turbine]]), description = 'turbine', related_to = turbine)  
        return graph
        
    def reorder_graph(self, G):
        # Relabel graphs so that nodes are ordered 0, 1, 2, 3...
        mapping = {node: i for i, node in enumerate(sorted(G))}
        rospy.logwarn(mapping)
        H = nx.relabel_nodes(G, mapping)
        return H
    
    def plot_scaled_points(self, graph):
        fig, ax = plt.subplots()
        for node, data in graph.nodes(data=True):
            if data['description'] == 'turbine':
                ax.scatter(data['pos'][0], data['pos'][1], color='blue')
            if data['description'] == 'contour_point':
                ax.scatter(data['pos'][0], data['pos'][1], color='red')
            if data['description'] == 'corner':
                ax.scatter(data['pos'][0], data['pos'][1], color='gray')
        ax.legend()
        plt.show()
            
    def generate_equidistant_points(self, cx, cy, n, d):
        angles = np.linspace(0, 2*np.pi, n, endpoint=False)
        points = np.zeros((n, 2))
        for i, theta in enumerate(angles):
            x = cx + d * np.cos(theta)
            y = cy + d * np.sin(theta)
            points[i] = [x, y]
        return points
    
    def normalize_around_zero(self, nodes_dict):
        x_vals = [x for x, y in nodes_dict.values()]
        y_vals = [y for x, y in nodes_dict.values()]
        x_min, x_max = min(x_vals), max(x_vals)
        y_min, y_max = min(y_vals), max(y_vals)
        x_range = (x_max - x_min) + 0.01
        y_range = (y_max - y_min) + 0.01
        x_centroid = (x_min + x_max) / 2
        y_centroid = (y_min + y_max) / 2

        SHIFT_TO_THE_RIGHT = 20
        SHIFT_UP = 20
        normalized_x = [(x - x_centroid) / (x_range / 2) * (self.BOUNDS_MAP + self.BOUNDS_MAP) + (self.BOUNDS_MAP - self.BOUNDS_MAP) / 2 + SHIFT_TO_THE_RIGHT for x in x_vals]
        normalized_y = [(y - y_centroid) / (y_range / 2) * (self.BOUNDS_MAP + self.BOUNDS_MAP) + (self.BOUNDS_MAP - self.BOUNDS_MAP) / 2 + SHIFT_UP for y in y_vals]

        # create a new dictionary with the same keys as the input and the normalized values
        normalized_dict = {}
        for key, (x, y) in zip(nodes_dict.keys(), zip(normalized_x, normalized_y)):
            normalized_dict[key] = np.array([x, y])
        return normalized_dict

    def define_turbines_in_world_launch(self, graph, scaled_turbines_xy):
        
        package_path = roslib.packages.get_pkg_dir("auv_gazebo")
        with open(str(package_path) + "/worlds/turbine.world", "w") as file:
            # Write header
            file.write('<?xml version="1.0" ?>\n')
            file.write('<sdf version="1.6">\n')
            file.write('\n')
            file.write('  <world name="turbine_world">\n')
            file.write('\n')
            file.write('    <include>\n')
            file.write('      <uri>model://sun</uri>\n')
            file.write('    </include>\n')
            file.write('    <physics type="ode">\n')
            file.write('      <max_step_size>0.005</max_step_size>\n')
            file.write('      <real_time_factor>0.0</real_time_factor>\n')
            file.write('      <real_time_update_rate>0</real_time_update_rate> \n')
            file.write('    </physics> \n')
            file.write('\n')
            file.write('    <!-- Bounding box with sea surface -->\n')
            file.write('    <include>\n')
            file.write('      <uri>model://ocean_auv</uri>\n')
            file.write('      <pose>0 0 -0.95 0 0 0</pose>\n')
            file.write('    </include>\n')
            # Write turbines
            for i, (x, y) in enumerate(scaled_turbines_xy):
                if i<self.NUMBER_OF_TURBINES_CONSIDERED:
                    file.write("  <include>\n")
                    file.write("    <name>turbine" + str(i) + "</name>\n")
                    file.write("    <uri> model://turbine_rotor</uri>\n")
                    file.write("    <pose>" + str(x) + " " + str(y) + " 0 0 0 0</pose>\n")
                    file.write("  </include>\n")
            #Write footer
            file.write('    <plugin name="underwater_current_plugin" filename="libuuv_underwater_current_ros_plugin.so">\n')
            file.write('      <namespace>hydrodynamics</namespace>\n')
            file.write('      <constant_current>\n')
            file.write('        <topic>current_velocity</topic>\n')
            file.write('        <velocity>\n')
            file.write('          <mean>0</mean>\n')
            file.write('          <min>0</min>\n')
            file.write('          <max>0</max>\n')
            file.write('          <mu>0.0</mu>\n')
            file.write('          <noiseAmp>0.0</noiseAmp>\n')
            file.write('        </velocity>\n\n')
            file.write('        <horizontal_angle>\n')
            file.write('          <mean>0</mean>\n')
            file.write('          <min>-3.141592653589793238</min>\n')
            file.write('          <max>3.141592653589793238</max>\n')
            file.write('          <mu>0.0</mu>\n')
            file.write('          <noiseAmp>0.0</noiseAmp>\n')
            file.write('        </horizontal_angle>\n\n')
            file.write('        <vertical_angle>\n')
            file.write('          <mean>0</mean>\n')
            file.write('          <min>-3.141592653589793238</min>\n')
            file.write('          <max>3.141592653589793238</max>\n')
            file.write('          <mu>0.0</mu>\n')
            file.write('          <noiseAmp>0.0</noiseAmp>\n')
            file.write('        </vertical_angle>\n')
            file.write('      </constant_current>\n')
            file.write('    </plugin>\n\n')
            file.write('    <plugin name="sc_interface" filename="libuuv_sc_ros_interface_plugin.so"/>\n')
            file.write('</world>')
            file.write('</sdf>')
            
    def set_scaled_turbines_as_ros_parameters(self, scaled_turbines_xy):
        scaled_list = [arr.tolist() for arr in scaled_turbines_xy]
        self.save_list_to_yaml(scaled_list, 'scaled_turbines_xy')
        
    def set_waypoints_as_ros_parameters(self, graph):
        waypoints = []
        for node, data in graph.nodes(data=True):
            if data['description'] != 'turbine': # Contour points and corners
                waypoints.append(data['pos'])
        waypoints = [arr.tolist() for arr in waypoints]
        Z_POI_DISTANCE = -0.5
        for i in range(len(waypoints)):
            waypoints[i].append(Z_POI_DISTANCE)
        self.save_list_to_yaml(waypoints, 'waypoints')
        
    def save_list_to_yaml(self, param_list, yaml_name):
        yaml_file_name = yaml_name + ".yaml"
        yaml_path = os.path.join(self.package_path, "params", yaml_file_name)
        with open(yaml_path, 'w') as f:
            f.write(yaml_name + ": \n")
            yaml.dump(param_list, f)
    
    def save_graph_to_file(self, graph, name):
        # save the graph to a file in the Pickle format
        filename = str(name) + ".pickle"
        yaml_path = os.path.join(self.package_path, "params", filename)
        with open(yaml_path, 'wb') as pickle_file:
            pickle.dump(graph, pickle_file, protocol=2)
   
    def draw_graph(self, graph):
        nx.draw(graph, nx.get_node_attributes(graph, 'pos'), node_size=10, with_labels=True)
        
        plt.show()
        
    def get_scaled_nodes_xy(self, G):
        pos_dict = nx.get_node_attributes(G, 'pos')
        x_coords, y_coords = zip(*[pos_dict[node] for node in G.nodes()])
        return [x_coords, y_coords]
        
    def print_nodes_and_attributes(self, graph):
        rospy.logwarn("Nodes and their attributes:")
        for node, attrs in graph.nodes(data=True):
            rospy.logwarn("{}: {}".format(node, attrs))
            
    def build_roadmaps(self):        
        turbines_xy = self.load_turbines_xy()
        corners_xy = self.load_corners_xy()
        visibility_G, obstacles = self.create_visibility_graph(turbines_xy, corners_xy)
        visibility_G_unordered = self.remove_disconected_nodes(visibility_G)
        visibility_G = self.reorder_graph(visibility_G_unordered)
        self.plot_visibility_graph(visibility_G, obstacles)
        return visibility_G
    
    def remove_turbines_from_graph(self, graph):
        turbine_nodes = []
        for node, data in graph.nodes(data=True):
            if data['description'] == 'turbine': # Contour points and corners
                turbine_nodes.append(node)
        graph.remove_nodes_from(turbine_nodes)
        return graph
    
    def add_edges_to_turbines(self, graph):
        '''To be used for allocation purposes'''
        for node1, data1 in graph.nodes(data=True):
            if data1['description'] == 'contour_point':
                pos = data1['pos']
                for node2, data2 in graph.nodes(data=True):
                    if data2['description'] == 'turbine' and data2['related_to'] == node1:
                        graph.add_edge(node1, node2)
        return graph
    
    def change_description(self, graph):
        for node in graph.nodes():
            node_data = graph.nodes[node]
            if node_data['description'] == 'contour_point':
                node_data['description'] = 'turbine'

        return graph
    
    def build_and_save_roadmap_with_contour_points(self):
        '''Build roadmap with contour points and save graph as a pickle file
        Also save scaled turbines and waypoints as ROS parameters '''
        NUMBER_OF_CONTOUR_POINTS = 5
        self.set_number_of_contour_points(NUMBER_OF_CONTOUR_POINTS)
        
        visibility_G = self.build_roadmaps()
        
        # Create a new graph and scale
        visibility_G_with_turbines = visibility_G.copy()
        visibility_G_with_turbines = self.add_turbines_to_graph(visibility_G_with_turbines, self.load_turbines_xy())
        scaled_visibility_G_with_turbines, scaled_turbines_xy = self.scale_graph(visibility_G_with_turbines)  
          
        self.define_turbines_in_world_launch(scaled_visibility_G_with_turbines, scaled_turbines_xy)
        self.save_graph_to_file(scaled_visibility_G_with_turbines, 'scaled_visibility_G_with_contour_points')
        self.set_scaled_turbines_as_ros_parameters(scaled_turbines_xy)

        scaled_visibility_G = self.remove_turbines_from_graph(scaled_visibility_G_with_turbines)
        self.set_waypoints_as_ros_parameters(scaled_visibility_G)
        if nx.is_connected(visibility_G):
            rospy.logwarn('Graph with contour points is connected, ok!')
        else:
            rospy.logwarn('Graph with contour points is not connected, create another roadmap!')
            
    def build_and_save_roadmap_only_with_turbines(self):
        '''Build roadmap only with turbines and save graph as a pickle file'''
        self.set_number_of_contour_points(1) # With only one contour point, the contour point is the turbine
        
        visibility_G = self.build_roadmaps()
        
        # Create a new graph and scale
        visibility_G_with_turbines = visibility_G.copy()
        visibility_G_with_turbines = self.add_turbines_to_graph(visibility_G_with_turbines, self.load_turbines_xy())
        scaled_visibility_G_only_with_turbines, _ = self.scale_graph(visibility_G_with_turbines)  
        scaled_visibility_G_only_with_turbines = self.remove_disconected_nodes(scaled_visibility_G_only_with_turbines)  
        scaled_visibility_G_only_with_turbines = self.change_description(scaled_visibility_G_only_with_turbines)
                  
        self.save_graph_to_file(scaled_visibility_G_only_with_turbines, 'scaled_visibility_G_only_with_turbines')
        self.plot_visibility_graph(scaled_visibility_G_only_with_turbines)
        self.print_nodes_and_attributes(scaled_visibility_G_only_with_turbines)
        
        if nx.is_connected(scaled_visibility_G_only_with_turbines):
            rospy.logwarn('Graph with only turbines is connected, ok!')
        else:
            rospy.logwarn('Graph with only turbines is not connected, create another roadmap!')

if __name__ == '__main__':
    rospy.logdebug('Build Roadmaps.init')
    rospy.init_node('build_roadmaps', anonymous=True)
    
    roadmap_with_contour_points = BuildRoadmaps()
    roadmap_with_contour_points.build_and_save_roadmap_with_contour_points()
    
    roadmap_with_only_turbines = BuildRoadmaps()
    roadmap_with_only_turbines.build_and_save_roadmap_only_with_turbines()