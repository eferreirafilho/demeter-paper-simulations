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
b (11.000 | 3.500)b (10.000 | 3.500)b (8.000 | 69.784)b (6.000 | 147.671)b (5.000 | 157.672)b (4.000 | 157.673)b (2.000 | 372.151)(G)
; No metric specified - using makespan

; Plan found with metric 374.152
; States evaluated so far: 22
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle1 wp_init_auv1 waypoint34)  [3.500]
3.501: (move vehicle1 waypoint34 waypoint14)  [66.283]
69.785: (move vehicle1 waypoint14 waypoint6)  [74.283]
144.069: (harvest-energy vehicle1)  [3.602]
147.672: (localize-cable vehicle1 waypoint6 turbine1)  [5.000]
152.673: (surface vehicle1)  [5.000]
157.674: (inspect-turbine vehicle1 data1 waypoint6 currenttide turbine1)  [200.000]
357.675: (surface vehicle1)  [5.000]
362.676: (harvest-energy vehicle1)  [9.475]
372.152: (upload-data-histograms vehicle1 data1)  [2.000]

 * All goal deadlines now no later than 374.152

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 3.500)b (10.000 | 3.500)b (8.000 | 69.784)b (6.000 | 147.671)b (5.000 | 157.672)b (4.000 | 157.673)b (2.000 | 366.650)(G)
; No metric specified - using makespan

; Plan found with metric 368.651
; States evaluated so far: 62
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.05
0.000: (move vehicle1 wp_init_auv1 waypoint34)  [3.500]
3.501: (move vehicle1 waypoint34 waypoint14)  [66.283]
69.785: (move vehicle1 waypoint14 waypoint6)  [74.283]
144.069: (harvest-energy vehicle1)  [3.602]
147.672: (localize-cable vehicle1 waypoint6 turbine1)  [5.000]
152.673: (inspect-turbine vehicle1 data1 waypoint6 currenttide turbine1)  [200.000]
352.674: (surface vehicle1)  [5.000]
357.675: (harvest-energy vehicle1)  [8.975]
366.651: (upload-data-histograms vehicle1 data1)  [2.000]

 * All goal deadlines now no later than 368.651
b (0.000 | 368.651)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 260
; Cost: 368.651
; Time 0.26
0.000: (move vehicle1 wp_init_auv1 waypoint34)  [3.500]
3.501: (move vehicle1 waypoint34 waypoint14)  [66.283]
69.785: (move vehicle1 waypoint14 waypoint6)  [74.283]
144.069: (harvest-energy vehicle1)  [3.602]
147.672: (localize-cable vehicle1 waypoint6 turbine1)  [5.000]
152.673: (inspect-turbine vehicle1 data1 waypoint6 currenttide turbine1)  [200.000]
352.674: (surface vehicle1)  [5.000]
357.675: (harvest-energy vehicle1)  [8.975]
366.651: (upload-data-histograms vehicle1 data1)  [2.000]
