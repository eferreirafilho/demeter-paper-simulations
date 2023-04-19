Number of literals: 10
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle1) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle1) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle1) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 60.500)b (6.000 | 60.500)b (5.000 | 65.501)b (4.000 | 70.502)b (2.000 | 285.000)(G)
; No metric specified - using makespan

; Plan found with metric 287.001
; States evaluated so far: 16
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [60.500]
60.501: (localize-cable vehicle1 waypoint32 turbine6)  [5.000]
65.502: (surface vehicle1)  [5.000]
70.503: (inspect-turbine vehicle1 data6 waypoint32 currenttide turbine6)  [200.000]
270.504: (surface vehicle1)  [5.000]
275.505: (harvest-energy vehicle1)  [9.495]
285.001: (upload-data-histograms vehicle1 data6)  [2.000]

 * All goal deadlines now no later than 287.001

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 60.500)b (6.000 | 60.500)b (5.000 | 65.501)b (4.000 | 70.502)b (2.000 | 279.499)(G)
; No metric specified - using makespan

; Plan found with metric 281.500
; States evaluated so far: 47
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.04
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [60.500]
60.501: (localize-cable vehicle1 waypoint32 turbine6)  [5.000]
65.502: (inspect-turbine vehicle1 data6 waypoint32 currenttide turbine6)  [200.000]
265.503: (surface vehicle1)  [5.000]
270.504: (harvest-energy vehicle1)  [8.995]
279.500: (upload-data-histograms vehicle1 data6)  [2.000]

 * All goal deadlines now no later than 281.500
b (0.000 | 281.500)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 65
; Cost: 281.500
; Time 0.05
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [60.500]
60.501: (localize-cable vehicle1 waypoint32 turbine6)  [5.000]
65.502: (inspect-turbine vehicle1 data6 waypoint32 currenttide turbine6)  [200.000]
265.503: (surface vehicle1)  [5.000]
270.504: (harvest-energy vehicle1)  [8.995]
279.500: (upload-data-histograms vehicle1 data6)  [2.000]
