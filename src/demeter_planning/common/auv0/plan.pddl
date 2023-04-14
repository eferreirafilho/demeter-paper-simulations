Number of literals: 10
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle0) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (wait-to-recharge vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-amount vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 11.700)b (10.000 | 11.700)b (9.000 | 249.900)b (8.000 | 249.901)b (6.000 | 254.902)b (4.000 | 263.398)b (2.000 | 471.400)(G)
; No metric specified - using makespan

; Plan found with metric 473.401
; States evaluated so far: 18
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle0 wp_init_auv0 waypoint7)  [11.700]
11.701: (move vehicle0 waypoint7 waypoint2)  [238.200]
249.902: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
254.903: (wait-to-recharge vehicle0)  [8.495]
263.399: (submerge-mission vehicle0 data0 waypoint2 currenttide turbine0)  [200.000]
463.400: (wait-to-recharge vehicle0)  [8.000]
471.401: (transmit-data vehicle0 data0)  [2.000]

 * All goal deadlines now no later than 473.401

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 11.700)b (10.000 | 11.700)b (9.000 | 249.900)b (8.000 | 249.901)b (6.000 | 257.902)b (4.000 | 262.903)b (2.000 | 471.400)(G)b (0.000 | 473.401)