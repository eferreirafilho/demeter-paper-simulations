Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle2) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle2) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 3.416)b (8.000 | 3.416)b (6.000 | 73.400)b (4.000 | 86.213)b (2.000 | 299.716)(G)
; No metric specified - using makespan

; Plan found with metric 301.717
; States evaluated so far: 19
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle2 wp_init_auv2 waypoint2)  [3.416]
3.417: (move vehicle2 waypoint2 waypoint10)  [69.983]
73.401: (localize-cable vehicle2 waypoint10 turbine2)  [5.000]
78.402: (surface vehicle2)  [5.000]
83.403: (harvest-energy vehicle2)  [2.810]
86.214: (retrieve-data vehicle2 data2 waypoint10 currenttide turbine2)  [200.000]
286.215: (surface vehicle2)  [5.000]
291.216: (harvest-energy vehicle2)  [8.500]
299.717: (upload-data-histograms vehicle2 data2)  [2.000]

 * All goal deadlines now no later than 301.717

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 3.416)b (8.000 | 3.416)b (6.000 | 73.400)b (5.000 | 85.238)b (4.000 | 85.238)b (2.000 | 294.215)(G)
; No metric specified - using makespan

; Plan found with metric 296.216
; States evaluated so far: 56
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.06
0.000: (move vehicle2 wp_init_auv2 waypoint2)  [3.416]
3.417: (move vehicle2 waypoint2 waypoint10)  [69.983]
73.401: (harvest-energy vehicle2)  [1.835]
75.237: (localize-cable vehicle2 waypoint10 turbine2)  [5.000]
80.238: (retrieve-data vehicle2 data2 waypoint10 currenttide turbine2)  [200.000]
280.239: (surface vehicle2)  [5.000]
285.240: (harvest-energy vehicle2)  [8.975]
294.216: (upload-data-histograms vehicle2 data2)  [2.000]

 * All goal deadlines now no later than 296.216
b (0.000 | 296.216)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 166
; Cost: 296.216
; Time 0.20
0.000: (move vehicle2 wp_init_auv2 waypoint2)  [3.416]
3.417: (move vehicle2 waypoint2 waypoint10)  [69.983]
73.401: (harvest-energy vehicle2)  [1.835]
75.237: (localize-cable vehicle2 waypoint10 turbine2)  [5.000]
80.238: (retrieve-data vehicle2 data2 waypoint10 currenttide turbine2)  [200.000]
280.239: (surface vehicle2)  [5.000]
285.240: (harvest-energy vehicle2)  [8.975]
294.216: (upload-data-histograms vehicle2 data2)  [2.000]
