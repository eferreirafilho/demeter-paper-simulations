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
b (11.000 | 134.233)b (10.000 | 134.233)b (9.000 | 150.117)b (8.000 | 150.117)b (6.000 | 155.893)b (5.000 | 165.894)b (4.000 | 165.895)b (2.000 | 380.373)(G)
; No metric specified - using makespan

; Plan found with metric 382.374
; States evaluated so far: 25
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle0 wp_init_auv0 waypoint28)  [6.916]
6.917: (move vehicle0 waypoint28 waypoint11)  [127.316]
134.234: (move vehicle0 waypoint11 waypoint7)  [15.883]
150.118: (harvest-energy vehicle0)  [5.775]
155.894: (localize-cable vehicle0 waypoint7 turbine1)  [5.000]
160.895: (surface vehicle0)  [5.000]
165.896: (inspect-turbine vehicle0 data1 waypoint7 currenttide turbine1)  [200.000]
365.897: (surface vehicle0)  [5.000]
370.898: (harvest-energy vehicle0)  [9.475]
380.374: (upload-data-histograms vehicle0 data1)  [2.000]

 * All goal deadlines now no later than 382.374

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 134.233)b (10.000 | 134.233)b (9.000 | 150.117)b (8.000 | 150.117)b (6.000 | 155.893)b (5.000 | 165.894)b (4.000 | 165.895)b (2.000 | 374.872)(G)
; No metric specified - using makespan

; Plan found with metric 376.873
; States evaluated so far: 65
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.06
0.000: (move vehicle0 wp_init_auv0 waypoint28)  [6.916]
6.917: (move vehicle0 waypoint28 waypoint11)  [127.316]
134.234: (move vehicle0 waypoint11 waypoint7)  [15.883]
150.118: (harvest-energy vehicle0)  [5.775]
155.894: (localize-cable vehicle0 waypoint7 turbine1)  [5.000]
160.895: (inspect-turbine vehicle0 data1 waypoint7 currenttide turbine1)  [200.000]
360.896: (surface vehicle0)  [5.000]
365.897: (harvest-energy vehicle0)  [8.975]
374.873: (upload-data-histograms vehicle0 data1)  [2.000]

 * All goal deadlines now no later than 376.873
b (0.000 | 376.873)(G)b (0.000 | 376.873)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 290
; Cost: 376.873
; Time 0.32
0.000: (move vehicle0 wp_init_auv0 waypoint28)  [6.916]
6.917: (move vehicle0 waypoint28 waypoint11)  [127.316]
134.234: (move vehicle0 waypoint11 waypoint7)  [15.883]
150.118: (harvest-energy vehicle0)  [5.775]
155.894: (localize-cable vehicle0 waypoint7 turbine1)  [5.000]
160.895: (inspect-turbine vehicle0 data1 waypoint7 currenttide turbine1)  [200.000]
360.896: (surface vehicle0)  [5.000]
365.897: (harvest-energy vehicle0)  [8.975]
374.873: (upload-data-histograms vehicle0 data1)  [2.000]
