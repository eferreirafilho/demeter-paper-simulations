Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000
b (11.000 | 13900.000)b (10.000 | 13900.000)b (9.000 | 302100.001)b (8.000 | 302100.001)b (7.000 | 366700.002)b (6.000 | 366700.002)b (4.000 | 366705.003)b (2.000 | 366905.004);;;; Solution Found
; States evaluated: 13
; Cost: 366907.005
; Time 0.01
0.000: (move vehicle1 wp_init_auv1 waypoint21)  [13900.000]
13900.001: (move vehicle1 waypoint21 waypoint7)  [288200.000]
302100.002: (move vehicle1 waypoint7 waypoint6)  [64600.000]
366700.003: (localize-cable vehicle1 waypoint6 turbine1)  [5.000]
366705.004: (submerge-mission vehicle1 data1 waypoint6 currenttide turbine1)  [200.000]
366905.005: (transmit-data vehicle1 data1)  [2.000]
