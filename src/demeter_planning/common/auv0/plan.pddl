Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 8.450)b (8.000 | 8.450)b (6.000 | 78.434)b (4.000 | 90.873)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 8.450)b (8.000 | 8.450)b (6.000 | 78.434)b (5.000 | 90.397)b (4.000 | 90.398)b (2.000 | 262.299)(G)
; No metric specified - using makespan

; Plan found with metric 264.300
; States evaluated so far: 894
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.81
0.000: (move vehicle0 wp_init_auv0 waypoint10)  [8.450]
8.451: (move vehicle0 waypoint10 waypoint2)  [69.983]
78.435: (harvest-energy vehicle0)  [1.961]
80.397: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
198.822: (retrieve-data vehicle0 data0 waypoint2 currenttide turbine0)  [50.000]
248.823: (surface vehicle0)  [5.000]
253.824: (harvest-energy vehicle0)  [8.475]
262.300: (upload-data-histograms vehicle0 data0)  [2.000]

 * All goal deadlines now no later than 264.300
b (0.000 | 264.300)