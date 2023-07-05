Number of literals: 15
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 35.830)b (8.000 | 188.437)b (7.000 | 329.701)b (6.000 | 481.908)b (5.000 | 625.286)b (4.000 | 650.288)b (3.000 | 1195.349)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 35.830)b (8.000 | 188.437)b (7.000 | 329.701)b (6.000 | 481.908)b (5.000 | 625.286)b (4.000 | 650.288)b (2.000 | 873.052)b (1.000 | 875.053)(G)
; No metric specified - using makespan

; Plan found with metric 875.053
; States evaluated so far: 7039
; States pruned based on pre-heuristic cost lower bound: 0
; Time 7.18
0.000: (move vehicle0 wp_init_auv0 waypoint34)  [15.828]
15.829: (harvest-energy vehicle0)  [10.000]
25.830: (harvest-energy vehicle0)  [10.000]
35.831: (move vehicle0 waypoint34 waypoint57)  [92.600]
128.432: (harvest-energy vehicle0)  [10.000]
138.433: (harvest-energy vehicle0)  [10.000]
148.434: (harvest-energy vehicle0)  [10.000]
158.435: (harvest-energy vehicle0)  [10.000]
168.436: (harvest-energy vehicle0)  [10.000]
178.437: (harvest-energy vehicle0)  [10.000]
188.438: (move vehicle0 waypoint57 waypoint52)  [81.257]
269.696: (harvest-energy vehicle0)  [10.000]
279.697: (harvest-energy vehicle0)  [10.000]
289.698: (harvest-energy vehicle0)  [10.000]
299.699: (harvest-energy vehicle0)  [10.000]
309.700: (harvest-energy vehicle0)  [10.000]
319.701: (harvest-energy vehicle0)  [10.000]
329.702: (move vehicle0 waypoint52 waypoint47)  [92.200]
421.903: (harvest-energy vehicle0)  [10.000]
431.904: (harvest-energy vehicle0)  [10.000]
441.905: (harvest-energy vehicle0)  [10.000]
451.906: (harvest-energy vehicle0)  [10.000]
461.907: (harvest-energy vehicle0)  [10.000]
471.908: (harvest-energy vehicle0)  [10.000]
481.909: (move vehicle0 waypoint47 waypoint42)  [83.371]
565.281: (harvest-energy vehicle0)  [10.000]
575.282: (harvest-energy vehicle0)  [10.000]
585.283: (harvest-energy vehicle0)  [10.000]
595.284: (harvest-energy vehicle0)  [10.000]
605.285: (harvest-energy vehicle0)  [10.000]
615.286: (harvest-energy vehicle0)  [10.000]
625.287: (localize-cable vehicle0 waypoint42 turbine8)  [15.000]
708.044: (harvest-energy vehicle0)  [10.000]
718.045: (retrieve-data vehicle0 data8 waypoint42 currenttide turbine8)  [55.000]
773.046: (surface vehicle0)  [40.000]
813.047: (harvest-energy vehicle0)  [10.000]
823.048: (harvest-energy vehicle0)  [10.000]
833.049: (harvest-energy vehicle0)  [10.000]
843.050: (harvest-energy vehicle0)  [10.000]
853.051: (harvest-energy vehicle0)  [10.000]
863.052: (harvest-energy vehicle0)  [10.000]
873.053: (upload-data-histograms vehicle0 data8)  [2.000]

 * All goal deadlines now no later than 875.053
b (0.000 | 875.053)