Number of literals: 10
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle2) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle2) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle2) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 5.366)b (6.000 | 5.366)b (5.000 | 10.367)b (4.000 | 15.368)b (2.000 | 229.980)(G)
; No metric specified - using makespan

; Plan found with metric 231.981
; States evaluated so far: 16
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle2 wp_init_auv2 waypoint12)  [5.366]
5.367: (localize-cable vehicle2 waypoint12 turbine2)  [5.000]
10.368: (surface vehicle2)  [5.000]
15.369: (inspect-turbine vehicle2 data2 waypoint12 currenttide turbine2)  [200.000]
215.370: (surface vehicle2)  [5.000]
220.371: (harvest-energy vehicle2)  [9.609]
229.981: (upload-data-histograms vehicle2 data2)  [2.000]

 * All goal deadlines now no later than 231.981

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 5.366)b (6.000 | 5.366)b (5.000 | 10.367)b (4.000 | 15.368)b (2.000 | 224.479)(G)
; No metric specified - using makespan

; Plan found with metric 226.480
; States evaluated so far: 44
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.03
0.000: (move vehicle2 wp_init_auv2 waypoint12)  [5.366]
5.367: (localize-cable vehicle2 waypoint12 turbine2)  [5.000]
10.368: (inspect-turbine vehicle2 data2 waypoint12 currenttide turbine2)  [200.000]
210.369: (surface vehicle2)  [5.000]
215.370: (harvest-energy vehicle2)  [9.109]
224.480: (upload-data-histograms vehicle2 data2)  [2.000]

 * All goal deadlines now no later than 226.480
b (0.000 | 226.480)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 98
; Cost: 226.480
; Time 0.08
0.000: (move vehicle2 wp_init_auv2 waypoint12)  [5.366]
5.367: (localize-cable vehicle2 waypoint12 turbine2)  [5.000]
10.368: (inspect-turbine vehicle2 data2 waypoint12 currenttide turbine2)  [200.000]
210.369: (surface vehicle2)  [5.000]
215.370: (harvest-energy vehicle2)  [9.109]
224.480: (upload-data-histograms vehicle2 data2)  [2.000]
