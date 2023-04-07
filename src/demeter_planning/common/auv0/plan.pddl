Number of literals: 20
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 26.000
b (25.000 | 13000.000)b (24.000 | 13000.000)b (22.000 | 13005.001)b (20.000 | 13205.002)b (18.000 | 13225.003)b (16.000 | 331430.005)b (14.000 | 331630.006)b (13.000 | 649830.007)b (12.000 | 649830.007)b (11.000 | 1049230.008)b (10.000 | 1049230.008)b (9.000 | 1113830.009)b (8.000 | 1113830.009)b (7.000 | 1113850.011)b (5.000 | 1113850.011)b (4.000 | 1113850.011)b (2.000 | 1114050.012);;;; Solution Found
; States evaluated: 50
; Cost: 0.000
; Time 0.19
0.000: (move vehicle0 wp_init_auv0 waypoint11)  [13000.000]
13000.001: (localize-cable vehicle0 waypoint11 turbine2)  [5.000]
13005.002: (submerge-mission vehicle0 data2 waypoint11 currenttide turbine2)  [200.000]
13205.003: (transmit-data vehicle0 data2 waypoint0)  [20.000]
13225.004: (move vehicle0 waypoint11 waypoint16)  [318200.000]
331425.005: (localize-cable vehicle0 waypoint16 turbine3)  [5.000]
331430.006: (submerge-mission vehicle0 data3 waypoint16 currenttide turbine3)  [200.000]
331630.007: (move vehicle0 waypoint16 waypoint11)  [318200.000]
649830.008: (move vehicle0 waypoint11 waypoint2)  [399400.000]
1049230.009: (move vehicle0 waypoint2 waypoint1)  [64600.000]
1113830.010: (localize-cable vehicle0 waypoint1 turbine0)  [5.000]
1113830.011: (transmit-data vehicle0 data3 waypoint0)  [20.000]
1113850.012: (submerge-mission vehicle0 data0 waypoint1 currenttide turbine0)  [200.000]
1114050.013: (transmit-data vehicle0 data0 waypoint0)  [20.000]
