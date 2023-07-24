Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 20.000, admissible cost estimate 0.000
b (18.000 | 10.000)b (16.000 | 20.001)b (14.000 | 30.002)b (12.000 | 40.003)b (10.000 | 50.004)b (8.000 | 60.005)b (7.000 | 88.321)b (6.000 | 128.838)b (5.000 | 253.329)b (4.000 | 278.331)b (3.000 | 823.391)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (18.000 | 10.000)b (16.000 | 20.001)b (14.000 | 30.002)b (12.000 | 40.003)b (10.000 | 50.004)b (8.000 | 60.005)b (7.000 | 88.321)b (6.000 | 128.838)b (5.000 | 253.329)b (4.000 | 278.331)b (2.000 | 512.577)b (1.000 | 514.578)(G)
; No metric specified - using makespan

; Plan found with metric 514.578
; States evaluated so far: 5920
; States pruned based on pre-heuristic cost lower bound: 0
; Time 5.35
0.000: (harvest-energy vehicle0)  [10.000]
10.001: (harvest-energy vehicle0)  [10.000]
20.002: (harvest-energy vehicle0)  [10.000]
30.003: (harvest-energy vehicle0)  [10.000]
40.004: (harvest-energy vehicle0)  [10.000]
50.005: (harvest-energy vehicle0)  [10.000]
60.006: (move vehicle0 wp_init_auv0 waypoint19)  [18.314]
78.321: (harvest-energy vehicle0)  [10.000]
88.322: (move vehicle0 waypoint19 waypoint20)  [20.514]
108.837: (harvest-energy vehicle0)  [10.000]
118.838: (harvest-energy vehicle0)  [10.000]
128.839: (move vehicle0 waypoint20 waypoint22)  [74.485]
203.325: (harvest-energy vehicle0)  [10.000]
213.326: (harvest-energy vehicle0)  [10.000]
223.327: (harvest-energy vehicle0)  [10.000]
233.328: (harvest-energy vehicle0)  [10.000]
243.329: (harvest-energy vehicle0)  [10.000]
253.330: (localize-cable vehicle0 waypoint22 turbine4)  [15.000]
347.569: (harvest-energy vehicle0)  [10.000]
357.570: (retrieve-data vehicle0 data4 waypoint22 currenttide turbine4)  [55.000]
412.571: (surface vehicle0)  [40.000]
452.572: (harvest-energy vehicle0)  [10.000]
462.573: (harvest-energy vehicle0)  [10.000]
472.574: (harvest-energy vehicle0)  [10.000]
482.575: (harvest-energy vehicle0)  [10.000]
492.576: (harvest-energy vehicle0)  [10.000]
502.577: (harvest-energy vehicle0)  [10.000]
512.578: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 514.578
b (0.000 | 514.578)