Number of literals: 16
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 34.217)b (8.000 | 171.841)b (7.000 | 294.849)b (6.000 | 331.036)b (5.000 | 488.522)b (4.000 | 513.524)b (3.000 | 1058.584)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 34.217)b (8.000 | 171.841)b (7.000 | 294.849)b (6.000 | 331.036)b (5.000 | 488.522)b (4.000 | 513.524)b (2.000 | 1035.387)b (1.000 | 1037.387)(G)
; No metric specified - using makespan

; Plan found with metric 1037.388
; States evaluated so far: 6756
; States pruned based on pre-heuristic cost lower bound: 0
; Time 8.14
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [14.215]
14.216: (harvest-energy vehicle1)  [10.000]
24.217: (harvest-energy vehicle1)  [10.000]
34.218: (move vehicle1 waypoint32 waypoint27)  [57.615]
91.834: (harvest-energy vehicle1)  [10.000]
101.835: (harvest-energy vehicle1)  [10.000]
111.836: (harvest-energy vehicle1)  [10.000]
121.837: (harvest-energy vehicle1)  [10.000]
131.838: (harvest-energy vehicle1)  [10.000]
141.839: (harvest-energy vehicle1)  [10.000]
151.840: (harvest-energy vehicle1)  [10.000]
161.841: (harvest-energy vehicle1)  [10.000]
171.842: (move vehicle1 waypoint27 waypoint25)  [53.000]
224.843: (harvest-energy vehicle1)  [10.000]
234.844: (harvest-energy vehicle1)  [10.000]
244.845: (harvest-energy vehicle1)  [10.000]
254.846: (harvest-energy vehicle1)  [10.000]
264.847: (harvest-energy vehicle1)  [10.000]
274.848: (harvest-energy vehicle1)  [10.000]
284.849: (harvest-energy vehicle1)  [10.000]
294.850: (move vehicle1 waypoint25 waypoint24)  [16.184]
311.035: (harvest-energy vehicle1)  [10.000]
321.036: (harvest-energy vehicle1)  [10.000]
331.037: (move vehicle1 waypoint24 waypoint47)  [67.476]
398.514: (harvest-energy vehicle1)  [10.000]
408.515: (harvest-energy vehicle1)  [10.000]
418.516: (harvest-energy vehicle1)  [10.000]
428.517: (harvest-energy vehicle1)  [10.000]
438.518: (harvest-energy vehicle1)  [10.000]
448.519: (harvest-energy vehicle1)  [10.000]
458.520: (harvest-energy vehicle1)  [10.000]
468.521: (harvest-energy vehicle1)  [10.000]
478.522: (harvest-energy vehicle1)  [10.000]
488.523: (localize-cable vehicle1 waypoint47 turbine8)  [15.000]
870.379: (harvest-energy vehicle1)  [10.000]
880.380: (retrieve-data vehicle1 data8 waypoint47 currenttide currentwaves turbine8)  [55.000]
935.381: (surface vehicle1)  [40.000]
975.382: (harvest-energy vehicle1)  [10.000]
985.383: (harvest-energy vehicle1)  [10.000]
995.384: (harvest-energy vehicle1)  [10.000]
1005.385: (harvest-energy vehicle1)  [10.000]
1015.386: (harvest-energy vehicle1)  [10.000]
1025.387: (harvest-energy vehicle1)  [10.000]
1035.388: (upload-data-histograms vehicle1 data8)  [2.000]

 * All goal deadlines now no later than 1037.388
b (0.000 | 1037.388)