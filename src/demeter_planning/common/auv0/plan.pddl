Number of literals: 13
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000
b (11.000 | 150800.000)b (10.000 | 150800.000)b (9.000 | 582400.001)b (8.000 | 582400.001)b (7.000 | 647000.002)b (6.000 | 647000.002)b (4.000 | 647005.003)b (2.000 | 647205.004);;;; Solution Found
; States evaluated: 13
; Cost: 0.000
; Time 0.04
0.000: (move vehicle0 wp_init_auv0 waypoint21)  [150800.000]
150800.001: (move vehicle0 waypoint21 waypoint5)  [431600.000]
582400.002: (move vehicle0 waypoint5 waypoint1)  [64600.000]
647000.003: (localize-cable vehicle0 waypoint1 turbine0)  [5.000]
647005.004: (submerge-mission vehicle0 data0 waypoint1 currenttide turbine0)  [200.000]
647205.005: (transmit-data vehicle0 data0 waypoint0)  [20.000]
