Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000
b (11.000 | 12100.000)b (10.000 | 12100.000)b (9.000 | 300300.001)b (8.000 | 300300.001)b (7.000 | 364900.002)b (6.000 | 364900.002)b (4.000 | 364905.003)b (2.000 | 365105.004);;;; Solution Found
; States evaluated: 13
; Cost: 365107.005
; Time 0.00
0.000: (move vehicle1 wp_init_auv1 waypoint21)  [12100.000]
12100.001: (move vehicle1 waypoint21 waypoint7)  [288200.000]
300300.002: (move vehicle1 waypoint7 waypoint6)  [64600.000]
364900.003: (localize-cable vehicle1 waypoint6 turbine1)  [5.000]
364905.004: (submerge-mission vehicle1 data1 waypoint6 currenttide turbine1)  [200.000]
365105.005: (transmit-data vehicle1 data1)  [2.000]
