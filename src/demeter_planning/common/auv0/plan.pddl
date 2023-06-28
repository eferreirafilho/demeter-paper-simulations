Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 7.766)b (10.000 | 7.766)b (9.000 | 77.750)b (8.000 | 77.750)b (6.000 | 81.942)b (5.000 | 91.943)b (4.000 | 91.944)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 7.766)b (10.000 | 7.766)b (9.000 | 77.750)b (8.000 | 77.750)b (6.000 | 81.942)b (5.000 | 91.943)b (4.000 | 91.944)b (2.000 | 261.732)(G)
; No metric specified - using makespan

; Plan found with metric 263.733
; States evaluated so far: 848
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.89
0.000: (move vehicle0 wp_init_auv0 waypoint10)  [7.766]
7.767: (move vehicle0 waypoint10 waypoint2)  [69.983]
77.751: (harvest-energy vehicle0)  [4.191]
81.943: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
198.255: (retrieve-data vehicle0 data0 waypoint2 currenttide turbine0)  [50.000]
248.256: (surface vehicle0)  [5.000]
253.257: (harvest-energy vehicle0)  [8.475]
261.733: (upload-data-histograms vehicle0 data0)  [2.000]

 * All goal deadlines now no later than 263.733
b (0.000 | 263.733)