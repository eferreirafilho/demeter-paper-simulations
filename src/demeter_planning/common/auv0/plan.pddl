Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 42.202)b (5.000 | 184.380)b (4.000 | 209.382)b (3.000 | 754.444)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 42.202)b (5.000 | 184.380)b (4.000 | 209.382)b (2.000 | 513.677)b (1.000 | 515.678)(G)
; No metric specified - using makespan

; Plan found with metric 515.678
; States evaluated so far: 2896
; States pruned based on pre-heuristic cost lower bound: 0
; Time 2.38
0.000: (move vehicle0 wp_init_auv0 waypoint27)  [22.200]
22.201: (harvest-energy vehicle0)  [10.000]
32.202: (harvest-energy vehicle0)  [10.000]
42.203: (move vehicle0 waypoint27 waypoint22)  [82.171]
124.375: (harvest-energy vehicle0)  [10.000]
134.376: (harvest-energy vehicle0)  [10.000]
144.377: (harvest-energy vehicle0)  [10.000]
154.378: (harvest-energy vehicle0)  [10.000]
164.379: (harvest-energy vehicle0)  [10.000]
174.380: (harvest-energy vehicle0)  [10.000]
184.381: (localize-cable vehicle0 waypoint22 turbine4)  [15.000]
348.669: (harvest-energy vehicle0)  [10.000]
358.670: (retrieve-data vehicle0 data4 waypoint22 currenttide turbine4)  [55.000]
413.671: (surface vehicle0)  [40.000]
453.672: (harvest-energy vehicle0)  [10.000]
463.673: (harvest-energy vehicle0)  [10.000]
473.674: (harvest-energy vehicle0)  [10.000]
483.675: (harvest-energy vehicle0)  [10.000]
493.676: (harvest-energy vehicle0)  [10.000]
503.677: (harvest-energy vehicle0)  [10.000]
513.678: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 515.678
b (0.000 | 515.678)