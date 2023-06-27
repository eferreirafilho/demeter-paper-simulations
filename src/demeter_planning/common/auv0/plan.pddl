Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 13.000, admissible cost estimate 0.000
b (12.000 | 8.016)b (11.000 | 8450.200)b (10.000 | 8450.200)b (9.000 | 8450.200)b (8.000 | 8450.200)b (6.000 | 8450.200)b (5.000 | 8450.200)b (4.000 | 8450.200)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (12.000 | 8.016)b (11.000 | 8450.200)b (10.000 | 8450.200)b (9.000 | 8518.800)b (8.000 | 8518.800)b (6.000 | 8521.496)b (5.000 | 8531.498)b (4.000 | 8531.498)b (2.000 | 8661.347)(G)
; No metric specified - using makespan

; Plan found with metric 8663.348
; States evaluated so far: 653
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.84
8442.182: (move vehicle0 wp_init_auv0 waypoint42)  [8.016]
8450.199: (move vehicle0 waypoint42 waypoint19)  [51.400]
8501.600: (move vehicle0 waypoint19 waypoint18)  [17.200]
8518.801: (harvest-energy vehicle0)  [2.695]
8521.497: (localize-cable vehicle0 waypoint18 turbine4)  [5.000]
8597.870: (retrieve-data vehicle0 data4 waypoint18 currenttide turbine4)  [50.000]
8647.871: (surface vehicle0)  [5.000]
8652.872: (harvest-energy vehicle0)  [8.475]
8661.348: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 8663.348
b (0.000 | 8663.348)(G)
; No metric specified - using makespan

; Plan found with metric 8662.873
; States evaluated so far: 1117
; States pruned based on pre-heuristic cost lower bound: 204
; Time 1.49
8442.182: (move vehicle0 wp_init_auv0 waypoint42)  [8.016]
8450.199: (move vehicle0 waypoint42 waypoint19)  [51.400]
8501.600: (harvest-energy vehicle0)  [2.265]
8503.866: (move vehicle0 waypoint19 waypoint18)  [17.200]
8521.067: (localize-cable vehicle0 waypoint18 turbine4)  [5.000]
8526.068: (surface vehicle0)  [5.000]
8531.069: (localize-cable vehicle0 waypoint18 turbine4)  [5.000]
8536.070: (surface vehicle0)  [5.000]
8541.071: (harvest-energy vehicle0)  [1.380]
8597.870: (retrieve-data vehicle0 data4 waypoint18 currenttide turbine4)  [50.000]
8647.871: (surface vehicle0)  [5.000]
8652.872: (harvest-energy vehicle0)  [8.000]
8660.873: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 8662.873
b (0.000 | 8662.873)