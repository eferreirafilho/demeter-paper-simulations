Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle0) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (wait-to-recharge vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 1.000)b (8.000 | 1.000)b (7.000 | 252.501)b (6.000 | 252.501)b (5.000 | 257.502)b (4.000 | 264.578)b (2.000 | 478.081)(G)
; No metric specified - using makespan

; Plan found with metric 480.082
; States evaluated so far: 20
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle0 wp_init_auv0 waypoint3)  [1.000]
1.001: (move vehicle0 waypoint3 waypoint2)  [251.500]
252.502: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
257.503: (surface vehicle0)  [5.000]
262.504: (wait-to-recharge vehicle0)  [2.074]
264.579: (submerge-mission vehicle0 data0 waypoint2 currenttide turbine0)  [200.000]
464.580: (surface vehicle0)  [5.000]
469.581: (wait-to-recharge vehicle0)  [8.500]
478.082: (transmit-data vehicle0 data0)  [2.000]

 * All goal deadlines now no later than 480.082

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 1.000)b (8.000 | 1.000)b (7.000 | 252.501)b (6.000 | 252.501)b (5.000 | 257.502)b (4.000 | 263.583)b (2.000 | 472.580)(G)
; No metric specified - using makespan

; Plan found with metric 474.581
; States evaluated so far: 67
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.06
0.000: (move vehicle0 wp_init_auv0 waypoint3)  [1.000]
1.001: (move vehicle0 waypoint3 waypoint2)  [251.500]
252.502: (wait-to-recharge vehicle0)  [1.079]
253.582: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
258.583: (submerge-mission vehicle0 data0 waypoint2 currenttide turbine0)  [200.000]
458.584: (surface vehicle0)  [5.000]
463.585: (wait-to-recharge vehicle0)  [8.995]
472.581: (transmit-data vehicle0 data0)  [2.000]

 * All goal deadlines now no later than 474.581
b (0.000 | 474.581)(G)b (0.000 | 474.581)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 147
; Cost: 474.581
; Time 0.14
0.000: (move vehicle0 wp_init_auv0 waypoint3)  [1.000]
1.001: (move vehicle0 waypoint3 waypoint2)  [251.500]
252.502: (wait-to-recharge vehicle0)  [1.079]
253.582: (localize-cable vehicle0 waypoint2 turbine0)  [5.000]
258.583: (submerge-mission vehicle0 data0 waypoint2 currenttide turbine0)  [200.000]
458.584: (surface vehicle0)  [5.000]
463.585: (wait-to-recharge vehicle0)  [8.995]
472.581: (transmit-data vehicle0 data0)  [2.000]
