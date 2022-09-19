import sys
import rospy
from std_msgs.msg import String

from PySide2.QtCore import QSize, Qt, QProcess
from PySide2.QtWidgets import (
    QApplication,
    QMainWindow,
    QPushButton,
    QVBoxLayout,
    QWidget,
    QLabel,
    QFrame,
    QPlainTextEdit
)
from demeter_plan_exec import DemeterExec

# Subclass QMainWindow to customize your application's main window
class MainWindow(QMainWindow):
    def __init__(self):
        super(MainWindow,self).__init__()

        self.setWindowTitle("Demeter GUI")
        self.resize(800,200)
        layout = QVBoxLayout()
        self.frame = QFrame()
        self.PUBLISH_N=1

        self.buttons=[]
        NUMBER_OF_BUTTONS=3
        for i in range(NUMBER_OF_BUTTONS):
            self.buttons.append(QPushButton(self.frame))
            layout.addWidget(self.buttons[i])
        
        self.buttons[0].clicked.connect(self.button1_action)
        self.buttons[0].setText("Start Planning Executive")
        self.buttons[1].clicked.connect(self.button2_action)
        self.buttons[1].setText("Get Data Mission")
        self.buttons[2].clicked.connect(self.button3_action)
        self.buttons[2].setText("Go To Waypoint Mission")
        self.buttons.append(self.frame)

        self.text = QPlainTextEdit()
        
        self.frame.setLayout(layout)
        self.setCentralWidget(self.frame)
        
    def button1_action(self):
        rospy.loginfo("Start Executive")
        pub = rospy.Publisher('chatter', String, queue_size=10)
        rospy.init_node('talker', anonymous=True)
        for i in range(self.PUBLISH_N):
            rate = rospy.Rate(10)
            start_executive = "Start Executive"
            rospy.loginfo(start_executive)
            pub.publish(start_executive)

    def button2_action(self):
        print("Get Data")

    def button3_action(self):
        print("clicked3")


if __name__ == '__main__':



    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()

    app.exec_()


