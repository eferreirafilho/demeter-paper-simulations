Number of literals: 15
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 43.316)b (8.000 | 145.178)b (7.000 | 185.695)b (6.000 | 327.873)b (5.000 | 484.051)b (4.000 | 509.053)b (3.000 | 1054.113)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 43.316)b (8.000 | 145.178)b (7.000 | 185.695)b (6.000 | 327.873)b (5.000 | 484.051)b (4.000 | 509.053)b (2.000 | 873.617)b (1.000 | 875.617)(G)
; No metric specified - using makespan

; Plan found with metric 875.618
; States evaluated so far: 6536
; States pruned based on pre-heuristic cost lower bound: 0
; Time 6.43
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [23.314]
23.315: (harvest-energy vehicle1)  [10.000]
33.316: (harvest-energy vehicle1)  [10.000]
43.317: (move vehicle1 waypoint32 waypoint30)  [61.857]
105.175: (harvest-energy vehicle1)  [10.000]
115.176: (harvest-energy vehicle1)  [10.000]
125.177: (harvest-energy vehicle1)  [10.000]
135.178: (harvest-energy vehicle1)  [10.000]
145.179: (move vehicle1 waypoint30 waypoint29)  [20.514]
165.694: (harvest-energy vehicle1)  [10.000]
175.695: (harvest-energy vehicle1)  [10.000]
185.696: (move vehicle1 waypoint29 waypoint24)  [82.171]
267.868: (harvest-energy vehicle1)  [10.000]
277.869: (harvest-energy vehicle1)  [10.000]
287.870: (harvest-energy vehicle1)  [10.000]
297.871: (harvest-energy vehicle1)  [10.000]
307.872: (harvest-energy vehicle1)  [10.000]
317.873: (harvest-energy vehicle1)  [10.000]
327.874: (move vehicle1 waypoint24 waypoint47)  [96.171]
424.046: (harvest-energy vehicle1)  [10.000]
434.047: (harvest-energy vehicle1)  [10.000]
444.048: (harvest-energy vehicle1)  [10.000]
454.049: (harvest-energy vehicle1)  [10.000]
464.050: (harvest-energy vehicle1)  [10.000]
474.051: (harvest-energy vehicle1)  [10.000]
484.052: (localize-cable vehicle1 waypoint47 turbine9)  [15.000]
708.609: (harvest-energy vehicle1)  [10.000]
718.610: (retrieve-data vehicle1 data9 waypoint47 currenttide turbine9)  [55.000]
773.611: (surface vehicle1)  [40.000]
813.612: (harvest-energy vehicle1)  [10.000]
823.613: (harvest-energy vehicle1)  [10.000]
833.614: (harvest-energy vehicle1)  [10.000]
843.615: (harvest-energy vehicle1)  [10.000]
853.616: (harvest-energy vehicle1)  [10.000]
863.617: (harvest-energy vehicle1)  [10.000]
873.618: (upload-data-histograms vehicle1 data9)  [2.000]

 * All goal deadlines now no later than 875.618
b (0.000 | 875.618)(G)(G)(G)