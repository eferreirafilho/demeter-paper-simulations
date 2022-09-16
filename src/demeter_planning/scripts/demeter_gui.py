import sys

from PySide2.QtCore import QSize, Qt
from PySide2.QtWidgets import (
    QApplication,
    QMainWindow,
    QPushButton,
    QVBoxLayout,
    QWidget,
    QLabel,
    QFrame
)


# Subclass QMainWindow to customize your application's main window
class MainWindow(QMainWindow):
    def __init__(self):
        super(MainWindow,self).__init__()

        self.setWindowTitle("Demeter GUI")
        self.resize(400,100)

        layout = QVBoxLayout()

        self.frame = QFrame()
        # widgets = [
        #     QPushButton,
        #     QPushButton,
        #     QPushButton
        # ]
        # for w in widgets:
        #     layout.addWidget(w())
        #     self.btn
            
        self.btn1=QPushButton(self.frame)
        self.btn2=QPushButton(self.frame)
        self.btn3=QPushButton(self.frame)
        self.btn1.setText("Button 1")
        self.btn2.setText("Button 2")
        self.btn3.setText("Button 3")

        layout.addWidget(self.btn1)    
        layout.addWidget(self.btn2)    
        layout.addWidget(self.btn3)    
        self.frame.setLayout(layout)
        self.btn1.clicked.connect(self.button1_action)
        self.btn2.clicked.connect(self.button2_action)
        self.btn3.clicked.connect(self.button3_action)

        self.setCentralWidget(self.frame)
        
    def button1_action(self):
        print("clicked1")
    def button2_action(self):
        print("clicked2")
    def button3_action(self):
        print("clicked3")

app = QApplication(sys.argv)
window = MainWindow()
window.show()

app.exec_()

