Number of literals: 13
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000
b (9.000 | 36.000)b (8.000 | 36.000)b (7.000 | 100.601)b (6.000 | 100.601)b (4.000 | 105.602)b (2.000 | 313.148);;;; Solution Found
; States evaluated: 13
; Cost: 0.000
; Time 0.03
0.000: (move vehicle1 wp_init_auv1 waypoint27)  [36.000]
36.001: (move vehicle1 waypoint27 waypoint26)  [64.600]
100.602: (localize-cable vehicle1 waypoint26 turbine5)  [5.000]
105.603: (submerge-mission vehicle1 data5 waypoint26 currenttide turbine5)  [200.000]
305.603: (wait-to-recharge vehicle1)  [7.545]
313.149: (transmit-data vehicle1 data5 waypoint0)  [20.000]
