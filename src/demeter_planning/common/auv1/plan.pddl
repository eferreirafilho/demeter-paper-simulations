Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (7.000 | 10.000)b (6.000 | 40.202)b (5.000 | 204.152)b (4.000 | 229.154)b (3.000 | 774.217)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 10.000)b (6.000 | 40.202)b (5.000 | 204.152)b (4.000 | 229.154)b (2.000 | 513.747)b (1.000 | 515.747)(G)
; No metric specified - using makespan

; Plan found with metric 515.748
; States evaluated so far: 3042
; States pruned based on pre-heuristic cost lower bound: 0
; Time 2.92
0.000: (harvest-energy vehicle1)  [10.000]
10.001: (move vehicle1 wp_init_auv1 waypoint29)  [20.200]
30.202: (harvest-energy vehicle1)  [10.000]
40.203: (move vehicle1 waypoint29 waypoint62)  [93.942]
134.146: (harvest-energy vehicle1)  [10.000]
144.147: (harvest-energy vehicle1)  [10.000]
154.148: (harvest-energy vehicle1)  [10.000]
164.149: (harvest-energy vehicle1)  [10.000]
174.150: (harvest-energy vehicle1)  [10.000]
184.151: (harvest-energy vehicle1)  [10.000]
194.152: (harvest-energy vehicle1)  [10.000]
204.153: (localize-cable vehicle1 waypoint62 turbine12)  [15.000]
348.739: (harvest-energy vehicle1)  [10.000]
358.740: (retrieve-data vehicle1 data12 waypoint62 currenttide turbine12)  [55.000]
413.741: (surface vehicle1)  [40.000]
453.742: (harvest-energy vehicle1)  [10.000]
463.743: (harvest-energy vehicle1)  [10.000]
473.744: (harvest-energy vehicle1)  [10.000]
483.745: (harvest-energy vehicle1)  [10.000]
493.746: (harvest-energy vehicle1)  [10.000]
503.747: (harvest-energy vehicle1)  [10.000]
513.748: (upload-data-histograms vehicle1 data12)  [2.000]

 * All goal deadlines now no later than 515.748
b (0.000 | 515.748)(G)(G)(G)