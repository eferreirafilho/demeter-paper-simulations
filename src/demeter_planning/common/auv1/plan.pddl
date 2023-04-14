Number of literals: 9
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle1) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (wait-to-recharge vehicle1) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle1) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 97.300)b (8.000 | 97.300)b (6.000 | 102.301)b (4.000 | 110.797)b (2.000 | 318.799)(G)
; No metric specified - using makespan

; Plan found with metric 320.800
; States evaluated so far: 15
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [97.300]
97.301: (localize-cable vehicle1 waypoint32 turbine6)  [5.000]
102.302: (wait-to-recharge vehicle1)  [8.495]
110.798: (submerge-mission vehicle1 data6 waypoint32 currenttide turbine6)  [200.000]
310.799: (wait-to-recharge vehicle1)  [8.000]
318.800: (transmit-data vehicle1 data6)  [2.000]

 * All goal deadlines now no later than 320.800

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 97.300)b (8.000 | 97.300)b (6.000 | 105.301)b (4.000 | 110.302)b (2.000 | 318.799)(G)b (0.000 | 320.800)