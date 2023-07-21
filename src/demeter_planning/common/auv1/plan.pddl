Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
50% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 18.850)b (5.000 | 30.325)b (4.000 | 55.327)b (2.000 | 210.335)b (1.000 | 212.336)(G)
; No metric specified - using makespan

; Plan found with metric 212.336
; States evaluated so far: 46
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.06
0.000: (move vehicle1 wp_init_auv1 waypoint52)  [10.323]
10.324: (harvest-energy vehicle1)  [10.000]
20.325: (harvest-energy vehicle1)  [10.000]
30.326: (localize-cable vehicle1 waypoint52 turbine10)  [15.000]
45.327: (harvest-energy vehicle1)  [10.000]
55.328: (retrieve-data vehicle1 data10 waypoint52 currenttide currentwaves turbine10)  [55.000]
110.329: (surface vehicle1)  [40.000]
150.330: (harvest-energy vehicle1)  [10.000]
160.331: (harvest-energy vehicle1)  [10.000]
170.332: (harvest-energy vehicle1)  [10.000]
180.333: (harvest-energy vehicle1)  [10.000]
190.334: (harvest-energy vehicle1)  [10.000]
200.335: (harvest-energy vehicle1)  [10.000]
210.336: (upload-data-histograms vehicle1 data10)  [2.000]

 * All goal deadlines now no later than 212.336

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 18.850)b (5.000 | 30.325)b (4.000 | 55.327)b (2.000 | 210.335)b (1.000 | 212.336)