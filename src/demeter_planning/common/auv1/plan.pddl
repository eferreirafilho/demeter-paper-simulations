Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
50% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 25.355)b (5.000 | 25.355)b (4.000 | 42.464)b (2.000 | 197.472)b (1.000 | 199.473)(G)
; No metric specified - using makespan

; Plan found with metric 199.473
; States evaluated so far: 42
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.07
0.000: (move vehicle1 wp_init_auv1 waypoint2)  [7.461]
7.462: (harvest-energy vehicle1)  [10.000]
17.463: (localize-cable vehicle1 waypoint2 turbine0)  [15.000]
32.464: (harvest-energy vehicle1)  [10.000]
42.465: (retrieve-data vehicle1 data0 waypoint2 currenttide currentwaves turbine0)  [55.000]
97.466: (surface vehicle1)  [40.000]
137.467: (harvest-energy vehicle1)  [10.000]
147.468: (harvest-energy vehicle1)  [10.000]
157.469: (harvest-energy vehicle1)  [10.000]
167.470: (harvest-energy vehicle1)  [10.000]
177.471: (harvest-energy vehicle1)  [10.000]
187.472: (harvest-energy vehicle1)  [10.000]
197.473: (upload-data-histograms vehicle1 data0)  [2.000]

 * All goal deadlines now no later than 199.473

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 25.355)b (5.000 | 25.355)b (4.000 | 42.464)b (2.000 | 197.472)b (1.000 | 199.473)