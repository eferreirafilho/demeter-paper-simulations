Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle1) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle1) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle1) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 3.366)b (10.000 | 3.366)b (8.000 | 74.500)b (6.000 | 147.311)b (5.000 | 157.312)b (4.000 | 157.313)b (2.000 | 371.791)(G)
; No metric specified - using makespan

; Plan found with metric 373.792
; States evaluated so far: 22
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.03
0.000: (move vehicle1 wp_init_auv1 waypoint54)  [3.366]
3.367: (move vehicle1 waypoint54 waypoint30)  [71.133]
74.501: (move vehicle1 waypoint30 waypoint10)  [69.216]
143.718: (harvest-energy vehicle1)  [3.593]
147.312: (localize-cable vehicle1 waypoint10 turbine2)  [5.000]
152.313: (surface vehicle1)  [5.000]
157.314: (inspect-turbine vehicle1 data2 waypoint10 currenttide turbine2)  [200.000]
357.315: (surface vehicle1)  [5.000]
362.316: (harvest-energy vehicle1)  [9.475]
371.792: (upload-data-histograms vehicle1 data2)  [2.000]

 * All goal deadlines now no later than 373.792

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 3.366)b (10.000 | 3.366)b (8.000 | 74.500)b (6.000 | 147.311)b (5.000 | 157.312)b (4.000 | 157.313)b (2.000 | 366.290)(G)
; No metric specified - using makespan

; Plan found with metric 368.291
; States evaluated so far: 62
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.08
0.000: (move vehicle1 wp_init_auv1 waypoint54)  [3.366]
3.367: (move vehicle1 waypoint54 waypoint30)  [71.133]
74.501: (move vehicle1 waypoint30 waypoint10)  [69.216]
143.718: (harvest-energy vehicle1)  [3.593]
147.312: (localize-cable vehicle1 waypoint10 turbine2)  [5.000]
152.313: (inspect-turbine vehicle1 data2 waypoint10 currenttide turbine2)  [200.000]
352.314: (surface vehicle1)  [5.000]
357.315: (harvest-energy vehicle1)  [8.975]
366.291: (upload-data-histograms vehicle1 data2)  [2.000]

 * All goal deadlines now no later than 368.291
b (0.000 | 368.291)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 258
; Cost: 368.291
; Time 0.37
0.000: (move vehicle1 wp_init_auv1 waypoint54)  [3.366]
3.367: (move vehicle1 waypoint54 waypoint30)  [71.133]
74.501: (move vehicle1 waypoint30 waypoint10)  [69.216]
143.718: (harvest-energy vehicle1)  [3.593]
147.312: (localize-cable vehicle1 waypoint10 turbine2)  [5.000]
152.313: (inspect-turbine vehicle1 data2 waypoint10 currenttide turbine2)  [200.000]
352.314: (surface vehicle1)  [5.000]
357.315: (harvest-energy vehicle1)  [8.975]
366.291: (upload-data-histograms vehicle1 data2)  [2.000]
