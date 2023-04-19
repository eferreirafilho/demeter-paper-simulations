Number of literals: 10
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle2) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle2) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle2) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 64.000)b (6.000 | 64.000)b (5.000 | 69.001)b (4.000 | 74.002)b (2.000 | 288.500)(G)
; No metric specified - using makespan

; Plan found with metric 290.501
; States evaluated so far: 16
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle2 wp_init_auv2 waypoint7)  [64.000]
64.001: (localize-cable vehicle2 waypoint7 turbine1)  [5.000]
69.002: (surface vehicle2)  [5.000]
74.003: (inspect-turbine vehicle2 data1 waypoint7 currenttide turbine1)  [200.000]
274.004: (surface vehicle2)  [5.000]
279.005: (harvest-energy vehicle2)  [9.495]
288.501: (upload-data-histograms vehicle2 data1)  [2.000]

 * All goal deadlines now no later than 290.501

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 64.000)b (6.000 | 64.000)b (5.000 | 69.001)b (4.000 | 74.002)b (2.000 | 282.999)(G)
; No metric specified - using makespan

; Plan found with metric 285.000
; States evaluated so far: 47
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.04
0.000: (move vehicle2 wp_init_auv2 waypoint7)  [64.000]
64.001: (localize-cable vehicle2 waypoint7 turbine1)  [5.000]
69.002: (inspect-turbine vehicle2 data1 waypoint7 currenttide turbine1)  [200.000]
269.003: (surface vehicle2)  [5.000]
274.004: (harvest-energy vehicle2)  [8.995]
283.000: (upload-data-histograms vehicle2 data1)  [2.000]

 * All goal deadlines now no later than 285.000
b (0.000 | 285.000)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 65
; Cost: 285.000
; Time 0.06
0.000: (move vehicle2 wp_init_auv2 waypoint7)  [64.000]
64.001: (localize-cable vehicle2 waypoint7 turbine1)  [5.000]
69.002: (inspect-turbine vehicle2 data1 waypoint7 currenttide turbine1)  [200.000]
269.003: (surface vehicle2)  [5.000]
274.004: (harvest-energy vehicle2)  [8.995]
283.000: (upload-data-histograms vehicle2 data1)  [2.000]
