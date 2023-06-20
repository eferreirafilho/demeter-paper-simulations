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
b (11.000 | 3.566)b (10.000 | 3.566)b (9.000 | 56.667)b (8.000 | 56.667)b (6.000 | 107.576)b (5.000 | 117.577)b (4.000 | 117.578)b (2.000 | 332.056)(G)
; No metric specified - using makespan

; Plan found with metric 334.057
; States evaluated so far: 22
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle2 wp_init_auv2 waypoint14)  [3.566]
3.567: (move vehicle2 waypoint14 waypoint18)  [53.100]
56.668: (move vehicle2 waypoint18 waypoint22)  [48.283]
104.952: (harvest-energy vehicle2)  [2.624]
107.577: (localize-cable vehicle2 waypoint22 turbine5)  [5.000]
112.578: (surface vehicle2)  [5.000]
117.579: (inspect-turbine vehicle2 data5 waypoint22 currenttide turbine5)  [200.000]
317.580: (surface vehicle2)  [5.000]
322.581: (harvest-energy vehicle2)  [9.475]
332.057: (upload-data-histograms vehicle2 data5)  [2.000]

 * All goal deadlines now no later than 334.057

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 3.566)b (10.000 | 3.566)b (9.000 | 56.667)b (8.000 | 56.667)b (6.000 | 107.576)b (5.000 | 117.577)b (4.000 | 117.578)b (2.000 | 326.555)(G)
; No metric specified - using makespan

; Plan found with metric 328.556
; States evaluated so far: 62
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.05
0.000: (move vehicle2 wp_init_auv2 waypoint14)  [3.566]
3.567: (move vehicle2 waypoint14 waypoint18)  [53.100]
56.668: (move vehicle2 waypoint18 waypoint22)  [48.283]
104.952: (harvest-energy vehicle2)  [2.624]
107.577: (localize-cable vehicle2 waypoint22 turbine5)  [5.000]
112.578: (inspect-turbine vehicle2 data5 waypoint22 currenttide turbine5)  [200.000]
312.579: (surface vehicle2)  [5.000]
317.580: (harvest-energy vehicle2)  [8.975]
326.556: (upload-data-histograms vehicle2 data5)  [2.000]

 * All goal deadlines now no later than 328.556
b (0.000 | 328.556)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 260
; Cost: 328.556
; Time 0.28
0.000: (move vehicle2 wp_init_auv2 waypoint14)  [3.566]
3.567: (move vehicle2 waypoint14 waypoint18)  [53.100]
56.668: (move vehicle2 waypoint18 waypoint22)  [48.283]
104.952: (harvest-energy vehicle2)  [2.624]
107.577: (localize-cable vehicle2 waypoint22 turbine5)  [5.000]
112.578: (inspect-turbine vehicle2 data5 waypoint22 currenttide turbine5)  [200.000]
312.579: (surface vehicle2)  [5.000]
317.580: (harvest-energy vehicle2)  [8.975]
326.556: (upload-data-histograms vehicle2 data5)  [2.000]
