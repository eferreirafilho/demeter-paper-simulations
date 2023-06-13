Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle2) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle2) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle2) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 4.250)b (10.000 | 4.250)b (8.000 | 78.534)b (6.000 | 148.439)b (5.000 | 158.441)b (4.000 | 158.441)b (2.000 | 372.919)(G)
; No metric specified - using makespan

; Plan found with metric 374.920
; States evaluated so far: 22
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle2 wp_init_auv2 waypoint6)  [4.250]
4.251: (move vehicle2 waypoint6 waypoint14)  [74.283]
78.535: (move vehicle2 waypoint14 waypoint34)  [66.283]
144.819: (harvest-energy vehicle2)  [3.620]
148.440: (localize-cable vehicle2 waypoint34 turbine8)  [5.000]
153.441: (surface vehicle2)  [5.000]
158.442: (inspect-turbine vehicle2 data8 waypoint34 currenttide turbine8)  [200.000]
358.443: (surface vehicle2)  [5.000]
363.444: (harvest-energy vehicle2)  [9.475]
372.920: (upload-data-histograms vehicle2 data8)  [2.000]

 * All goal deadlines now no later than 374.920

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 4.250)b (10.000 | 4.250)b (8.000 | 78.534)b (6.000 | 148.439)b (5.000 | 158.441)b (4.000 | 158.441)b (2.000 | 367.418)(G)
; No metric specified - using makespan

; Plan found with metric 369.419
; States evaluated so far: 62
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.05
0.000: (move vehicle2 wp_init_auv2 waypoint6)  [4.250]
4.251: (move vehicle2 waypoint6 waypoint14)  [74.283]
78.535: (move vehicle2 waypoint14 waypoint34)  [66.283]
144.819: (harvest-energy vehicle2)  [3.620]
148.440: (localize-cable vehicle2 waypoint34 turbine8)  [5.000]
153.441: (inspect-turbine vehicle2 data8 waypoint34 currenttide turbine8)  [200.000]
353.442: (surface vehicle2)  [5.000]
358.443: (harvest-energy vehicle2)  [8.975]
367.419: (upload-data-histograms vehicle2 data8)  [2.000]

 * All goal deadlines now no later than 369.419
b (0.000 | 369.419)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 260
; Cost: 369.419
; Time 0.28
0.000: (move vehicle2 wp_init_auv2 waypoint6)  [4.250]
4.251: (move vehicle2 waypoint6 waypoint14)  [74.283]
78.535: (move vehicle2 waypoint14 waypoint34)  [66.283]
144.819: (harvest-energy vehicle2)  [3.620]
148.440: (localize-cable vehicle2 waypoint34 turbine8)  [5.000]
153.441: (inspect-turbine vehicle2 data8 waypoint34 currenttide turbine8)  [200.000]
353.442: (surface vehicle2)  [5.000]
358.443: (harvest-energy vehicle2)  [8.975]
367.419: (upload-data-histograms vehicle2 data8)  [2.000]
