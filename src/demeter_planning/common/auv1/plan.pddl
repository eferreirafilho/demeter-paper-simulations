Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 37.744)b (5.000 | 185.779)b (4.000 | 210.781)b (3.000 | 755.843)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 37.744)b (5.000 | 185.779)b (4.000 | 210.781)b (2.000 | 513.632)b (1.000 | 515.632)(G)
; No metric specified - using makespan

; Plan found with metric 515.633
; States evaluated so far: 2896
; States pruned based on pre-heuristic cost lower bound: 0
; Time 2.46
0.000: (move vehicle1 wp_init_auv1 waypoint57)  [17.742]
17.743: (harvest-energy vehicle1)  [10.000]
27.744: (harvest-energy vehicle1)  [10.000]
37.745: (move vehicle1 waypoint57 waypoint62)  [88.028]
125.774: (harvest-energy vehicle1)  [10.000]
135.775: (harvest-energy vehicle1)  [10.000]
145.776: (harvest-energy vehicle1)  [10.000]
155.777: (harvest-energy vehicle1)  [10.000]
165.778: (harvest-energy vehicle1)  [10.000]
175.779: (harvest-energy vehicle1)  [10.000]
185.780: (localize-cable vehicle1 waypoint62 turbine12)  [15.000]
348.624: (harvest-energy vehicle1)  [10.000]
358.625: (retrieve-data vehicle1 data12 waypoint62 currenttide turbine12)  [55.000]
413.626: (surface vehicle1)  [40.000]
453.627: (harvest-energy vehicle1)  [10.000]
463.628: (harvest-energy vehicle1)  [10.000]
473.629: (harvest-energy vehicle1)  [10.000]
483.630: (harvest-energy vehicle1)  [10.000]
493.631: (harvest-energy vehicle1)  [10.000]
503.632: (harvest-energy vehicle1)  [10.000]
513.633: (upload-data-histograms vehicle1 data12)  [2.000]

 * All goal deadlines now no later than 515.633
b (0.000 | 515.633)(G)(G)(G)