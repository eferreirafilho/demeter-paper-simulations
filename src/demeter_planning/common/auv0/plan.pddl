Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle0) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (wait-to-recharge vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-amount vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 14.000, admissible cost estimate 0.000
b (13.000 | 11.800)b (12.000 | 11.800)b (11.000 | 62.101)b (10.000 | 62.101)b (9.000 | 328.002)b (8.000 | 328.002)b (6.000 | 333.003)b (4.000 | 341.499)b (2.000 | 549.501)(G)
; No metric specified - using makespan

; Plan found with metric 551.502
; States evaluated so far: 21
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle0 wp_init_auv0 waypoint2)  [11.800]
11.801: (move vehicle0 waypoint2 waypoint3)  [50.300]
62.102: (move vehicle0 waypoint3 waypoint12)  [265.900]
328.003: (localize-cable vehicle0 waypoint12 turbine2)  [5.000]
333.004: (wait-to-recharge vehicle0)  [8.495]
341.500: (submerge-mission vehicle0 data2 waypoint12 currenttide turbine2)  [200.000]
541.501: (wait-to-recharge vehicle0)  [8.000]
549.502: (transmit-data vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 551.502

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (13.000 | 11.800)b (12.000 | 11.800)b (11.000 | 62.101)b (10.000 | 62.101)b (9.000 | 328.002)b (8.000 | 328.002)b (6.000 | 336.003)b (4.000 | 341.004)b (2.000 | 549.501)