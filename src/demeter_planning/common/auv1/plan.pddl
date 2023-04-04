Number of literals: 18
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 24.000
b (23.000 | 285.000)b (22.000 | 285.000)b (21.000 | 965.001)b (20.000 | 965.001)b (19.000 | 1871.002)b (18.000 | 1871.002)b (16.000 | 1876.003)b (14.000 | 2076.004)b (13.000 | 5025.005)b (12.000 | 5025.005)b (11.000 | 8386.006)b (10.000 | 8386.006)b (9.000 | 9292.007)b (8.000 | 9292.007)b (7.000 | 9312.009)b (5.000 | 9312.009)b (4.000 | 9312.009)b (2.000 | 9512.010);;;; Solution Found
; States evaluated: 32
; Cost: 0.000
; Time 0.11
0.000: (move vehicle1 wp_init_auv1 waypoint33)  [285.000]
285.001: (move vehicle1 waypoint33 waypoint34)  [680.000]
965.002: (move vehicle1 waypoint34 waypoint30)  [906.000]
1871.003: (localize-cable vehicle1 waypoint30 turbine3)  [5.000]
1876.004: (submerge-mission vehicle1 data3 waypoint30 currenttide turbine3)  [200.000]
2076.005: (move vehicle1 waypoint30 waypoint10)  [2949.000]
5025.006: (move vehicle1 waypoint10 waypoint29)  [3361.000]
8386.007: (move vehicle1 waypoint29 waypoint25)  [906.000]
9292.008: (localize-cable vehicle1 waypoint25 turbine2)  [5.000]
9292.009: (transmit-data vehicle1 data3 waypoint0)  [20.000]
9312.010: (submerge-mission vehicle1 data2 waypoint25 currenttide turbine2)  [200.000]
9512.011: (transmit-data vehicle1 data2 waypoint0)  [20.000]
