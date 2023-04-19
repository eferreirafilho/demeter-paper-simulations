Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle0) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 55.000)b (10.000 | 55.000)b (9.000 | 306.501)b (8.000 | 306.501)b (7.000 | 1636.002)b (6.000 | 1636.002)b (5.000 | 1641.003)b (4.000 | 1646.004)b (2.000 | 1860.502)(G)
; No metric specified - using makespan

; Plan found with metric 1862.503
; States evaluated so far: 20
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle0 wp_init_auv0 waypoint2)  [55.000]
55.001: (move vehicle0 waypoint2 waypoint3)  [251.500]
306.502: (move vehicle0 waypoint3 waypoint12)  [1329.500]
1636.003: (localize-cable vehicle0 waypoint12 turbine2)  [5.000]
1641.004: (surface vehicle0)  [5.000]
1646.005: (inspect-turbine vehicle0 data2 waypoint12 currenttide turbine2)  [200.000]
1846.006: (surface vehicle0)  [5.000]
1851.007: (harvest-energy vehicle0)  [9.495]
1860.503: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 1862.503

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 55.000)b (10.000 | 55.000)b (9.000 | 306.501)b (8.000 | 306.501)b (7.000 | 1636.002)b (6.000 | 1636.002)b (5.000 | 1641.003)b (4.000 | 1646.004)b (2.000 | 1855.001)(G)
; No metric specified - using makespan

; Plan found with metric 1857.002
; States evaluated so far: 55
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.05
0.000: (move vehicle0 wp_init_auv0 waypoint2)  [55.000]
55.001: (move vehicle0 waypoint2 waypoint3)  [251.500]
306.502: (move vehicle0 waypoint3 waypoint12)  [1329.500]
1636.003: (localize-cable vehicle0 waypoint12 turbine2)  [5.000]
1641.004: (inspect-turbine vehicle0 data2 waypoint12 currenttide turbine2)  [200.000]
1841.005: (surface vehicle0)  [5.000]
1846.006: (harvest-energy vehicle0)  [8.995]
1855.002: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 1857.002
b (0.000 | 1857.002)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 73
; Cost: 1857.002
; Time 0.06
0.000: (move vehicle0 wp_init_auv0 waypoint2)  [55.000]
55.001: (move vehicle0 waypoint2 waypoint3)  [251.500]
306.502: (move vehicle0 waypoint3 waypoint12)  [1329.500]
1636.003: (localize-cable vehicle0 waypoint12 turbine2)  [5.000]
1641.004: (inspect-turbine vehicle0 data2 waypoint12 currenttide turbine2)  [200.000]
1841.005: (surface vehicle0)  [5.000]
1846.006: (harvest-energy vehicle0)  [8.995]
1855.002: (upload-data-histograms vehicle0 data2)  [2.000]
