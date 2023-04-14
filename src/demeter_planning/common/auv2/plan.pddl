Number of literals: 10
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle2) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (wait-to-recharge vehicle2) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle2) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 12.200)b (10.000 | 12.200)b (9.000 | 227.101)b (8.000 | 227.101)b (6.000 | 232.102)b (4.000 | 240.598)b (2.000 | 448.600)(G)
; No metric specified - using makespan

; Plan found with metric 450.601
; States evaluated so far: 18
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle2 wp_init_auv2 waypoint12)  [12.200]
12.201: (move vehicle2 waypoint12 waypoint17)  [214.900]
227.102: (localize-cable vehicle2 waypoint17 turbine3)  [5.000]
232.103: (wait-to-recharge vehicle2)  [8.495]
240.599: (submerge-mission vehicle2 data3 waypoint17 currenttide turbine3)  [200.000]
440.600: (wait-to-recharge vehicle2)  [8.000]
448.601: (transmit-data vehicle2 data3)  [2.000]

 * All goal deadlines now no later than 450.601

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 12.200)b (10.000 | 12.200)b (9.000 | 227.101)b (8.000 | 227.101)b (6.000 | 235.102)b (4.000 | 240.103)b (2.000 | 448.600)