Number of literals: 9
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle2) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (wait-to-recharge vehicle2) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-amount vehicle2) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 0.100)b (8.000 | 0.100)b (6.000 | 5.101)b (4.000 | 13.597)b (2.000 | 221.599)(G)
; No metric specified - using makespan

; Plan found with metric 223.600
; States evaluated so far: 15
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle2 wp_init_auv2 waypoint27)  [0.100]
0.101: (localize-cable vehicle2 waypoint27 turbine5)  [5.000]
5.102: (wait-to-recharge vehicle2)  [8.495]
13.598: (submerge-mission vehicle2 data5 waypoint27 currenttide turbine5)  [200.000]
213.599: (wait-to-recharge vehicle2)  [8.000]
221.600: (transmit-data vehicle2 data5)  [2.000]

 * All goal deadlines now no later than 223.600

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 0.100)b (8.000 | 0.100)b (6.000 | 8.101)b (4.000 | 13.102)b (2.000 | 221.599)