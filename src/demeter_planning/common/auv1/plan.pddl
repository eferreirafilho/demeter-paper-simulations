Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 358.620)b (7.000 | 358.620)b (6.000 | 358.620)b (5.000 | 358.620)b (4.000 | 358.620)b (2.000 | 513.628)b (1.000 | 515.629)(G)
; No metric specified - using makespan

; Plan found with metric 515.629
; States evaluated so far: 76
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.10
0.000: (move vehicle1 wp_init_auv1 waypoint29)  [20.200]
20.201: (harvest-energy vehicle1)  [10.000]
30.202: (harvest-energy vehicle1)  [10.000]
40.203: (move vehicle1 waypoint29 waypoint30)  [20.514]
60.718: (harvest-energy vehicle1)  [10.000]
70.719: (move vehicle1 waypoint30 waypoint32)  [61.857]
132.577: (harvest-energy vehicle1)  [10.000]
142.578: (harvest-energy vehicle1)  [10.000]
152.579: (harvest-energy vehicle1)  [10.000]
162.580: (harvest-energy vehicle1)  [10.000]
172.581: (harvest-energy vehicle1)  [10.000]
182.582: (localize-cable vehicle1 waypoint32 turbine6)  [15.000]
348.620: (harvest-energy vehicle1)  [10.000]
358.621: (retrieve-data vehicle1 data6 waypoint32 currenttide turbine6)  [55.000]
413.622: (surface vehicle1)  [40.000]
453.623: (harvest-energy vehicle1)  [10.000]
463.624: (harvest-energy vehicle1)  [10.000]
473.625: (harvest-energy vehicle1)  [10.000]
483.626: (harvest-energy vehicle1)  [10.000]
493.627: (harvest-energy vehicle1)  [10.000]
503.628: (harvest-energy vehicle1)  [10.000]
513.629: (upload-data-histograms vehicle1 data6)  [2.000]

 * All goal deadlines now no later than 515.629

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 358.620)b (7.000 | 358.620)b (6.000 | 358.620)b (5.000 | 358.620)b (4.000 | 358.620)b (2.000 | 513.628)b (1.000 | 515.629)