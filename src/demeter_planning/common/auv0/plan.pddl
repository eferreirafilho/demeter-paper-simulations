Number of literals: 16
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000, admissible cost estimate 0.000
b (10.000 | 375.035)b (9.000 | 375.035)b (8.000 | 375.035)b (7.000 | 375.035)b (6.000 | 375.035)b (5.000 | 375.035)b (4.000 | 390.610)b (2.000 | 545.618)b (1.000 | 547.618)(G)
; No metric specified - using makespan

; Plan found with metric 547.619
; States evaluated so far: 193
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.28
0.000: (move vehicle0 wp_init_auv0 waypoint27)  [12.323]
12.324: (harvest-energy vehicle0)  [10.000]
22.325: (harvest-energy vehicle0)  [10.000]
32.326: (move vehicle0 waypoint27 waypoint22)  [44.246]
76.573: (harvest-energy vehicle0)  [10.000]
86.574: (harvest-energy vehicle0)  [10.000]
96.575: (harvest-energy vehicle0)  [10.000]
106.576: (harvest-energy vehicle0)  [10.000]
116.577: (harvest-energy vehicle0)  [10.000]
126.578: (harvest-energy vehicle0)  [10.000]
136.579: (move vehicle0 waypoint22 waypoint20)  [40.107]
176.687: (harvest-energy vehicle0)  [10.000]
186.688: (harvest-energy vehicle0)  [10.000]
196.689: (harvest-energy vehicle0)  [10.000]
206.690: (harvest-energy vehicle0)  [10.000]
216.691: (harvest-energy vehicle0)  [10.000]
226.692: (move vehicle0 waypoint20 waypoint19)  [11.046]
237.739: (harvest-energy vehicle0)  [10.000]
247.740: (harvest-energy vehicle0)  [10.000]
257.741: (move vehicle0 waypoint19 waypoint42)  [47.861]
305.603: (harvest-energy vehicle0)  [10.000]
315.604: (harvest-energy vehicle0)  [10.000]
325.605: (harvest-energy vehicle0)  [10.000]
335.606: (harvest-energy vehicle0)  [10.000]
345.607: (harvest-energy vehicle0)  [10.000]
355.608: (harvest-energy vehicle0)  [10.000]
365.609: (localize-cable vehicle0 waypoint42 turbine8)  [15.000]
380.610: (harvest-energy vehicle0)  [10.000]
390.611: (retrieve-data vehicle0 data8 waypoint42 currenttide currentwaves turbine8)  [55.000]
445.612: (surface vehicle0)  [40.000]
485.613: (harvest-energy vehicle0)  [10.000]
495.614: (harvest-energy vehicle0)  [10.000]
505.615: (harvest-energy vehicle0)  [10.000]
515.616: (harvest-energy vehicle0)  [10.000]
525.617: (harvest-energy vehicle0)  [10.000]
535.618: (harvest-energy vehicle0)  [10.000]
545.619: (upload-data-histograms vehicle0 data8)  [2.000]

 * All goal deadlines now no later than 547.619

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (10.000 | 375.035)b (9.000 | 375.035)b (8.000 | 375.035)b (7.000 | 375.035)b (6.000 | 375.035)b (5.000 | 375.035)b (4.000 | 390.610)