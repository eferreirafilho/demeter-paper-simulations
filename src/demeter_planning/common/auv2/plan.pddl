Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle2) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle2) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle2) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 14.000, admissible cost estimate 0.000
b (13.000 | 13.850)b (12.000 | 13.850)b (11.000 | 61.467)b (10.000 | 61.467)b (9.000 | 158.502)b (8.000 | 158.502)b (6.000 | 162.552)b (5.000 | 172.554)b (4.000 | 172.554)b (2.000 | 387.032)(G)
; No metric specified - using makespan

; Plan found with metric 389.033
; States evaluated so far: 25
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle2 wp_init_auv2 waypoint28)  [13.850]
13.851: (move vehicle2 waypoint28 waypoint22)  [47.616]
61.468: (move vehicle2 waypoint22 waypoint17)  [50.800]
112.269: (move vehicle2 waypoint17 waypoint12)  [46.233]
158.503: (harvest-energy vehicle2)  [4.049]
162.553: (localize-cable vehicle2 waypoint12 turbine2)  [5.000]
167.554: (surface vehicle2)  [5.000]
172.555: (inspect-turbine vehicle2 data2 waypoint12 currenttide turbine2)  [200.000]
372.556: (surface vehicle2)  [5.000]
377.557: (harvest-energy vehicle2)  [9.475]
387.033: (upload-data-histograms vehicle2 data2)  [2.000]

 * All goal deadlines now no later than 389.033

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (13.000 | 13.850)b (12.000 | 13.850)b (11.000 | 61.467)b (10.000 | 61.467)b (9.000 | 158.502)b (8.000 | 158.502)b (6.000 | 162.552)b (5.000 | 172.554)b (4.000 | 172.554)b (2.000 | 381.531)(G)
; No metric specified - using makespan

; Plan found with metric 383.532
; States evaluated so far: 68
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.06
0.000: (move vehicle2 wp_init_auv2 waypoint28)  [13.850]
13.851: (move vehicle2 waypoint28 waypoint22)  [47.616]
61.468: (move vehicle2 waypoint22 waypoint17)  [50.800]
112.269: (move vehicle2 waypoint17 waypoint12)  [46.233]
158.503: (harvest-energy vehicle2)  [4.049]
162.553: (localize-cable vehicle2 waypoint12 turbine2)  [5.000]
167.554: (inspect-turbine vehicle2 data2 waypoint12 currenttide turbine2)  [200.000]
367.555: (surface vehicle2)  [5.000]
372.556: (harvest-energy vehicle2)  [8.975]
381.532: (upload-data-histograms vehicle2 data2)  [2.000]

 * All goal deadlines now no later than 383.532
b (0.000 | 383.532)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 380
; Cost: 383.532
; Time 0.36
0.000: (move vehicle2 wp_init_auv2 waypoint28)  [13.850]
13.851: (move vehicle2 waypoint28 waypoint22)  [47.616]
61.468: (move vehicle2 waypoint22 waypoint17)  [50.800]
112.269: (move vehicle2 waypoint17 waypoint12)  [46.233]
158.503: (harvest-energy vehicle2)  [4.049]
162.553: (localize-cable vehicle2 waypoint12 turbine2)  [5.000]
167.554: (inspect-turbine vehicle2 data2 waypoint12 currenttide turbine2)  [200.000]
367.555: (surface vehicle2)  [5.000]
372.556: (harvest-energy vehicle2)  [8.975]
381.532: (upload-data-histograms vehicle2 data2)  [2.000]
