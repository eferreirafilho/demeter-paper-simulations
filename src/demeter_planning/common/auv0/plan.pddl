Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle0) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (wait-to-recharge vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 52.000)b (10.000 | 52.000)b (9.000 | 1381.501)b (8.000 | 1381.501)b (7.000 | 1633.002)b (6.000 | 1633.002)b (5.000 | 1638.003)b (4.000 | 1643.004)b (2.000 | 1857.502)(G)
; No metric specified - using makespan

; Plan found with metric 1859.503
; States evaluated so far: 20
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle0 wp_init_auv0 waypoint12)  [52.000]
52.001: (move vehicle0 waypoint12 waypoint3)  [1329.500]
1381.502: (move vehicle0 waypoint3 waypoint2)  [251.500]
1633.003: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
1638.004: (surface vehicle0)  [5.000]
1643.005: (submerge-mission vehicle0 data0 waypoint2 currenttide turbine0)  [200.000]
1843.006: (surface vehicle0)  [5.000]
1848.007: (wait-to-recharge vehicle0)  [9.495]
1857.503: (transmit-data vehicle0 data0)  [2.000]

 * All goal deadlines now no later than 1859.503

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 52.000)b (10.000 | 52.000)b (9.000 | 1381.501)b (8.000 | 1381.501)b (7.000 | 1633.002)b (6.000 | 1633.002)b (5.000 | 1638.003)b (4.000 | 1643.004)b (2.000 | 1852.001)(G)
; No metric specified - using makespan

; Plan found with metric 1854.002
; States evaluated so far: 55
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.05
0.000: (move vehicle0 wp_init_auv0 waypoint12)  [52.000]
52.001: (move vehicle0 waypoint12 waypoint3)  [1329.500]
1381.502: (move vehicle0 waypoint3 waypoint2)  [251.500]
1633.003: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
1638.004: (submerge-mission vehicle0 data0 waypoint2 currenttide turbine0)  [200.000]
1838.005: (surface vehicle0)  [5.000]
1843.006: (wait-to-recharge vehicle0)  [8.995]
1852.002: (transmit-data vehicle0 data0)  [2.000]

 * All goal deadlines now no later than 1854.002
b (0.000 | 1854.002)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 73
; Cost: 1854.002
; Time 0.06
0.000: (move vehicle0 wp_init_auv0 waypoint12)  [52.000]
52.001: (move vehicle0 waypoint12 waypoint3)  [1329.500]
1381.502: (move vehicle0 waypoint3 waypoint2)  [251.500]
1633.003: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
1638.004: (submerge-mission vehicle0 data0 waypoint2 currenttide turbine0)  [200.000]
1838.005: (surface vehicle0)  [5.000]
1843.006: (wait-to-recharge vehicle0)  [8.995]
1852.002: (transmit-data vehicle0 data0)  [2.000]
