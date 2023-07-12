Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 37.602)b (6.000 | 180.180)b (5.000 | 238.668)b (4.000 | 263.670)b (3.000 | 808.730)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 37.602)b (6.000 | 180.180)b (5.000 | 238.668)b (4.000 | 263.670)b (2.000 | 513.262)b (1.000 | 515.263)(G)
; No metric specified - using makespan

; Plan found with metric 515.263
; States evaluated so far: 4090
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.07
0.000: (move vehicle0 wp_init_auv0 waypoint72)  [17.599]
17.601: (harvest-energy vehicle0)  [10.000]
27.602: (harvest-energy vehicle0)  [10.000]
37.603: (move vehicle0 waypoint72 waypoint38)  [82.571]
120.175: (harvest-energy vehicle0)  [10.000]
130.176: (harvest-energy vehicle0)  [10.000]
140.177: (harvest-energy vehicle0)  [10.000]
150.178: (harvest-energy vehicle0)  [10.000]
160.179: (harvest-energy vehicle0)  [10.000]
170.180: (harvest-energy vehicle0)  [10.000]
180.181: (move vehicle0 waypoint38 waypoint37)  [38.485]
218.667: (harvest-energy vehicle0)  [10.000]
228.668: (harvest-energy vehicle0)  [10.000]
238.669: (localize-cable vehicle0 waypoint37 turbine7)  [15.000]
348.254: (harvest-energy vehicle0)  [10.000]
358.255: (retrieve-data vehicle0 data7 waypoint37 currenttide turbine7)  [55.000]
413.256: (surface vehicle0)  [40.000]
453.257: (harvest-energy vehicle0)  [10.000]
463.258: (harvest-energy vehicle0)  [10.000]
473.259: (harvest-energy vehicle0)  [10.000]
483.260: (harvest-energy vehicle0)  [10.000]
493.261: (harvest-energy vehicle0)  [10.000]
503.262: (harvest-energy vehicle0)  [10.000]
513.263: (upload-data-histograms vehicle0 data7)  [2.000]

 * All goal deadlines now no later than 515.263
b (0.000 | 515.263)