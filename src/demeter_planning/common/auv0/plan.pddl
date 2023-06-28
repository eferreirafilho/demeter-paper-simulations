Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 4.450)b (8.000 | 4.450)b (6.000 | 73.288)b (5.000 | 83.290)b (4.000 | 83.290)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 4.450)b (8.000 | 4.450)b (6.000 | 73.288)b (5.000 | 83.290)b (4.000 | 83.290)b (2.000 | 262.289)(G)
; No metric specified - using makespan

; Plan found with metric 264.290
; States evaluated so far: 876
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.81
0.000: (move vehicle0 wp_init_auv0 waypoint14)  [4.450]
4.451: (move vehicle0 waypoint14 waypoint34)  [66.283]
70.735: (harvest-energy vehicle0)  [2.553]
73.289: (localize-cable vehicle0 waypoint34 turbine8)  [5.000]
198.812: (retrieve-data vehicle0 data8 waypoint34 currenttide turbine8)  [50.000]
248.813: (surface vehicle0)  [5.000]
253.814: (harvest-energy vehicle0)  [8.475]
262.290: (upload-data-histograms vehicle0 data8)  [2.000]

 * All goal deadlines now no later than 264.290
b (0.000 | 264.290)(G)
; No metric specified - using makespan

; Plan found with metric 263.815
; States evaluated so far: 1163
; States pruned based on pre-heuristic cost lower bound: 269
; Time 1.08
0.000: (move vehicle0 wp_init_auv0 waypoint14)  [4.450]
4.451: (move vehicle0 waypoint14 waypoint34)  [66.283]
70.735: (harvest-energy vehicle0)  [2.553]
73.289: (localize-cable vehicle0 waypoint34 turbine8)  [5.000]
78.290: (surface vehicle0)  [5.000]
83.291: (localize-cable vehicle0 waypoint34 turbine8)  [5.000]
88.292: (surface vehicle0)  [5.000]
93.293: (localize-cable vehicle0 waypoint34 turbine8)  [5.000]
98.294: (surface vehicle0)  [5.000]
103.295: (harvest-energy vehicle0)  [1.425]
198.812: (retrieve-data vehicle0 data8 waypoint34 currenttide turbine8)  [50.000]
248.813: (surface vehicle0)  [5.000]
253.814: (harvest-energy vehicle0)  [8.000]
261.815: (upload-data-histograms vehicle0 data8)  [2.000]

 * All goal deadlines now no later than 263.815
b (0.000 | 263.815)