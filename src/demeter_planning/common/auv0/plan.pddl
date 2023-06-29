Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 4.233)b (10.000 | 4.233)b (9.000 | 21.434)b (8.000 | 21.434)b (6.000 | 80.548)b (5.000 | 90.549)b (4.000 | 90.550)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 4.233)b (10.000 | 4.233)b (9.000 | 21.434)b (8.000 | 21.434)b (6.000 | 80.548)b (5.000 | 90.549)b (4.000 | 90.550)b (2.000 | 162.288)(G)
; No metric specified - using makespan

; Plan found with metric 164.289
; States evaluated so far: 1111
; States pruned based on pre-heuristic cost lower bound: 0
; Time 1.32
0.000: (move vehicle0 wp_init_auv0 waypoint6)  [4.233]
4.234: (move vehicle0 waypoint6 waypoint7)  [17.200]
21.435: (move vehicle0 waypoint7 waypoint18)  [57.050]
78.486: (harvest-energy vehicle0)  [2.062]
80.549: (localize-cable vehicle0 waypoint18 turbine4)  [5.000]
113.810: (surface vehicle0)  [5.000]
118.811: (retrieve-data vehicle0 data4 waypoint18 currenttide turbine4)  [30.000]
148.812: (surface vehicle0)  [5.000]
153.813: (harvest-energy vehicle0)  [8.475]
162.289: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 164.289
b (0.000 | 164.289)(G)
; No metric specified - using makespan

; Plan found with metric 163.814
; States evaluated so far: 1420
; States pruned based on pre-heuristic cost lower bound: 219
; Time 1.68
0.000: (move vehicle0 wp_init_auv0 waypoint6)  [4.233]
4.234: (move vehicle0 waypoint6 waypoint7)  [17.200]
21.435: (move vehicle0 waypoint7 waypoint18)  [57.050]
78.486: (harvest-energy vehicle0)  [2.062]
80.549: (localize-cable vehicle0 waypoint18 turbine4)  [5.000]
85.550: (surface vehicle0)  [5.000]
90.551: (localize-cable vehicle0 waypoint18 turbine4)  [5.000]
95.552: (surface vehicle0)  [5.000]
100.553: (localize-cable vehicle0 waypoint18 turbine4)  [5.000]
105.554: (surface vehicle0)  [5.000]
110.555: (harvest-energy vehicle0)  [1.425]
118.811: (retrieve-data vehicle0 data4 waypoint18 currenttide turbine4)  [30.000]
148.812: (surface vehicle0)  [5.000]
153.813: (harvest-energy vehicle0)  [8.000]
161.814: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 163.814
b (0.000 | 163.814)