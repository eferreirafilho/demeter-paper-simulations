Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle2) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle2) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle2) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 23.716)b (10.000 | 23.716)b (8.000 | 26.818)b (6.000 | 95.752)b (4.000 | 108.454)b (2.000 | 321.957)(G)
; No metric specified - using makespan

; Plan found with metric 323.958
; States evaluated so far: 22
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.03
0.000: (move vehicle2 wp_init_auv2 waypoint18)  [23.716]
23.717: (harvest-energy vehicle2)  [3.101]
26.819: (move vehicle2 waypoint18 waypoint38)  [68.933]
95.753: (localize-cable vehicle2 waypoint38 turbine9)  [5.000]
100.754: (surface vehicle2)  [5.000]
105.755: (harvest-energy vehicle2)  [2.698]
108.455: (inspect-turbine vehicle2 data9 waypoint38 currenttide turbine9)  [200.000]
308.456: (surface vehicle2)  [5.000]
313.457: (harvest-energy vehicle2)  [8.500]
321.958: (upload-data-histograms vehicle2 data9)  [2.000]

 * All goal deadlines now no later than 323.958

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 23.716)b (10.000 | 23.716)b (8.000 | 26.818)b (6.000 | 95.752)b (5.000 | 107.478)b (4.000 | 107.479)b (2.000 | 316.456)(G)
; No metric specified - using makespan

; Plan found with metric 318.457
; States evaluated so far: 61
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.07
0.000: (move vehicle2 wp_init_auv2 waypoint18)  [23.716]
23.717: (harvest-energy vehicle2)  [3.101]
26.819: (move vehicle2 waypoint18 waypoint38)  [68.933]
95.753: (harvest-energy vehicle2)  [1.723]
97.478: (localize-cable vehicle2 waypoint38 turbine9)  [5.000]
102.479: (inspect-turbine vehicle2 data9 waypoint38 currenttide turbine9)  [200.000]
302.480: (surface vehicle2)  [5.000]
307.481: (harvest-energy vehicle2)  [8.975]
316.457: (upload-data-histograms vehicle2 data9)  [2.000]

 * All goal deadlines now no later than 318.457
b (0.000 | 318.457)(G)b (0.000 | 318.456)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 174
; Cost: 318.457
; Time 0.20
0.000: (move vehicle2 wp_init_auv2 waypoint18)  [23.716]
23.717: (harvest-energy vehicle2)  [3.101]
26.819: (move vehicle2 waypoint18 waypoint38)  [68.933]
95.753: (harvest-energy vehicle2)  [1.723]
97.478: (localize-cable vehicle2 waypoint38 turbine9)  [5.000]
102.479: (inspect-turbine vehicle2 data9 waypoint38 currenttide turbine9)  [200.000]
302.480: (surface vehicle2)  [5.000]
307.481: (harvest-energy vehicle2)  [8.975]
316.457: (upload-data-histograms vehicle2 data9)  [2.000]
