Number of literals: 10
Constructing lookup tables:
Post filtering unreachable actions: 
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000
b (9.000 | 13400.000)b (8.000 | 13400.000)b (7.000 | 331600.001)b (6.000 | 331600.001)b (4.000 | 331605.002)b (2.000 | 331805.003);;;; Solution Found
; States evaluated: 11
; Cost: 331807.004
; Time 0.00
0.000: (move vehicle0 wp_init_auv0 waypoint16)  [13400.000]
13400.001: (move vehicle0 waypoint16 waypoint11)  [318200.000]
331600.002: (localize-cable vehicle0 waypoint11 turbine2)  [5.000]
331605.003: (submerge-mission vehicle0 data2 waypoint11 currenttide turbine2)  [200.000]
331805.004: (transmit-data vehicle0 data2)  [2.000]
