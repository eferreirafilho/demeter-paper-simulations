Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 17.750)b (7.000 | 2013.620)b (6.000 | 2013.620)b (5.000 | 2013.620)b (4.000 | 2013.620)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 17.750)b (7.000 | 2013.620)b (6.000 | 2013.620)b (5.000 | 2018.619)b (4.000 | 2023.620)b (2.000 | 2131.791)(G)
; No metric specified - using makespan

; Plan found with metric 2133.792
; States evaluated so far: 669
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.52
1995.868: (move vehicle0 wp_init_auv0 waypoint22)  [17.750]
2013.619: (localize-cable vehicle0 waypoint22 turbine5)  [5.000]
2097.870: (retrieve-data vehicle0 data5 waypoint22 currenttide turbine5)  [20.000]
2117.871: (surface vehicle0)  [5.000]
2122.872: (harvest-energy vehicle0)  [8.919]
2131.792: (upload-data-histograms vehicle0 data5)  [2.000]

 * All goal deadlines now no later than 2133.792
b (0.000 | 2133.792)(G)(G)