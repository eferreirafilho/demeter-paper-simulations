Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle1) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle1) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle1) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 4.266)b (10.000 | 4.266)b (9.000 | 126.184)b (8.000 | 126.184)b (6.000 | 129.340)b (5.000 | 139.341)b (4.000 | 139.342)b (2.000 | 353.820)(G)
; No metric specified - using makespan

; Plan found with metric 355.821
; States evaluated so far: 23
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle1 wp_init_auv1 waypoint37)  [4.266]
4.267: (move vehicle1 waypoint37 waypoint15)  [77.833]
82.101: (move vehicle1 waypoint15 waypoint17)  [44.083]
126.185: (harvest-energy vehicle1)  [3.155]
129.341: (localize-cable vehicle1 waypoint17 turbine3)  [5.000]
134.342: (surface vehicle1)  [5.000]
139.343: (inspect-turbine vehicle1 data3 waypoint17 currenttide turbine3)  [200.000]
339.344: (surface vehicle1)  [5.000]
344.345: (harvest-energy vehicle1)  [9.475]
353.821: (upload-data-histograms vehicle1 data3)  [2.000]

 * All goal deadlines now no later than 355.821

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 4.266)b (10.000 | 4.266)b (9.000 | 126.184)b (8.000 | 126.184)b (6.000 | 129.340)b (5.000 | 139.341)b (4.000 | 139.342)b (2.000 | 348.319)(G)
; No metric specified - using makespan

; Plan found with metric 350.320
; States evaluated so far: 63
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.06
0.000: (move vehicle1 wp_init_auv1 waypoint37)  [4.266]
4.267: (move vehicle1 waypoint37 waypoint15)  [77.833]
82.101: (move vehicle1 waypoint15 waypoint17)  [44.083]
126.185: (harvest-energy vehicle1)  [3.155]
129.341: (localize-cable vehicle1 waypoint17 turbine3)  [5.000]
134.342: (inspect-turbine vehicle1 data3 waypoint17 currenttide turbine3)  [200.000]
334.343: (surface vehicle1)  [5.000]
339.344: (harvest-energy vehicle1)  [8.975]
348.320: (upload-data-histograms vehicle1 data3)  [2.000]

 * All goal deadlines now no later than 350.320
b (0.000 | 350.320)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 261
; Cost: 350.320
; Time 0.27
0.000: (move vehicle1 wp_init_auv1 waypoint37)  [4.266]
4.267: (move vehicle1 waypoint37 waypoint15)  [77.833]
82.101: (move vehicle1 waypoint15 waypoint17)  [44.083]
126.185: (harvest-energy vehicle1)  [3.155]
129.341: (localize-cable vehicle1 waypoint17 turbine3)  [5.000]
134.342: (inspect-turbine vehicle1 data3 waypoint17 currenttide turbine3)  [200.000]
334.343: (surface vehicle1)  [5.000]
339.344: (harvest-energy vehicle1)  [8.975]
348.320: (upload-data-histograms vehicle1 data3)  [2.000]
