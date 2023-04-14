Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle2) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (wait-to-recharge vehicle2) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle2) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 56.000)b (8.000 | 56.000)b (7.000 | 1135.501)b (6.000 | 1135.501)b (5.000 | 1140.502)b (4.000 | 1145.503)b (2.000 | 1360.001)(G)
; No metric specified - using makespan

; Plan found with metric 1362.002
; States evaluated so far: 18
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle2 wp_init_auv2 waypoint22)  [56.000]
56.001: (move vehicle2 waypoint22 waypoint27)  [1079.500]
1135.502: (localize-cable vehicle2 waypoint27 turbine5)  [5.000]
1140.503: (surface vehicle2)  [5.000]
1145.504: (submerge-mission vehicle2 data5 waypoint27 currenttide turbine5)  [200.000]
1345.505: (surface vehicle2)  [5.000]
1350.506: (wait-to-recharge vehicle2)  [9.495]
1360.002: (transmit-data vehicle2 data5)  [2.000]

 * All goal deadlines now no later than 1362.002

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 56.000)b (8.000 | 56.000)b (7.000 | 1135.501)b (6.000 | 1135.501)b (5.000 | 1140.502)b (4.000 | 1145.503)b (2.000 | 1354.500)(G)
; No metric specified - using makespan

; Plan found with metric 1356.501
; States evaluated so far: 51
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.04
0.000: (move vehicle2 wp_init_auv2 waypoint22)  [56.000]
56.001: (move vehicle2 waypoint22 waypoint27)  [1079.500]
1135.502: (localize-cable vehicle2 waypoint27 turbine5)  [5.000]
1140.503: (submerge-mission vehicle2 data5 waypoint27 currenttide turbine5)  [200.000]
1340.504: (surface vehicle2)  [5.000]
1345.505: (wait-to-recharge vehicle2)  [8.995]
1354.501: (transmit-data vehicle2 data5)  [2.000]

 * All goal deadlines now no later than 1356.501
b (0.000 | 1356.501)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 69
; Cost: 1356.501
; Time 0.06
0.000: (move vehicle2 wp_init_auv2 waypoint22)  [56.000]
56.001: (move vehicle2 waypoint22 waypoint27)  [1079.500]
1135.502: (localize-cable vehicle2 waypoint27 turbine5)  [5.000]
1140.503: (submerge-mission vehicle2 data5 waypoint27 currenttide turbine5)  [200.000]
1340.504: (surface vehicle2)  [5.000]
1345.505: (wait-to-recharge vehicle2)  [8.995]
1354.501: (transmit-data vehicle2 data5)  [2.000]
