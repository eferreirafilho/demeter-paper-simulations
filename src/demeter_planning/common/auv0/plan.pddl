Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
37% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000, admissible cost estimate 0.000
b (9.000 | 1.000)b (8.000 | 90.775)b (7.000 | 121.262)b (6.000 | 218.608)b (4.000 | 269.611)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 1.000)b (8.000 | 90.775)b (7.000 | 121.262)b (6.000 | 218.608)b (4.000 | 269.611)b (2.000 | 456.179)b (1.000 | 458.179)(G)
; No metric specified - using makespan

; Plan found with metric 458.180
; States evaluated so far: 4444
; States pruned based on pre-heuristic cost lower bound: 0
; Time 5.46
0.000: (harvest-energy vehicle0)  [1.000]
1.001: (move vehicle0 wp_init_auv0 waypoint2)  [86.771]
87.773: (harvest-energy vehicle0)  [1.000]
88.774: (harvest-energy vehicle0)  [1.000]
89.775: (harvest-energy vehicle0)  [1.000]
90.776: (move vehicle0 waypoint2 waypoint3)  [29.485]
120.262: (harvest-energy vehicle0)  [1.000]
121.263: (move vehicle0 waypoint3 waypoint14)  [94.342]
215.606: (harvest-energy vehicle0)  [1.000]
216.607: (harvest-energy vehicle0)  [1.000]
217.608: (harvest-energy vehicle0)  [1.000]
218.609: (localize-cable vehicle0 waypoint14 turbine3)  [10.000]
228.610: (surface vehicle0)  [40.000]
357.174: (harvest-energy vehicle0)  [1.000]
358.175: (retrieve-data vehicle0 data3 waypoint14 currenttide turbine3)  [55.000]
413.176: (surface vehicle0)  [40.000]
453.177: (harvest-energy vehicle0)  [1.000]
454.178: (harvest-energy vehicle0)  [1.000]
455.179: (harvest-energy vehicle0)  [1.000]
456.180: (upload-data-histograms vehicle0 data3)  [2.000]

 * All goal deadlines now no later than 458.180
b (0.000 | 458.180)(G)