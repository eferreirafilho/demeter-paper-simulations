Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 4.200)b (8.000 | 4.200)b (6.000 | 73.551)b (4.000 | 86.368)b (2.000 | 299.871)(G)
; No metric specified - using makespan

; Plan found with metric 301.872
; States evaluated so far: 19
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle0 wp_init_auv0 waypoint22)  [4.200]
4.201: (move vehicle0 waypoint22 waypoint42)  [69.350]
73.552: (localize-cable vehicle0 waypoint42 turbine10)  [5.000]
78.553: (surface vehicle0)  [5.000]
83.554: (harvest-energy vehicle0)  [2.814]
86.369: (retrieve-data vehicle0 data10 waypoint42 currenttide turbine10)  [200.000]
286.370: (surface vehicle0)  [5.000]
291.371: (harvest-energy vehicle0)  [8.500]
299.872: (upload-data-histograms vehicle0 data10)  [2.000]

 * All goal deadlines now no later than 301.872

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 4.200)b (8.000 | 4.200)b (6.000 | 73.551)b (5.000 | 85.392)b (4.000 | 85.393)b (2.000 | 294.370)(G)
; No metric specified - using makespan

; Plan found with metric 296.371
; States evaluated so far: 56
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.06
0.000: (move vehicle0 wp_init_auv0 waypoint22)  [4.200]
4.201: (move vehicle0 waypoint22 waypoint42)  [69.350]
73.552: (harvest-energy vehicle0)  [1.839]
75.392: (localize-cable vehicle0 waypoint42 turbine10)  [5.000]
80.393: (retrieve-data vehicle0 data10 waypoint42 currenttide turbine10)  [200.000]
280.394: (surface vehicle0)  [5.000]
285.395: (harvest-energy vehicle0)  [8.975]
294.371: (upload-data-histograms vehicle0 data10)  [2.000]

 * All goal deadlines now no later than 296.371
b (0.000 | 296.371)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 166
; Cost: 296.371
; Time 0.19
0.000: (move vehicle0 wp_init_auv0 waypoint22)  [4.200]
4.201: (move vehicle0 waypoint22 waypoint42)  [69.350]
73.552: (harvest-energy vehicle0)  [1.839]
75.392: (localize-cable vehicle0 waypoint42 turbine10)  [5.000]
80.393: (retrieve-data vehicle0 data10 waypoint42 currenttide turbine10)  [200.000]
280.394: (surface vehicle0)  [5.000]
285.395: (harvest-energy vehicle0)  [8.975]
294.371: (upload-data-histograms vehicle0 data10)  [2.000]
