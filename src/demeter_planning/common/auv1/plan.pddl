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
b (11.000 | 3.800)b (10.000 | 3.800)b (9.000 | 59.400)b (8.000 | 59.401)b (6.000 | 110.873)b (5.000 | 120.875)b (4.000 | 120.875)b (2.000 | 335.353)(G)
; No metric specified - using makespan

; Plan found with metric 337.354
; States evaluated so far: 22
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle1 wp_init_auv1 waypoint58)  [3.800]
3.801: (move vehicle1 waypoint58 waypoint62)  [55.600]
59.402: (move vehicle1 waypoint62 waypoint66)  [48.766]
108.169: (harvest-energy vehicle1)  [2.704]
110.874: (localize-cable vehicle1 waypoint66 turbine16)  [5.000]
115.875: (surface vehicle1)  [5.000]
120.876: (inspect-turbine vehicle1 data16 waypoint66 currenttide turbine16)  [200.000]
320.877: (surface vehicle1)  [5.000]
325.878: (harvest-energy vehicle1)  [9.475]
335.354: (upload-data-histograms vehicle1 data16)  [2.000]

 * All goal deadlines now no later than 337.354

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 3.800)b (10.000 | 3.800)b (9.000 | 59.400)b (8.000 | 59.401)b (6.000 | 110.873)b (5.000 | 120.875)b (4.000 | 120.875)b (2.000 | 329.852)(G)
; No metric specified - using makespan

; Plan found with metric 331.853
; States evaluated so far: 62
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.06
0.000: (move vehicle1 wp_init_auv1 waypoint58)  [3.800]
3.801: (move vehicle1 waypoint58 waypoint62)  [55.600]
59.402: (move vehicle1 waypoint62 waypoint66)  [48.766]
108.169: (harvest-energy vehicle1)  [2.704]
110.874: (localize-cable vehicle1 waypoint66 turbine16)  [5.000]
115.875: (inspect-turbine vehicle1 data16 waypoint66 currenttide turbine16)  [200.000]
315.876: (surface vehicle1)  [5.000]
320.877: (harvest-energy vehicle1)  [8.975]
329.853: (upload-data-histograms vehicle1 data16)  [2.000]

 * All goal deadlines now no later than 331.853
b (0.000 | 331.853)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 262
; Cost: 331.853
; Time 0.28
0.000: (move vehicle1 wp_init_auv1 waypoint58)  [3.800]
3.801: (move vehicle1 waypoint58 waypoint62)  [55.600]
59.402: (move vehicle1 waypoint62 waypoint66)  [48.766]
108.169: (harvest-energy vehicle1)  [2.704]
110.874: (localize-cable vehicle1 waypoint66 turbine16)  [5.000]
115.875: (inspect-turbine vehicle1 data16 waypoint66 currenttide turbine16)  [200.000]
315.876: (surface vehicle1)  [5.000]
320.877: (harvest-energy vehicle1)  [8.975]
329.853: (upload-data-histograms vehicle1 data16)  [2.000]
