Number of literals: 10
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle1) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (wait-to-recharge vehicle1) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle1) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 61.000)b (6.000 | 61.000)b (5.000 | 66.001)b (4.000 | 71.002)b (2.000 | 285.500)(G)
; No metric specified - using makespan

; Plan found with metric 287.501
; States evaluated so far: 16
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [61.000]
61.001: (localize-cable vehicle1 waypoint32 turbine6)  [5.000]
66.002: (surface vehicle1)  [5.000]
71.003: (submerge-mission vehicle1 data6 waypoint32 currenttide turbine6)  [200.000]
271.004: (surface vehicle1)  [5.000]
276.005: (wait-to-recharge vehicle1)  [9.495]
285.501: (transmit-data vehicle1 data6)  [2.000]

 * All goal deadlines now no later than 287.501

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 61.000)b (6.000 | 61.000)b (5.000 | 66.001)b (4.000 | 71.002)b (2.000 | 279.999)(G)
; No metric specified - using makespan

; Plan found with metric 282.000
; States evaluated so far: 47
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.04
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [61.000]
61.001: (localize-cable vehicle1 waypoint32 turbine6)  [5.000]
66.002: (submerge-mission vehicle1 data6 waypoint32 currenttide turbine6)  [200.000]
266.003: (surface vehicle1)  [5.000]
271.004: (wait-to-recharge vehicle1)  [8.995]
280.000: (transmit-data vehicle1 data6)  [2.000]

 * All goal deadlines now no later than 282.000
b (0.000 | 282.000)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 65
; Cost: 282.000
; Time 0.05
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [61.000]
61.001: (localize-cable vehicle1 waypoint32 turbine6)  [5.000]
66.002: (submerge-mission vehicle1 data6 waypoint32 currenttide turbine6)  [200.000]
266.003: (surface vehicle1)  [5.000]
271.004: (wait-to-recharge vehicle1)  [8.995]
280.000: (transmit-data vehicle1 data6)  [2.000]
