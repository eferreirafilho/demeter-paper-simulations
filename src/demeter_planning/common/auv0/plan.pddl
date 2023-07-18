Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 44.173)b (6.000 | 112.662)b (5.000 | 255.069)b (4.000 | 280.071)b (3.000 | 825.130)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 44.173)b (6.000 | 112.662)b (5.000 | 255.069)b (4.000 | 280.071)b (2.000 | 513.512)b (1.000 | 515.513)(G)
; No metric specified - using makespan

; Plan found with metric 515.513
; States evaluated so far: 3730
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.42
0.000: (move vehicle0 wp_init_auv0 waypoint27)  [24.171]
24.172: (harvest-energy vehicle0)  [10.000]
34.173: (harvest-energy vehicle0)  [10.000]
44.174: (move vehicle0 waypoint27 waypoint28)  [38.485]
82.660: (harvest-energy vehicle0)  [10.000]
92.661: (harvest-energy vehicle0)  [10.000]
102.662: (harvest-energy vehicle0)  [10.000]
112.664: (move vehicle0 waypoint28 waypoint57)  [82.399]
195.064: (harvest-energy vehicle0)  [10.000]
205.065: (harvest-energy vehicle0)  [10.000]
215.066: (harvest-energy vehicle0)  [10.000]
225.067: (harvest-energy vehicle0)  [10.000]
235.068: (harvest-energy vehicle0)  [10.000]
245.069: (harvest-energy vehicle0)  [10.000]
255.070: (localize-cable vehicle0 waypoint57 turbine11)  [15.000]
348.504: (harvest-energy vehicle0)  [10.000]
358.505: (retrieve-data vehicle0 data11 waypoint57 currenttide turbine11)  [55.000]
413.506: (surface vehicle0)  [40.000]
453.507: (harvest-energy vehicle0)  [10.000]
463.508: (harvest-energy vehicle0)  [10.000]
473.509: (harvest-energy vehicle0)  [10.000]
483.510: (harvest-energy vehicle0)  [10.000]
493.511: (harvest-energy vehicle0)  [10.000]
503.512: (harvest-energy vehicle0)  [10.000]
513.513: (upload-data-histograms vehicle0 data11)  [2.000]

 * All goal deadlines now no later than 515.513
b (0.000 | 515.513)