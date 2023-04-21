Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle1) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle1) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle1) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 111.500)b (8.000 | 111.500)b (7.000 | 1243.001)b (6.000 | 1243.001)b (5.000 | 1248.002)b (4.000 | 1253.003)b (2.000 | 1467.501)(G)
; No metric specified - using makespan

; Plan found with metric 1469.502
; States evaluated so far: 18
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [111.500]
111.501: (move vehicle1 waypoint32 waypoint27)  [1131.500]
1243.002: (localize-cable vehicle1 waypoint27 turbine5)  [5.000]
1248.003: (surface vehicle1)  [5.000]
1253.004: (inspect-turbine vehicle1 data5 waypoint27 currenttide turbine5)  [200.000]
1453.005: (surface vehicle1)  [5.000]
1458.006: (harvest-energy vehicle1)  [9.495]
1467.502: (upload-data-histograms vehicle1 data5)  [2.000]

 * All goal deadlines now no later than 1469.502

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 111.500)b (8.000 | 111.500)b (7.000 | 1243.001)b (6.000 | 1243.001)b (5.000 | 1248.002)b (4.000 | 1253.003)b (2.000 | 1462.000)(G)
; No metric specified - using makespan

; Plan found with metric 1464.001
; States evaluated so far: 51
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.05
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [111.500]
111.501: (move vehicle1 waypoint32 waypoint27)  [1131.500]
1243.002: (localize-cable vehicle1 waypoint27 turbine5)  [5.000]
1248.003: (inspect-turbine vehicle1 data5 waypoint27 currenttide turbine5)  [200.000]
1448.004: (surface vehicle1)  [5.000]
1453.005: (harvest-energy vehicle1)  [8.995]
1462.001: (upload-data-histograms vehicle1 data5)  [2.000]

 * All goal deadlines now no later than 1464.001
b (0.000 | 1464.001)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 69
; Cost: 1464.001
; Time 0.06
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [111.500]
111.501: (move vehicle1 waypoint32 waypoint27)  [1131.500]
1243.002: (localize-cable vehicle1 waypoint27 turbine5)  [5.000]
1248.003: (inspect-turbine vehicle1 data5 waypoint27 currenttide turbine5)  [200.000]
1448.004: (surface vehicle1)  [5.000]
1453.005: (harvest-energy vehicle1)  [8.995]
1462.001: (upload-data-histograms vehicle1 data5)  [2.000]
