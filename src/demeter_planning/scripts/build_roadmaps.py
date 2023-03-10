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
        turbines_xy = rospy.get_param("/build_roadmaps/turbines_x"), rospy.get_param("/build_roadmaps/turbines_y") 
        self.turbines_xy = self.convert_minutes_to_km(turbines_xy)

    def load_corners_xy(self):
        corners_xy = rospy.get_param("/build_roadmaps/corners_x"), rospy.get_param("/build_roadmaps/corners_y") 
        print(corners_xy)
        print(type(corners_xy))
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
                
    def generate_equidistant_points(self, cx, cy, n, d):
        angles = np.linspace(0, 2*np.pi, n, endpoint=False)
        points = np.zeros((n, 2))
        for i, theta in enumerate(angles):
            x = cx + d * np.cos(theta)
            y = cy + d * np.sin(theta)
            points[i] = [x, y]
        return points

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
    Roadmap.draw_graph()
    print(nx.is_connected(Roadmap.G))  # True

    
    
