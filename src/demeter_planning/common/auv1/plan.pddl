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
b (11.000 | 17.700)b (10.000 | 17.700)b (9.000 | 185.802)b (8.000 | 185.802)b (6.000 | 190.670)b (5.000 | 200.672)b (4.000 | 200.672)b (2.000 | 415.150)(G)
; No metric specified - using makespan

; Plan found with metric 417.151
; States evaluated so far: 24
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.03
0.000: (move vehicle1 wp_init_auv1 waypoint42)  [17.700]
17.701: (move vehicle1 waypoint42 waypoint5)  [150.900]
168.602: (move vehicle1 waypoint5 waypoint2)  [17.200]
185.803: (harvest-energy vehicle1)  [4.867]
190.671: (localize-cable vehicle1 waypoint2 turbine0)  [5.000]
195.672: (surface vehicle1)  [5.000]
200.673: (inspect-turbine vehicle1 data0 waypoint2 currenttide turbine0)  [200.000]
400.674: (surface vehicle1)  [5.000]
405.675: (harvest-energy vehicle1)  [9.475]
415.151: (upload-data-histograms vehicle1 data0)  [2.000]

 * All goal deadlines now no later than 417.151

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 17.700)b (10.000 | 17.700)b (9.000 | 185.802)b (8.000 | 185.802)b (6.000 | 190.670)b (5.000 | 200.672)b (4.000 | 200.672)b (2.000 | 409.649)(G)
; No metric specified - using makespan

; Plan found with metric 411.650
; States evaluated so far: 65
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.08
0.000: (move vehicle1 wp_init_auv1 waypoint42)  [17.700]
17.701: (move vehicle1 waypoint42 waypoint5)  [150.900]
168.602: (move vehicle1 waypoint5 waypoint2)  [17.200]
185.803: (harvest-energy vehicle1)  [4.867]
190.671: (localize-cable vehicle1 waypoint2 turbine0)  [5.000]
195.672: (inspect-turbine vehicle1 data0 waypoint2 currenttide turbine0)  [200.000]
395.673: (surface vehicle1)  [5.000]
400.674: (harvest-energy vehicle1)  [8.975]
409.650: (upload-data-histograms vehicle1 data0)  [2.000]

 * All goal deadlines now no later than 411.650
b (0.000 | 411.650)(G)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 289
; Cost: 411.650
; Time 0.39
0.000: (move vehicle1 wp_init_auv1 waypoint42)  [17.700]
17.701: (move vehicle1 waypoint42 waypoint5)  [150.900]
168.602: (move vehicle1 waypoint5 waypoint2)  [17.200]
185.803: (harvest-energy vehicle1)  [4.867]
190.671: (localize-cable vehicle1 waypoint2 turbine0)  [5.000]
195.672: (inspect-turbine vehicle1 data0 waypoint2 currenttide turbine0)  [200.000]
395.673: (surface vehicle1)  [5.000]
400.674: (harvest-energy vehicle1)  [8.975]
409.650: (upload-data-histograms vehicle1 data0)  [2.000]
