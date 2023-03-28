Number of literals: 15
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 18.000
b (17.000 | 1.000)b (16.000 | 1.000)b (14.000 | 16.001)b (12.000 | 26.487)b (11.000 | 1929.488)b (10.000 | 1929.488)b (8.000 | 4772.489)b (6.000 | 4787.490)b (4.000 | 4813.957)b (2.000 | 4822.958);;;; Solution Found
; States evaluated: 92
; Cost: 0.000
; Time 0.20
0.000: (move vehicle1 wp_init_auv1 waypoint35)  [1.000]
1.001: (localize-cable vehicle1 waypoint35 turbine4)  [15.000]
16.002: (submerge-mission vehicle1 data4 waypoint35 currenttide turbine4)  [1.000]
17.002: (wait-to-recharge vehicle1)  [9.485]
26.488: (move vehicle1 waypoint35 waypoint8)  [1903.000]
1929.489: (move vehicle1 waypoint8 waypoint21)  [2843.000]
4772.490: (localize-cable vehicle1 waypoint21 turbine1)  [15.000]
4787.491: (transmit-data vehicle1 data4 waypoint0)  [20.000]
4807.492: (wait-to-recharge vehicle1)  [6.465]
4813.958: (submerge-mission vehicle1 data1 waypoint21 currenttide turbine1)  [1.000]
4814.958: (wait-to-recharge vehicle1)  [8.000]
4822.959: (transmit-data vehicle1 data1 waypoint0)  [20.000]
