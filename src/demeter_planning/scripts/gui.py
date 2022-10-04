#!/usr/bin/env python
import rospy, sys
from std_msgs.msg import String
from std_srvs.srv import Empty

from PySide2.QtCore import Qt
from PySide2.QtWidgets import (
    QApplication,
    QMainWindow,
    QPushButton,
    QVBoxLayout,
    QFrame,
    QPlainTextEdit,
    QComboBox,
    QCheckBox,
    QSlider
)

# Subclass QMainWindow to customize your application's main window
class MainWindow(QMainWindow):
    def __init__(self):
        super(MainWindow,self).__init__()
        self.selected_dropdown_waypoint=0 # Default WP0 (Surface)

        self.setWindowTitle("DEMETER Spike Demo Planning GUI")
        self.resize(600,300)
        layout = QVBoxLayout()
        self.frame = QFrame()
        self.PUBLISH_N=1
        self.replanning_active = 0 # Default replanning: Not Active
        self.allow_backwards_movement_toggle = 0 # Default: Not Allow (DVL localization, only move forwards through WPs)
        self.verify_localization_error = 0 # Default: Check localization errors
        self._cancel_plan_proxy = rospy.ServiceProxy('/rosplan_plan_dispatcher/cancel_dispatch', Empty)

        waypoints_position = [rospy.get_param("/rosplan_demeter_exec/plan_wp_x"), rospy.get_param("/rosplan_demeter_exec/plan_wp_y"),rospy.get_param("/rosplan_demeter_exec/plan_wp_z")]

        self.widgets=[]
        self.widgets.append(QComboBox(self.frame)) # Dropdown menu
        layout.addWidget(self.widgets[0])
        for i in range(len(waypoints_position[0])):
            self.widgets[0].addItems(['                    Waypoint:  WP'+str(i)+'    |    Position  X: '+str(waypoints_position[0][i])+' , Y: '+str(waypoints_position[1][i])+' , Z: '+str(waypoints_position[2][i])])
        self.widgets[0].currentIndexChanged.connect(self.dropdown_index_change)

        self.widgets.append(QPushButton(self.frame)) # Button 1
        layout.addWidget(self.widgets[1])
        self.widgets[1].clicked.connect(self.button1_action)
        self.widgets[1].setText("Planning: Go To Waypoint")

        self.widgets.append(QPushButton(self.frame)) # Button 2
        layout.addWidget(self.widgets[2])
        self.widgets[2].clicked.connect(self.button2_action)
        self.widgets[2].setText("Planning: Data Retrievel Mission")

        self.widgets.append(QPushButton(self.frame)) # Button 3
        layout.addWidget(self.widgets[3])
        self.widgets[3].clicked.connect(self.button3_action)
        self.widgets[3].setText("Planning: Clear Mission")

        self.widgets.append(QPushButton(self.frame)) # Button 4
        layout.addWidget(self.widgets[4])
        self.widgets[4].clicked.connect(self.button4_action)
        self.widgets[4].setText("External: Send Vehicle To Surface")

        self.widgets.append(QPushButton(self.frame)) # Button 5
        layout.addWidget(self.widgets[5])
        self.widgets[5].clicked.connect(self.button5_action)
        self.widgets[5].setText("External: Send Vehicle To Initial Position")

        self.widgets.append(QPushButton(self.frame)) # Button 6
        layout.addWidget(self.widgets[6])
        self.widgets[6].clicked.connect(self.button6_action)
        self.widgets[6].setText("External: Localize Markers (Rotate Vehicle)")

        self.widgets.append(QCheckBox(self.frame)) # Check Box
        layout.addWidget(self.widgets[7])
        self.widgets[7].setText("Replanning")
        self.widgets[7].setChecked(False)
        self.widgets[7].stateChanged.connect(self.replanning_toggle)
        
        self.widgets.append(QCheckBox(self.frame)) # Check Box
        layout.addWidget(self.widgets[8])
        self.widgets[8].setText("Allow Moving Back Through WPs (For Localizing With Markers)")
        self.widgets[8].setChecked(False)
        self.widgets[8].stateChanged.connect(self.localization_choice)

        self.widgets.append(QCheckBox(self.frame)) # Check Box
        layout.addWidget(self.widgets[9])
        self.widgets[9].setText("Verify Localization Error")
        self.widgets[9].setChecked(False)
        self.widgets[9].stateChanged.connect(self.localization_error_choice)

        self.widgets.append(self.frame)
        self.text = QPlainTextEdit()
        self.frame.setLayout(layout)
        self.setCentralWidget(self.frame)

    def dropdown_index_change(self,dropdown_index):
        rospy.loginfo('Dropdown Waypoint Selected: WP ' + str(dropdown_index))
        self.selected_dropdown_waypoint=dropdown_index
        
    def button1_action(self):
        pub = rospy.Publisher('planning/gui', String, queue_size=10)
        rospy.init_node('planning_gui_publisher', anonymous=True)
        for i in range(self.PUBLISH_N):
            rate = rospy.Rate(10)
            gui_msg = (str(self.replanning_active)+str(self.allow_backwards_movement_toggle)+str(self.verify_localization_error)+"Go To Waypoint "+ str(self.selected_dropdown_waypoint))
            pub.publish(gui_msg)

    def button2_action(self):
        pub = rospy.Publisher('planning/gui', String, queue_size=10)
        rospy.init_node('planning_gui_publisher', anonymous=True)
        for i in range(self.PUBLISH_N):
            rate = rospy.Rate(10)
            gui_msg = (str(self.replanning_active)+str(self.allow_backwards_movement_toggle)+str(self.verify_localization_error)+"Get Data "+ str(self.selected_dropdown_waypoint))
            pub.publish(gui_msg)

    def button3_action(self):
        pub = rospy.Publisher('planning/gui', String, queue_size=10)
        rospy.init_node('planning_gui_publisher', anonymous=True)
        for i in range(self.PUBLISH_N):
            rate = rospy.Rate(10)
            gui_msg = ("Clear Mission")
            pub.publish(gui_msg)
    
    def button4_action(self):
        rospy.loginfo("Surface")
        pub = rospy.Publisher('planning/gui', String, queue_size=10)
        rospy.init_node('planning_gui_publisher', anonymous=True)
        for i in range(self.PUBLISH_N):
            rate = rospy.Rate(10)
            start_executive = "Surface"
            pub.publish(start_executive)

    def button5_action(self):
        rospy.loginfo("Initial Position")
        pub = rospy.Publisher('planning/gui', String, queue_size=10)
        rospy.init_node('planning_gui_publisher', anonymous=True)
        for i in range(self.PUBLISH_N):
            rate = rospy.Rate(10)
            start_executive = "Initial Position"
            pub.publish(start_executive)

    def button6_action(self):
        rospy.loginfo("Localize Vehicle (Rotate)")
        pub = rospy.Publisher('planning/gui', String, queue_size=10)
        rospy.init_node('planning_gui_publisher', anonymous=True)
        for i in range(self.PUBLISH_N):
            rate = rospy.Rate(10)
            start_executive = "Localize"
            pub.publish(start_executive)

    def replanning_toggle(self,replanning_check_box):
        self.replanning_active=replanning_check_box

    def localization_choice(self,localization_slider):
        self.allow_backwards_movement_toggle=localization_slider
    
    def localization_error_choice(self,localization_error_slider):
        self.verify_localization_error=localization_error_slider

if __name__ == '__main__':

    gui_aplication = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    gui_aplication.exec_()