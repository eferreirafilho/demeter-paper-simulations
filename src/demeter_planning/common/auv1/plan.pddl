Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle1) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle1) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 3.383)b (10.000 | 3.383)b (8.000 | 69.667)b (6.000 | 147.551)b (5.000 | 157.552)b (4.000 | 157.553)b (2.000 | 372.031)(G)
; No metric specified - using makespan

; Plan found with metric 374.032
; States evaluated so far: 22
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle1 wp_init_auv1 waypoint34)  [3.383]
3.384: (move vehicle1 waypoint34 waypoint14)  [66.283]
69.668: (move vehicle1 waypoint14 waypoint6)  [74.283]
143.952: (harvest-energy vehicle1)  [3.599]
147.552: (localize-cable vehicle1 waypoint6 turbine1)  [5.000]
152.553: (surface vehicle1)  [5.000]
157.554: (retrieve-data vehicle1 data1 waypoint6 currenttide turbine1)  [200.000]
357.555: (surface vehicle1)  [5.000]
362.556: (harvest-energy vehicle1)  [9.475]
372.032: (upload-data-histograms vehicle1 data1)  [2.000]

 * All goal deadlines now no later than 374.032

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 3.383)b (10.000 | 3.383)b (8.000 | 69.667)b (6.000 | 147.551)b (5.000 | 157.552)b (4.000 | 157.553)b (2.000 | 366.530)(G)
; No metric specified - using makespan

; Plan found with metric 368.531
; States evaluated so far: 62
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.07
0.000: (move vehicle1 wp_init_auv1 waypoint34)  [3.383]
3.384: (move vehicle1 waypoint34 waypoint14)  [66.283]
69.668: (move vehicle1 waypoint14 waypoint6)  [74.283]
143.952: (harvest-energy vehicle1)  [3.599]
147.552: (localize-cable vehicle1 waypoint6 turbine1)  [5.000]
152.553: (retrieve-data vehicle1 data1 waypoint6 currenttide turbine1)  [200.000]
352.554: (surface vehicle1)  [5.000]
357.555: (harvest-energy vehicle1)  [8.975]
366.531: (upload-data-histograms vehicle1 data1)  [2.000]

 * All goal deadlines now no later than 368.531
b (0.000 | 368.531)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 258
; Cost: 368.531
; Time 0.33
0.000: (move vehicle1 wp_init_auv1 waypoint34)  [3.383]
3.384: (move vehicle1 waypoint34 waypoint14)  [66.283]
69.668: (move vehicle1 waypoint14 waypoint6)  [74.283]
143.952: (harvest-energy vehicle1)  [3.599]
147.552: (localize-cable vehicle1 waypoint6 turbine1)  [5.000]
152.553: (retrieve-data vehicle1 data1 waypoint6 currenttide turbine1)  [200.000]
352.554: (surface vehicle1)  [5.000]
357.555: (harvest-energy vehicle1)  [8.975]
366.531: (upload-data-histograms vehicle1 data1)  [2.000]
