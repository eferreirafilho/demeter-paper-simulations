Number of literals: 10
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle2) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (wait-to-recharge vehicle2) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle2) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 0.500)b (6.000 | 0.500)b (5.000 | 5.501)b (4.000 | 10.502)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 0.500)b (6.000 | 0.500)b (5.000 | 5.501)b (4.000 | 10.502)b (2.000 | 220.486)(G)
; No metric specified - using makespan

; Plan found with metric 222.487
; States evaluated so far: 33
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle2 wp_init_auv2 waypoint27)  [0.500]
0.501: (localize-cable vehicle2 waypoint27 turbine5)  [5.000]
5.502: (submerge-mission vehicle2 data5 waypoint27 currenttide turbine5)  [200.000]
205.503: (surface vehicle2)  [5.000]
210.504: (wait-to-recharge vehicle2)  [9.982]
220.487: (transmit-data vehicle2 data5)  [2.000]

 * All goal deadlines now no later than 222.487
b (0.000 | 222.487)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 82
; Cost: 222.487
; Time 0.07
0.000: (move vehicle2 wp_init_auv2 waypoint27)  [0.500]
0.501: (localize-cable vehicle2 waypoint27 turbine5)  [5.000]
5.502: (submerge-mission vehicle2 data5 waypoint27 currenttide turbine5)  [200.000]
205.503: (surface vehicle2)  [5.000]
210.504: (wait-to-recharge vehicle2)  [9.982]
220.487: (transmit-data vehicle2 data5)  [2.000]
