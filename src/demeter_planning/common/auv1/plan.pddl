Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000
b (11.000 | 68500.000)b (10.000 | 68500.000)b (9.000 | 127700.001)b (8.000 | 127700.001)b (7.000 | 316500.002)b (6.000 | 316500.002)b (4.000 | 316505.003)b (2.000 | 316705.004);;;; Solution Found
; States evaluated: 13
; Cost: 316707.005
; Time 0.01
0.000: (move vehicle1 wp_init_auv1 waypoint29)  [68500.000]
68500.001: (move vehicle1 waypoint29 waypoint26)  [59200.000]
127700.002: (move vehicle1 waypoint26 waypoint22)  [188800.000]
316500.003: (localize-cable vehicle1 waypoint22 turbine5)  [5.000]
316505.004: (submerge-mission vehicle1 data5 waypoint22 currenttide turbine5)  [200.000]
316705.005: (transmit-data vehicle1 data5)  [2.000]
