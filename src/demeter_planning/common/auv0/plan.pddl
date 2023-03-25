Number of literals: 16
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 18.000
b (17.000 | 60.000)b (16.000 | 60.000)b (14.000 | 65.001)b (12.000 | 66.002)b (11.000 | 59036.002)b (10.000 | 59036.002)b (9.000 | 126256.003)b (8.000 | 126256.003)b (7.000 | 126261.005)b (5.000 | 126261.005)b (4.000 | 126261.005)b (2.000 | 126262.006);;;; Solution Found
; States evaluated: 25
; Cost: 0.000
; Time 0.13
0.000: (move vehicle0 wp_init_auv0 waypoint30)  [60.000]
60.001: (localize-cable vehicle0 waypoint30 turbine3)  [5.000]
65.002: (submerge-mission vehicle0 data3 waypoint30 currenttide turbine3)  [1.000]
66.002: (move vehicle0 waypoint30 waypoint10)  [58970.000]
59036.003: (move vehicle0 waypoint10 waypoint29)  [67220.000]
126256.004: (transmit-data vehicle0 data3 waypoint0 turbine2)  [0.100]
126256.005: (localize-cable vehicle0 waypoint29 turbine2)  [5.000]
126261.006: (submerge-mission vehicle0 data2 waypoint29 currenttide turbine2)  [1.000]
126262.007: (transmit-data vehicle0 data2 waypoint0 turbine2)  [0.100]
