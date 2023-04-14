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
b (7.000 | 209.500)b (6.000 | 209.500)b (5.000 | 214.501)b (4.000 | 219.502)b (2.000 | 434.279)(G)
; No metric specified - using makespan

; Plan found with metric 436.280
; States evaluated so far: 16
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [209.500]
209.501: (localize-cable vehicle1 waypoint32 turbine6)  [5.000]
214.502: (surface vehicle1)  [5.000]
219.503: (submerge-mission vehicle1 data6 waypoint32 currenttide turbine6)  [200.000]
419.504: (surface vehicle1)  [5.000]
424.505: (wait-to-recharge vehicle1)  [9.774]
434.280: (transmit-data vehicle1 data6)  [2.000]

 * All goal deadlines now no later than 436.280

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 209.500)b (6.000 | 209.500)b (5.000 | 214.501)b (4.000 | 219.502)b (2.000 | 428.778)(G)
; No metric specified - using makespan

; Plan found with metric 430.779
; States evaluated so far: 44
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.04
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [209.500]
209.501: (localize-cable vehicle1 waypoint32 turbine6)  [5.000]
214.502: (submerge-mission vehicle1 data6 waypoint32 currenttide turbine6)  [200.000]
414.503: (surface vehicle1)  [5.000]
419.504: (wait-to-recharge vehicle1)  [9.274]
428.779: (transmit-data vehicle1 data6)  [2.000]

 * All goal deadlines now no later than 430.779
b (0.000 | 430.779)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 98
; Cost: 430.779
; Time 0.09
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [209.500]
209.501: (localize-cable vehicle1 waypoint32 turbine6)  [5.000]
214.502: (submerge-mission vehicle1 data6 waypoint32 currenttide turbine6)  [200.000]
414.503: (surface vehicle1)  [5.000]
419.504: (wait-to-recharge vehicle1)  [9.274]
428.779: (transmit-data vehicle1 data6)  [2.000]
