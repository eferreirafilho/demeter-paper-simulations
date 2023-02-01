#!/usr/bin/env python
# ROS
import subprocess

def launch_launch_file(package_name, file_name):
  # Construct the command to launch the launch file
  cmd = ["roslaunch", package_name, file_name]

  # Launch the launch file in a subprocess
  subprocess.call(cmd)

if __name__ == "__main__":
  # Call the launch_launch_file function with the desired package name and file name
  launch_launch_file("demeter_planning", "planning.launch")
  print("Done")
