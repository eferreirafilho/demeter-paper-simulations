Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 14.000, admissible cost estimate 0.000
b (13.000 | 8.150)b (12.000 | 8.150)b (10.000 | 56.434)b (9.000 | 157.952)b (8.000 | 157.952)b (6.000 | 162.468)b (5.000 | 172.469)b (4.000 | 172.470)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (13.000 | 8.150)b (12.000 | 8.150)b (10.000 | 56.434)b (9.000 | 157.952)b (8.000 | 157.952)b (6.000 | 162.468)b (5.000 | 172.469)b (4.000 | 172.470)b (2.000 | 262.301)(G)
; No metric specified - using makespan

; Plan found with metric 264.302
; States evaluated so far: 891
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.98
0.000: (move vehicle0 wp_init_auv0 waypoint22)  [8.150]
8.151: (move vehicle0 waypoint22 waypoint18)  [48.283]
56.435: (move vehicle0 waypoint18 waypoint14)  [53.100]
109.536: (move vehicle0 waypoint14 waypoint10)  [48.416]
157.953: (harvest-energy vehicle0)  [4.515]
193.823: (localize-cable vehicle0 waypoint10 turbine2)  [5.000]
198.824: (retrieve-data vehicle0 data2 waypoint10 currenttide turbine2)  [50.000]
248.825: (surface vehicle0)  [5.000]
253.826: (harvest-energy vehicle0)  [8.475]
262.302: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 264.302
b (0.000 | 264.302)