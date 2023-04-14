Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle0) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (wait-to-recharge vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 14.000, admissible cost estimate 0.000
b (13.000 | 10.500)b (12.000 | 10.500)b (11.000 | 244.001)b (10.000 | 244.001)b (9.000 | 294.302)b (8.000 | 294.302)b (6.000 | 299.303)b (4.000 | 307.799)b (2.000 | 515.801)(G)
; No metric specified - using makespan

; Plan found with metric 517.802
; States evaluated so far: 21
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle0 wp_init_auv0 waypoint17)  [10.500]
10.501: (move vehicle0 waypoint17 waypoint3)  [233.500]
244.002: (move vehicle0 waypoint3 waypoint2)  [50.300]
294.303: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
299.304: (wait-to-recharge vehicle0)  [8.495]
307.800: (submerge-mission vehicle0 data0 waypoint2 currenttide turbine0)  [200.000]
507.801: (wait-to-recharge vehicle0)  [8.000]
515.802: (transmit-data vehicle0 data0)  [2.000]

 * All goal deadlines now no later than 517.802

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (13.000 | 10.500)b (12.000 | 10.500)b (11.000 | 244.001)b (10.000 | 244.001)b (9.000 | 294.302)b (8.000 | 294.302)b (6.000 | 302.303)b (4.000 | 307.304)b (2.000 | 515.801)