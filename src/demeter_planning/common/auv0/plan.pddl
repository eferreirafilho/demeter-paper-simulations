Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
50% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 21.130)b (5.000 | 21.130)b (4.000 | 42.603)b (2.000 | 197.611)b (1.000 | 199.612)(G)
; No metric specified - using makespan

; Plan found with metric 199.612
; States evaluated so far: 42
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.06
0.000: (move vehicle0 wp_init_auv0 waypoint7)  [7.600]
7.601: (harvest-energy vehicle0)  [10.000]
17.602: (localize-cable vehicle0 waypoint7 turbine1)  [15.000]
32.603: (harvest-energy vehicle0)  [10.000]
42.604: (retrieve-data vehicle0 data1 waypoint7 currenttide currentwaves turbine1)  [55.000]
97.605: (surface vehicle0)  [40.000]
137.606: (harvest-energy vehicle0)  [10.000]
147.607: (harvest-energy vehicle0)  [10.000]
157.608: (harvest-energy vehicle0)  [10.000]
167.609: (harvest-energy vehicle0)  [10.000]
177.610: (harvest-energy vehicle0)  [10.000]
187.611: (harvest-energy vehicle0)  [10.000]
197.612: (upload-data-histograms vehicle0 data1)  [2.000]

 * All goal deadlines now no later than 199.612

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 21.130)b (5.000 | 21.130)b (4.000 | 42.603)b (2.000 | 197.611)b (1.000 | 199.612)