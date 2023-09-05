#!/bin/bash

while true; do
    # Start the command in the background
    sr &
    roslaunch demeter_planning total_distance_sim_all.launch &
    # Get its PID (process ID)
    pid=$!

    # Wait for 2 hours
    sleep 2h

    # Send SIGINT to the command
    kill -INT $pid

    # Wait for the process to finish
    wait $pid
done
