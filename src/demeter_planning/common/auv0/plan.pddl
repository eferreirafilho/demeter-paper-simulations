Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000
b (11.000 | 12400.000)b (10.000 | 12400.000)b (9.000 | 77000.001)b (8.000 | 77000.001)b (7.000 | 354600.002)b (6.000 | 354600.002)b (4.000 | 354605.003)b (2.000 | 354805.004);;;; Solution Found
; States evaluated: 13
; Cost: 354807.005
; Time 0.01
0.000: (move vehicle0 wp_init_auv0 waypoint1)  [12400.000]
12400.001: (move vehicle0 waypoint1 waypoint2)  [64600.000]
77000.002: (move vehicle0 waypoint2 waypoint16)  [277600.000]
354600.003: (localize-cable vehicle0 waypoint16 turbine3)  [5.000]
354605.004: (submerge-mission vehicle0 data3 waypoint16 currenttide turbine3)  [200.000]
354805.005: (transmit-data vehicle0 data3)  [2.000]
