Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000
b (11.000 | 57100.000)b (10.000 | 57100.000)b (9.000 | 303800.001)b (8.000 | 303800.001)b (7.000 | 363000.002)b (6.000 | 363000.002)b (4.000 | 363005.003)b (2.000 | 363205.004);;;; Solution Found
; States evaluated: 13
; Cost: 363207.005
; Time 0.00
0.000: (move vehicle0 wp_init_auv0 waypoint21)  [57100.000]
57100.001: (move vehicle0 waypoint21 waypoint7)  [246700.000]
303800.002: (move vehicle0 waypoint7 waypoint6)  [59200.000]
363000.003: (localize-cable vehicle0 waypoint6 turbine1)  [5.000]
363005.004: (submerge-mission vehicle0 data1 waypoint6 currenttide turbine1)  [200.000]
363205.005: (transmit-data vehicle0 data1)  [2.000]
