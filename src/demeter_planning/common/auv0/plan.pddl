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
b (9.000 | 17.733)b (8.000 | 17.733)b (6.000 | 86.643)b (5.000 | 96.645)b (4.000 | 96.645)b (2.000 | 311.123)(G)
; No metric specified - using makespan

; Plan found with metric 313.124
; States evaluated so far: 20
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle0 wp_init_auv0 waypoint47)  [17.733]
17.734: (move vehicle0 waypoint47 waypoint77)  [66.433]
84.168: (harvest-energy vehicle0)  [2.475]
86.644: (localize-cable vehicle0 waypoint77 turbine15)  [5.000]
91.645: (surface vehicle0)  [5.000]
96.646: (inspect-turbine vehicle0 data15 waypoint77 currenttide turbine15)  [200.000]
296.647: (surface vehicle0)  [5.000]
301.648: (harvest-energy vehicle0)  [9.475]
311.124: (upload-data-histograms vehicle0 data15)  [2.000]

 * All goal deadlines now no later than 313.124

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 17.733)b (8.000 | 17.733)b (6.000 | 86.643)b (5.000 | 96.645)b (4.000 | 96.645)b (2.000 | 305.622)(G)
; No metric specified - using makespan

; Plan found with metric 307.623
; States evaluated so far: 57
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.05
0.000: (move vehicle0 wp_init_auv0 waypoint47)  [17.733]
17.734: (move vehicle0 waypoint47 waypoint77)  [66.433]
84.168: (harvest-energy vehicle0)  [2.475]
86.644: (localize-cable vehicle0 waypoint77 turbine15)  [5.000]
91.645: (inspect-turbine vehicle0 data15 waypoint77 currenttide turbine15)  [200.000]
291.646: (surface vehicle0)  [5.000]
296.647: (harvest-energy vehicle0)  [8.975]
305.623: (upload-data-histograms vehicle0 data15)  [2.000]

 * All goal deadlines now no later than 307.623
b (0.000 | 307.623)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 167
; Cost: 307.623
; Time 0.14
0.000: (move vehicle0 wp_init_auv0 waypoint47)  [17.733]
17.734: (move vehicle0 waypoint47 waypoint77)  [66.433]
84.168: (harvest-energy vehicle0)  [2.475]
86.644: (localize-cable vehicle0 waypoint77 turbine15)  [5.000]
91.645: (inspect-turbine vehicle0 data15 waypoint77 currenttide turbine15)  [200.000]
291.646: (surface vehicle0)  [5.000]
296.647: (harvest-energy vehicle0)  [8.975]
305.623: (upload-data-histograms vehicle0 data15)  [2.000]
