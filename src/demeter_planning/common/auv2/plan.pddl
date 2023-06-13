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
b (11.000 | 2.616)b (10.000 | 2.616)b (9.000 | 62.349)b (8.000 | 62.350)b (6.000 | 105.816)b (5.000 | 115.817)b (4.000 | 115.818)b (2.000 | 330.296)(G)
; No metric specified - using makespan

; Plan found with metric 332.297
; States evaluated so far: 22
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle2 wp_init_auv2 waypoint38)  [2.616]
2.617: (move vehicle2 waypoint38 waypoint20)  [59.733]
62.351: (move vehicle2 waypoint20 waypoint22)  [40.883]
103.235: (harvest-energy vehicle2)  [2.581]
105.817: (localize-cable vehicle2 waypoint22 turbine5)  [5.000]
110.818: (surface vehicle2)  [5.000]
115.819: (inspect-turbine vehicle2 data5 waypoint22 currenttide turbine5)  [200.000]
315.820: (surface vehicle2)  [5.000]
320.821: (harvest-energy vehicle2)  [9.475]
330.297: (upload-data-histograms vehicle2 data5)  [2.000]

 * All goal deadlines now no later than 332.297

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 2.616)b (10.000 | 2.616)b (9.000 | 62.349)b (8.000 | 62.350)b (6.000 | 105.816)b (5.000 | 115.817)b (4.000 | 115.818)b (2.000 | 324.795)(G)
; No metric specified - using makespan

; Plan found with metric 326.796
; States evaluated so far: 62
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.07
0.000: (move vehicle2 wp_init_auv2 waypoint38)  [2.616]
2.617: (move vehicle2 waypoint38 waypoint20)  [59.733]
62.351: (move vehicle2 waypoint20 waypoint22)  [40.883]
103.235: (harvest-energy vehicle2)  [2.581]
105.817: (localize-cable vehicle2 waypoint22 turbine5)  [5.000]
110.818: (inspect-turbine vehicle2 data5 waypoint22 currenttide turbine5)  [200.000]
310.819: (surface vehicle2)  [5.000]
315.820: (harvest-energy vehicle2)  [8.975]
324.796: (upload-data-histograms vehicle2 data5)  [2.000]

 * All goal deadlines now no later than 326.796
b (0.000 | 326.796)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 266
; Cost: 326.796
; Time 0.34
0.000: (move vehicle2 wp_init_auv2 waypoint38)  [2.616]
2.617: (move vehicle2 waypoint38 waypoint20)  [59.733]
62.351: (move vehicle2 waypoint20 waypoint22)  [40.883]
103.235: (harvest-energy vehicle2)  [2.581]
105.817: (localize-cable vehicle2 waypoint22 turbine5)  [5.000]
110.818: (inspect-turbine vehicle2 data5 waypoint22 currenttide turbine5)  [200.000]
310.819: (surface vehicle2)  [5.000]
315.820: (harvest-energy vehicle2)  [8.975]
324.796: (upload-data-histograms vehicle2 data5)  [2.000]
