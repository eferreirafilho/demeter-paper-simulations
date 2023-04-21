Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle2) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle2) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle2) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 117.500)b (10.000 | 117.500)b (9.000 | 1175.001)b (8.000 | 1175.001)b (7.000 | 2337.502)b (6.000 | 2337.502)b (5.000 | 2342.503)b (4.000 | 2347.504)b (2.000 | 2562.002)(G)
; No metric specified - using makespan

; Plan found with metric 2564.003
; States evaluated so far: 20
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle2 wp_init_auv2 waypoint12)  [117.500]
117.501: (move vehicle2 waypoint12 waypoint17)  [1057.500]
1175.002: (move vehicle2 waypoint17 waypoint22)  [1162.500]
2337.503: (localize-cable vehicle2 waypoint22 turbine4)  [5.000]
2342.504: (surface vehicle2)  [5.000]
2347.505: (inspect-turbine vehicle2 data4 waypoint22 currenttide turbine4)  [200.000]
2547.506: (surface vehicle2)  [5.000]
2552.507: (harvest-energy vehicle2)  [9.495]
2562.003: (upload-data-histograms vehicle2 data4)  [2.000]

 * All goal deadlines now no later than 2564.003

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 117.500)b (10.000 | 117.500)b (9.000 | 1175.001)b (8.000 | 1175.001)b (7.000 | 2337.502)b (6.000 | 2337.502)b (5.000 | 2342.503)b (4.000 | 2347.504)b (2.000 | 2556.501)(G)
; No metric specified - using makespan

; Plan found with metric 2558.502
; States evaluated so far: 55
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.05
0.000: (move vehicle2 wp_init_auv2 waypoint12)  [117.500]
117.501: (move vehicle2 waypoint12 waypoint17)  [1057.500]
1175.002: (move vehicle2 waypoint17 waypoint22)  [1162.500]
2337.503: (localize-cable vehicle2 waypoint22 turbine4)  [5.000]
2342.504: (inspect-turbine vehicle2 data4 waypoint22 currenttide turbine4)  [200.000]
2542.505: (surface vehicle2)  [5.000]
2547.506: (harvest-energy vehicle2)  [8.995]
2556.502: (upload-data-histograms vehicle2 data4)  [2.000]

 * All goal deadlines now no later than 2558.502
b (0.000 | 2558.502)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 73
; Cost: 2558.502
; Time 0.07
0.000: (move vehicle2 wp_init_auv2 waypoint12)  [117.500]
117.501: (move vehicle2 waypoint12 waypoint17)  [1057.500]
1175.002: (move vehicle2 waypoint17 waypoint22)  [1162.500]
2337.503: (localize-cable vehicle2 waypoint22 turbine4)  [5.000]
2342.504: (inspect-turbine vehicle2 data4 waypoint22 currenttide turbine4)  [200.000]
2542.505: (surface vehicle2)  [5.000]
2547.506: (harvest-energy vehicle2)  [8.995]
2556.502: (upload-data-histograms vehicle2 data4)  [2.000]
