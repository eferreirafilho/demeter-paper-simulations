import time
import roslaunch

wait_time = 5

def main():
    
    # Create a UUID for the roslaunch process
    uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
    roslaunch.configure_logging(uuid)

    # Launch the first .launch file
    cli_args1 = ['auv_autonomy', 'position_demo.launch']
    roslaunch_file1 = roslaunch.rlutil.resolve_launch_arguments(cli_args1)
    parent1 = roslaunch.parent.ROSLaunchParent(uuid, roslaunch_file1)

    parent1.start()
    time.sleep(wait_time)  # wait for wait_time seconds

    # Launch the second .launch file
    cli_args2 = ['demeter_planning', 'allocation.launch']
    roslaunch_file2 = roslaunch.rlutil.resolve_launch_arguments(cli_args2)
    parent2 = roslaunch.parent.ROSLaunchParent(uuid, roslaunch_file2)

    parent2.start()
    time.sleep(wait_time)  # wait for wait_time seconds

    # Launch the third .launch file
    cli_args3 = ['demeter_planning', 'multi_auv_planning.launch']
    roslaunch_file3 = roslaunch.rlutil.resolve_launch_arguments(cli_args3)
    parent3 = roslaunch.parent.ROSLaunchParent(uuid, roslaunch_file3)

    parent3.start()
    time.sleep(wait_time)  # wait for wait_time seconds

    # Launch the fourth .launch file
    cli_args4 = ['demeter_planning', 'visualise.launch']
    roslaunch_file4 = roslaunch.rlutil.resolve_launch_arguments(cli_args4)
    parent4 = roslaunch.parent.ROSLaunchParent(uuid, roslaunch_file4)

    parent4.start()
    time.sleep(wait_time)  # wait for wait_time seconds

    # Here you can keep the script alive if needed
    while True:
        pass

if __name__ == "__main__":
    main()
