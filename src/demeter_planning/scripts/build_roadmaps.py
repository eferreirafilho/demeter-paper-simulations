#!/usr/bin/env python
import rospy
import networkx as nx
import matplotlib.pyplot as plt
from scipy.spatial import Voronoi, voronoi_plot_2d
import numpy as np


class BuildRoadmaps(object):

    def __init__(self):
        rospy.logdebug('Build Roadmaps')
            
    def load_turbines_xy(self):
        self.NUMBER_OF_TURBINES_CONSIDERED=5
        turbines_xy = rospy.get_param("/build_roadmaps/turbines_x"), rospy.get_param("/build_roadmaps/turbines_y")
        first_n_turbines = (turbines_xy[0][:self.NUMBER_OF_TURBINES_CONSIDERED], turbines_xy[1][:self.NUMBER_OF_TURBINES_CONSIDERED]) # To reduce number of turbines in gazebo
        self.turbines_xy = self.convert_minutes_to_km(first_n_turbines)

    def load_corners_xy(self):
        corners_xy = rospy.get_param("/build_roadmaps/corners_x"), rospy.get_param("/build_roadmaps/corners_y") 
        self.corners_xy = self.convert_minutes_to_km(corners_xy)
        
    def convert_minutes_to_km(self, minutes):
        ONE_MINUTE_TO_KM = 1.85
        result = []
        for corner in minutes:
            converted_corner = [x * ONE_MINUTE_TO_KM for x in corner]
            result.append(converted_corner)
        return result
            
    def build_voronoi(self):
        turbines_xy_array = np.array(self.turbines_xy).T
        corners_xy_array = np.array(self.corners_xy).T

        # Compute the Voronoi diagram
        self.voronoi_construction = Voronoi(np.concatenate((turbines_xy_array, corners_xy_array), axis=0))

    def plot_voronoi(self):
        # Visualize the Voronoi diagram with a fixed aspect ratio
        fig, ax = plt.subplots(figsize=(6, 6))
        ax.set_aspect('equal')
        voronoi_plot_2d(self.voronoi_construction, ax=ax)
        plt.show()
        
    def create_countor_points(self, turbine):
        NUMBER_OF_COUNTOUR_POINTS = 5
        DISTANCE_TO_TURBINE = 0.1
        contour_points = self.generate_equidistant_points(self.turbines_xy[0][turbine], self.turbines_xy[1][turbine], NUMBER_OF_COUNTOUR_POINTS, DISTANCE_TO_TURBINE)
        voronoi_region = self.voronoi_construction.regions[self.voronoi_construction.point_region[turbine]]
        return contour_points, voronoi_region
    
    def build_graph_from_voronoi(self):
        self.G = nx.Graph()
        # Add voronoi vertices and its positions
        for idx, vertice in enumerate(self.voronoi_construction.vertices):
            self.G.add_node(idx, pos = vertice, description = 'voronoi_vertice', related_to = idx)
        # Add edges to the graph, corresponding to the Voronoi ridges
        for ridge in self.voronoi_construction.ridge_vertices:
            if all(index >= 0 for index in ridge):
                self.G.add_edge(*ridge)
        
    def add_contour_points_to_graph(self):
        for turbine in range(len(self.turbines_xy[0])):
            countor_point_node_index=[]
            contour_points, voronoi_region = self.create_countor_points(turbine)
            # Create contour nodes
            for p in contour_points:
                node_number=self.G.number_of_nodes()
                countor_point_node_index.append(node_number)
                self.G.add_node(node_number, pos = p, description = 'countor_point', related_to = turbine)
            # Add edges between countour points
            for i in range(len(countor_point_node_index)):
                self.G.add_edge(countor_point_node_index[i], countor_point_node_index[(i+1)%len(countor_point_node_index)])
            # Add edges from each Voronoi vertice to the closer countor point            
            for v in voronoi_region:
                dist = float('inf')
                closer_countor = []
                for p_idx, p in enumerate(contour_points):
                    dist_countor_to_voronoi = ((self.voronoi_construction.vertices[v][0]-p[0])**2 + (self.voronoi_construction.vertices[v][1]-p[1])**2)**0.5
                    if dist_countor_to_voronoi.real < dist.real:
                        dist = dist_countor_to_voronoi.real
                        closer_countor = p_idx
                if closer_countor is not None:  # check for closer_countor being None
                    self.G.add_edge(v, countor_point_node_index[closer_countor])
                    
    def scale_graph(self):
        self.G_with_turbines = self.G.copy()
        for turbine in range(len(self.turbines_xy[0])):
            self.G_with_turbines.add_node(self.G_with_turbines.number_of_nodes(), pos = [self.turbines_xy[0][turbine], self.turbines_xy[1][turbine]], description = 'turbine', related_to = turbine)
        self.normalized_poi = self.normalize_around_zero(nx.get_node_attributes(self.G_with_turbines, 'pos'))
        nx.set_node_attributes(self.G_with_turbines, self.normalized_poi, 'pos')
        
    def plot_scaled_points(self):
        fig, ax = plt.subplots()
        for i in range(len(self.G_with_turbines.nodes())):
            node = self.G_with_turbines.nodes[i] 
            if node['description'] == 'voronoi_vertice':
                ax.scatter(node['pos'][0], node['pos'][1], color='red')
            if node['description'] == 'countor_point':
                ax.scatter(node['pos'][0], node['pos'][1], color='gray')
            if node['description'] == 'turbine':
                ax.scatter(node['pos'][0], node['pos'][1], color='blue')

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
    
    def normalize_around_zero(self, vector_nodes, lower_bound=-250, upper_bound=250):
        vector_nodes = np.array(list(vector_nodes.values()))
        x_vals = [x for x, y in vector_nodes]
        y_vals = [y for x, y in vector_nodes]
        x_min, x_max = min(x_vals), max(x_vals)
        y_min, y_max = min(y_vals), max(y_vals)
        x_range = (x_max - x_min) + 0.01
        y_range = (y_max - y_min) + 0.01
        x_centroid = (x_min + x_max) / 2
        y_centroid = (y_min + y_max) / 2

        SHIFT_TO_THE_RIGHT = 100
        normalized_x = [(x - x_centroid) / (x_range / 2) * (upper_bound - lower_bound) + (upper_bound + lower_bound) / 2 + SHIFT_TO_THE_RIGHT for x in x_vals]
        normalized_y = [(y - y_centroid) / (y_range / 2) * (upper_bound - lower_bound) + (upper_bound + lower_bound) / 2 for y in y_vals]

        # create a new dictionary with the same keys as the input and the normalized values
        normalized_dict = {}
        for i, (x, y) in enumerate(zip(normalized_x, normalized_y)):
            normalized_dict[i] = np.array([x, y])
        return normalized_dict

    def set_normalized_poi_to_rosparam(self):
        scaled_voronoi_vertice_x = []
        scaled_voronoi_vertice_y = []
        scaled_countor_point_x = []
        scaled_countor_point_y = []
        scaled_countor_point_related_to = []
        scaled_turbine_x = []
        scaled_turbine_y = []
        for i in range(len(self.G_with_turbines.nodes())):
            node = self.G_with_turbines.nodes[i] 
            if node['description'] == 'voronoi_vertice':
                scaled_voronoi_vertice_x.append(float(node['pos'][0]))
                scaled_voronoi_vertice_y.append(float(node['pos'][1]))
            if node['description'] == 'countor_point':
                scaled_countor_point_x.append(float(node['pos'][0]))
                scaled_countor_point_y.append(float(node['pos'][1]))
                # print(int(node['related_to']))
                scaled_countor_point_related_to.append(int(node['related_to']))
            if node['description'] == 'turbine':
                scaled_turbine_x.append(float(node['pos'][0]))
                scaled_turbine_y.append(float(node['pos'][1]))
        
        rospy.set_param('/build_roadmaps/scaled_voronoi_vertice_x', scaled_voronoi_vertice_x)
        rospy.set_param('/build_roadmaps/scaled_voronoi_vertice_y', scaled_voronoi_vertice_y)
        rospy.set_param('/build_roadmaps/scaled_countor_point_x', scaled_countor_point_x)
        rospy.set_param('/build_roadmaps/scaled_countor_point_y', scaled_countor_point_y)
        rospy.set_param('/build_roadmaps/scaled_countor_point_related_to', scaled_countor_point_related_to)
        rospy.set_param('/build_roadmaps/scaled_turbine_x', scaled_turbine_x)
        rospy.set_param('/build_roadmaps/scaled_turbine_y', scaled_turbine_y)
                        
    def create_turbines_world(self):
        turbines_x = []
        turbines_y = []
        for i in range(len(self.G_with_turbines.nodes())):
            node = self.G_with_turbines.nodes[i] 
            if node['description'] == 'turbine':
                # ax.scatter(node['pos'][0], node['pos'][1], color='blue')
                turbines_x.append(node['pos'][0])
                turbines_y.append(node['pos'][1])
        
        # Combine the X and Y coordinates into pairs
        coordinates = list(zip(turbines_x, turbines_y))
        # Open the output file for writing
        with open("/home/edson/ws_demeter_rosplan/src/auv_gazebo/worlds/turbine.world", "w") as file:
            # Write header
            file.write('<?xml version="1.0" ?>\n')
            file.write('<sdf version="1.6">\n')
            file.write('\n')
            file.write('  <world name="turbine_world">\n')
            file.write('\n')
            file.write('    <include>\n')
            file.write('      <uri>model://sun</uri>\n')
            file.write('    </include>\n')
            file.write('\n')
            file.write('    <!-- Bounding box with sea surface -->\n')
            file.write('    <include>\n')
            file.write('      <uri>model://ocean_auv</uri>\n')
            file.write('      <pose>0 0 -0.95 0 0 0</pose>\n')
            file.write('    </include>\n')
            # Write turbines
            for i, (x, y) in enumerate(coordinates):
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

    def draw_graph(self):
        nx.draw(self.G, nx.get_node_attributes(self.G, 'pos'), node_size=10,with_labels=True)
        plt.show()

if __name__ == '__main__':
    rospy.logdebug('Build Roadmaps.init')
    rospy.init_node('build_roadmaps', anonymous=True)
    Roadmap = BuildRoadmaps()
    
    Roadmap.load_turbines_xy()
    Roadmap.load_corners_xy()
    Roadmap.build_voronoi()
    Roadmap.build_graph_from_voronoi()
    Roadmap.add_contour_points_to_graph()
    # Roadmap.draw_graph()
    if nx.is_connected(Roadmap.G):
        rospy.logwarn('Graph is connected, ok!')  # True
    else:
        rospy.logwarn('Graph is not connected, create another roadmap!')  # True
    
    Roadmap.scale_graph()    
    # Roadmap.plot_scaled_points()

    Roadmap.create_turbines_world()
    Roadmap.set_normalized_poi_to_rosparam()
