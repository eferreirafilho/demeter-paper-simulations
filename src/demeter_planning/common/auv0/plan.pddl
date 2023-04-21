Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle0) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 91.500)b (8.000 | 91.500)b (7.000 | 1264.001)b (6.000 | 1264.001)b (5.000 | 1269.002)b (4.000 | 1274.003)b (2.000 | 1488.501)(G)
; No metric specified - using makespan

; Plan found with metric 1490.502
; States evaluated so far: 18
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle0 wp_init_auv0 waypoint7)  [91.500]
91.501: (move vehicle0 waypoint7 waypoint2)  [1172.500]
1264.002: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
1269.003: (surface vehicle0)  [5.000]
1274.004: (inspect-turbine vehicle0 data0 waypoint2 currenttide turbine0)  [200.000]
1474.005: (surface vehicle0)  [5.000]
1479.006: (harvest-energy vehicle0)  [9.495]
1488.502: (upload-data-histograms vehicle0 data0)  [2.000]

 * All goal deadlines now no later than 1490.502

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 91.500)b (8.000 | 91.500)b (7.000 | 1264.001)b (6.000 | 1264.001)b (5.000 | 1269.002)b (4.000 | 1274.003)b (2.000 | 1483.000)(G)
; No metric specified - using makespan

; Plan found with metric 1485.001
; States evaluated so far: 51
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.05
0.000: (move vehicle0 wp_init_auv0 waypoint7)  [91.500]
91.501: (move vehicle0 waypoint7 waypoint2)  [1172.500]
1264.002: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
1269.003: (inspect-turbine vehicle0 data0 waypoint2 currenttide turbine0)  [200.000]
1469.004: (surface vehicle0)  [5.000]
1474.005: (harvest-energy vehicle0)  [8.995]
1483.001: (upload-data-histograms vehicle0 data0)  [2.000]

 * All goal deadlines now no later than 1485.001
b (0.000 | 1485.001)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 69
; Cost: 1485.001
; Time 0.07
0.000: (move vehicle0 wp_init_auv0 waypoint7)  [91.500]
91.501: (move vehicle0 waypoint7 waypoint2)  [1172.500]
1264.002: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
1269.003: (inspect-turbine vehicle0 data0 waypoint2 currenttide turbine0)  [200.000]
1469.004: (surface vehicle0)  [5.000]
1474.005: (harvest-energy vehicle0)  [8.995]
1483.001: (upload-data-histograms vehicle0 data0)  [2.000]
