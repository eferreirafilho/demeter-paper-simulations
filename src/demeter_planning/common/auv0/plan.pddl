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
b (11.000 | 3.916)b (10.000 | 3.916)b (8.000 | 73.350)b (6.000 | 140.736)b (5.000 | 150.737)b (4.000 | 150.738)b (2.000 | 365.216)(G)
; No metric specified - using makespan

; Plan found with metric 367.217
; States evaluated so far: 22
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle0 wp_init_auv0 waypoint70)  [3.916]
3.917: (move vehicle0 waypoint70 waypoint46)  [69.433]
73.353: (move vehicle0 waypoint46 waypoint26)  [63.949]
137.303: (harvest-energy vehicle0)  [3.433]
140.737: (localize-cable vehicle0 waypoint26 turbine6)  [5.000]
145.738: (surface vehicle0)  [5.000]
150.739: (inspect-turbine vehicle0 data6 waypoint26 currenttide turbine6)  [200.000]
350.740: (surface vehicle0)  [5.000]
355.741: (harvest-energy vehicle0)  [9.475]
365.217: (upload-data-histograms vehicle0 data6)  [2.000]

 * All goal deadlines now no later than 367.217

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 3.916)b (10.000 | 3.916)b (8.000 | 73.350)b (6.000 | 140.736)b (5.000 | 150.737)b (4.000 | 150.738)b (2.000 | 359.715)(G)
; No metric specified - using makespan

; Plan found with metric 361.716
; States evaluated so far: 62
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.07
0.000: (move vehicle0 wp_init_auv0 waypoint70)  [3.916]
3.917: (move vehicle0 waypoint70 waypoint46)  [69.433]
73.353: (move vehicle0 waypoint46 waypoint26)  [63.949]
137.303: (harvest-energy vehicle0)  [3.433]
140.737: (localize-cable vehicle0 waypoint26 turbine6)  [5.000]
145.738: (inspect-turbine vehicle0 data6 waypoint26 currenttide turbine6)  [200.000]
345.739: (surface vehicle0)  [5.000]
350.740: (harvest-energy vehicle0)  [8.975]
359.716: (upload-data-histograms vehicle0 data6)  [2.000]

 * All goal deadlines now no later than 361.716
b (0.000 | 361.716)(G)b (0.000 | 361.715)(G)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 268
; Cost: 361.716
; Time 0.32
0.000: (move vehicle0 wp_init_auv0 waypoint70)  [3.916]
3.917: (move vehicle0 waypoint70 waypoint46)  [69.433]
73.353: (move vehicle0 waypoint46 waypoint26)  [63.949]
137.303: (harvest-energy vehicle0)  [3.433]
140.737: (localize-cable vehicle0 waypoint26 turbine6)  [5.000]
145.738: (inspect-turbine vehicle0 data6 waypoint26 currenttide turbine6)  [200.000]
345.739: (surface vehicle0)  [5.000]
350.740: (harvest-energy vehicle0)  [8.975]
359.716: (upload-data-histograms vehicle0 data6)  [2.000]
