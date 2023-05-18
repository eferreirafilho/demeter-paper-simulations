Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle0) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 5.250)b (8.000 | 5.250)b (7.000 | 65.251)b (6.000 | 65.251)b (4.000 | 77.860)b (2.000 | 291.363)(G)
; No metric specified - using makespan

; Plan found with metric 293.364
; States evaluated so far: 19
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle0 wp_init_auv0 waypoint27)  [5.250]
5.251: (move vehicle0 waypoint27 waypoint22)  [60.000]
65.252: (localize-cable vehicle0 waypoint22 turbine4)  [5.000]
70.253: (surface vehicle0)  [5.000]
75.254: (harvest-energy vehicle0)  [2.606]
77.861: (inspect-turbine vehicle0 data4 waypoint22 currenttide turbine4)  [200.000]
277.862: (surface vehicle0)  [5.000]
282.863: (harvest-energy vehicle0)  [8.500]
291.364: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 293.364

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 5.250)b (8.000 | 5.250)b (7.000 | 65.251)b (6.000 | 65.251)b (5.000 | 76.885)b (4.000 | 76.885)b (2.000 | 285.862)(G)
; No metric specified - using makespan

; Plan found with metric 287.863
; States evaluated so far: 56
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.05
0.000: (move vehicle0 wp_init_auv0 waypoint27)  [5.250]
5.251: (move vehicle0 waypoint27 waypoint22)  [60.000]
65.252: (harvest-energy vehicle0)  [1.631]
66.884: (localize-cable vehicle0 waypoint22 turbine4)  [5.000]
71.885: (inspect-turbine vehicle0 data4 waypoint22 currenttide turbine4)  [200.000]
271.886: (surface vehicle0)  [5.000]
276.887: (harvest-energy vehicle0)  [8.975]
285.863: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 287.863
b (0.000 | 287.863)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 167
; Cost: 287.863
; Time 0.15
0.000: (move vehicle0 wp_init_auv0 waypoint27)  [5.250]
5.251: (move vehicle0 waypoint27 waypoint22)  [60.000]
65.252: (harvest-energy vehicle0)  [1.631]
66.884: (localize-cable vehicle0 waypoint22 turbine4)  [5.000]
71.885: (inspect-turbine vehicle0 data4 waypoint22 currenttide turbine4)  [200.000]
271.886: (surface vehicle0)  [5.000]
276.887: (harvest-energy vehicle0)  [8.975]
285.863: (upload-data-histograms vehicle0 data4)  [2.000]
