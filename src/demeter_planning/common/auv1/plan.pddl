Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 40.202)b (6.000 | 230.011)b (5.000 | 288.499)b (4.000 | 313.501)b (3.000 | 858.560)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 40.202)b (6.000 | 230.011)b (5.000 | 288.499)b (4.000 | 313.501)b (2.000 | 513.667)b (1.000 | 515.668)(G)
; No metric specified - using makespan

; Plan found with metric 515.668
; States evaluated so far: 4079
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.73
0.000: (move vehicle1 wp_init_auv1 waypoint29)  [20.200]
20.201: (harvest-energy vehicle1)  [10.000]
30.202: (harvest-energy vehicle1)  [10.000]
40.204: (move vehicle1 waypoint29 waypoint26)  [109.799]
150.004: (harvest-energy vehicle1)  [10.000]
160.005: (harvest-energy vehicle1)  [10.000]
170.006: (harvest-energy vehicle1)  [10.000]
180.007: (harvest-energy vehicle1)  [10.000]
190.008: (harvest-energy vehicle1)  [10.000]
200.009: (harvest-energy vehicle1)  [10.000]
210.010: (harvest-energy vehicle1)  [10.000]
220.011: (harvest-energy vehicle1)  [10.000]
230.012: (move vehicle1 waypoint26 waypoint22)  [38.485]
268.498: (harvest-energy vehicle1)  [10.000]
278.499: (harvest-energy vehicle1)  [10.000]
288.500: (localize-cable vehicle1 waypoint22 turbine4)  [15.000]
348.659: (harvest-energy vehicle1)  [10.000]
358.660: (retrieve-data vehicle1 data4 waypoint22 currenttide turbine4)  [55.000]
413.661: (surface vehicle1)  [40.000]
453.662: (harvest-energy vehicle1)  [10.000]
463.663: (harvest-energy vehicle1)  [10.000]
473.664: (harvest-energy vehicle1)  [10.000]
483.665: (harvest-energy vehicle1)  [10.000]
493.666: (harvest-energy vehicle1)  [10.000]
503.667: (harvest-energy vehicle1)  [10.000]
513.668: (upload-data-histograms vehicle1 data4)  [2.000]

 * All goal deadlines now no later than 515.668
b (0.000 | 515.668)