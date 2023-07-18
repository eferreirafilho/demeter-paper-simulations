Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 41.859)b (5.000 | 191.808)b (4.000 | 216.810)b (3.000 | 761.873)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 41.859)b (5.000 | 191.808)b (4.000 | 216.810)b (2.000 | 513.597)b (1.000 | 515.597)(G)
; No metric specified - using makespan

; Plan found with metric 515.598
; States evaluated so far: 2896
; States pruned based on pre-heuristic cost lower bound: 0
; Time 2.50
0.000: (move vehicle1 wp_init_auv1 waypoint37)  [21.857]
21.858: (harvest-energy vehicle1)  [10.000]
31.859: (harvest-energy vehicle1)  [10.000]
41.860: (move vehicle1 waypoint37 waypoint42)  [89.942]
131.803: (harvest-energy vehicle1)  [10.000]
141.804: (harvest-energy vehicle1)  [10.000]
151.805: (harvest-energy vehicle1)  [10.000]
161.806: (harvest-energy vehicle1)  [10.000]
171.807: (harvest-energy vehicle1)  [10.000]
181.808: (harvest-energy vehicle1)  [10.000]
191.809: (localize-cable vehicle1 waypoint42 turbine8)  [15.000]
348.589: (harvest-energy vehicle1)  [10.000]
358.590: (retrieve-data vehicle1 data8 waypoint42 currenttide turbine8)  [55.000]
413.591: (surface vehicle1)  [40.000]
453.592: (harvest-energy vehicle1)  [10.000]
463.593: (harvest-energy vehicle1)  [10.000]
473.594: (harvest-energy vehicle1)  [10.000]
483.595: (harvest-energy vehicle1)  [10.000]
493.596: (harvest-energy vehicle1)  [10.000]
503.597: (harvest-energy vehicle1)  [10.000]
513.598: (upload-data-histograms vehicle1 data8)  [2.000]

 * All goal deadlines now no later than 515.598
b (0.000 | 515.598)(G)(G)(G)