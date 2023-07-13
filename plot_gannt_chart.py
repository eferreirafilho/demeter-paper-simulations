#Accepts only plan.pddl "clean". Example:
# 0.000: (move vehicle0 wp_init_auv0 waypoint52)  [17.714]
# 17.715: (harvest-energy vehicle0)  [10.000]
# 27.716: (harvest-energy vehicle0)  [10.000]
# 37.717: (move vehicle0 waypoint52 waypoint50)  [72.914]
# 110.632: (harvest-energy vehicle0)  [10.000]
# 120.633: (harvest-energy vehicle0)  [10.000]
# 130.634: (harvest-energy vehicle0)  [10.000]

import os
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

# Step 1: Read the files and extract data
data = []
for file in os.listdir():
    if file.endswith(".pddl"):  # assuming the files are text files
        with open(file, 'r') as f:
            vehicle = file.split('.')[0]  # get vehicle name from file name
            for line in f:
                if ': ' in line and not line.startswith('*') and not line.startswith('b'):
                    start, task_duration = line.split(': ', 1)
                    task, duration = task_duration.rsplit('  [', 1)
                    start = float(start)
                    duration = float(duration.rstrip('] \n'))  # remove trailing ]
                    end = start + duration
                    data.append((vehicle, task.strip(), start, end))

# Step 2: Convert to DataFrame for easier manipulation
df = pd.DataFrame(data, columns=['Vehicle', 'Task', 'Start', 'Finish'])
df['Diff'] = df['Finish'] - df['Start']

# Step 3: Plot Gantt Chart
plt.figure(figsize=(12, 8))

colors = plt.cm.viridis(np.linspace(0, 1, len(df['Vehicle'].unique())))
color_dict = dict(zip(df['Vehicle'].unique(), colors))

for i, task in enumerate(df['Task'].unique()):
    for vehicle in df['Vehicle'].unique():
        df_task = df[(df['Task'] == task) & (df['Vehicle'] == vehicle)]
        plt.barh(task, df_task['Diff'], left=df_task['Start'], color=color_dict[vehicle], edgecolor='black')

plt.xlabel('Time')
plt.ylabel('Task')
plt.title('Gantt Chart of Vehicle Tasks')
plt.grid(True)

# Create a custom legend to label vehicles
handles = [plt.Rectangle((0,0),1,1, color=color_dict[label]) for label in df['Vehicle'].unique()]
labels = [f'Plan for {label}' for label in df['Vehicle'].unique()]
plt.legend(handles, labels)

plt.show()
