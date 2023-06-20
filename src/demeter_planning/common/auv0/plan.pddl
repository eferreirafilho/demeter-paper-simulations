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
b (11.000 | 3.716)b (10.000 | 3.716)b (9.000 | 56.817)b (8.000 | 56.817)b (6.000 | 107.866)b (5.000 | 117.867)b (4.000 | 117.868)b (2.000 | 332.346)(G)
; No metric specified - using makespan

; Plan found with metric 334.347
; States evaluated so far: 22
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle0 wp_init_auv0 waypoint18)  [3.716]
3.717: (move vehicle0 waypoint18 waypoint14)  [53.100]
56.818: (move vehicle0 waypoint14 waypoint10)  [48.416]
105.235: (harvest-energy vehicle0)  [2.631]
107.867: (localize-cable vehicle0 waypoint10 turbine2)  [5.000]
112.868: (surface vehicle0)  [5.000]
117.869: (inspect-turbine vehicle0 data2 waypoint10 currenttide turbine2)  [200.000]
317.870: (surface vehicle0)  [5.000]
322.871: (harvest-energy vehicle0)  [9.475]
332.347: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 334.347

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 3.716)b (10.000 | 3.716)b (9.000 | 56.817)b (8.000 | 56.817)b (6.000 | 107.866)b (5.000 | 117.867)b (4.000 | 117.868)b (2.000 | 326.845)(G)
; No metric specified - using makespan

; Plan found with metric 328.846
; States evaluated so far: 62
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.06
0.000: (move vehicle0 wp_init_auv0 waypoint18)  [3.716]
3.717: (move vehicle0 waypoint18 waypoint14)  [53.100]
56.818: (move vehicle0 waypoint14 waypoint10)  [48.416]
105.235: (harvest-energy vehicle0)  [2.631]
107.867: (localize-cable vehicle0 waypoint10 turbine2)  [5.000]
112.868: (inspect-turbine vehicle0 data2 waypoint10 currenttide turbine2)  [200.000]
312.869: (surface vehicle0)  [5.000]
317.870: (harvest-energy vehicle0)  [8.975]
326.846: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 328.846
b (0.000 | 328.846)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 260
; Cost: 328.846
; Time 0.27
0.000: (move vehicle0 wp_init_auv0 waypoint18)  [3.716]
3.717: (move vehicle0 waypoint18 waypoint14)  [53.100]
56.818: (move vehicle0 waypoint14 waypoint10)  [48.416]
105.235: (harvest-energy vehicle0)  [2.631]
107.867: (localize-cable vehicle0 waypoint10 turbine2)  [5.000]
112.868: (inspect-turbine vehicle0 data2 waypoint10 currenttide turbine2)  [200.000]
312.869: (surface vehicle0)  [5.000]
317.870: (harvest-energy vehicle0)  [8.975]
326.846: (upload-data-histograms vehicle0 data2)  [2.000]
