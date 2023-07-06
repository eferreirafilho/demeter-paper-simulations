Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 38.344)b (6.000 | 193.093)b (5.000 | 334.357)b (4.000 | 359.359)b (3.000 | 904.418)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 38.344)b (6.000 | 193.093)b (5.000 | 334.357)b (4.000 | 359.359)b (2.000 | 514.367)b (1.000 | 516.367)(G)
; No metric specified - using makespan

; Plan found with metric 516.368
; States evaluated so far: 4213
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.01
0.000: (move vehicle0 wp_init_auv0 waypoint19)  [18.342]
18.343: (harvest-energy vehicle0)  [10.000]
28.344: (harvest-energy vehicle0)  [10.000]
38.345: (move vehicle0 waypoint19 waypoint52)  [94.742]
133.088: (harvest-energy vehicle0)  [10.000]
143.089: (harvest-energy vehicle0)  [10.000]
153.090: (harvest-energy vehicle0)  [10.000]
163.091: (harvest-energy vehicle0)  [10.000]
173.092: (harvest-energy vehicle0)  [10.000]
183.093: (harvest-energy vehicle0)  [10.000]
193.094: (move vehicle0 waypoint52 waypoint57)  [81.257]
274.352: (harvest-energy vehicle0)  [10.000]
284.353: (harvest-energy vehicle0)  [10.000]
294.354: (harvest-energy vehicle0)  [10.000]
304.355: (harvest-energy vehicle0)  [10.000]
314.356: (harvest-energy vehicle0)  [10.000]
324.357: (harvest-energy vehicle0)  [10.000]
334.358: (localize-cable vehicle0 waypoint57 turbine11)  [15.000]
349.359: (harvest-energy vehicle0)  [10.000]
359.360: (retrieve-data vehicle0 data11 waypoint57 currenttide turbine11)  [55.000]
414.361: (surface vehicle0)  [40.000]
454.362: (harvest-energy vehicle0)  [10.000]
464.363: (harvest-energy vehicle0)  [10.000]
474.364: (harvest-energy vehicle0)  [10.000]
484.365: (harvest-energy vehicle0)  [10.000]
494.366: (harvest-energy vehicle0)  [10.000]
504.367: (harvest-energy vehicle0)  [10.000]
514.368: (upload-data-histograms vehicle0 data11)  [2.000]

 * All goal deadlines now no later than 516.368
b (0.000 | 516.368)(G)(G)(G)