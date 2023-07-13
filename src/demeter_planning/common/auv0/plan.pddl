Number of literals: 16
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
72% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000, admissible cost estimate 0.000
b (10.000 | 37.716)b (9.000 | 160.636)b (8.000 | 191.152)b (7.000 | 334.530)b (6.000 | 484.479)b (5.000 | 650.772)b (4.000 | 675.774)b (3.000 | 1220.833)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (10.000 | 37.716)b (9.000 | 160.636)b (8.000 | 191.152)b (7.000 | 334.530)b (6.000 | 484.479)b (5.000 | 650.772)b (4.000 | 675.774)b (2.000 | 873.722)b (1.000 | 875.723)(G)
; No metric specified - using makespan

; Plan found with metric 875.723
; States evaluated so far: 8214
; States pruned based on pre-heuristic cost lower bound: 0
; Time 9.60
0.000: (move vehicle0 wp_init_auv0 waypoint52)  [17.714]
17.715: (harvest-energy vehicle0)  [10.000]
27.716: (harvest-energy vehicle0)  [10.000]
37.717: (move vehicle0 waypoint52 waypoint50)  [72.914]
110.632: (harvest-energy vehicle0)  [10.000]
120.633: (harvest-energy vehicle0)  [10.000]
130.634: (harvest-energy vehicle0)  [10.000]
140.635: (harvest-energy vehicle0)  [10.000]
150.636: (harvest-energy vehicle0)  [10.000]
160.637: (move vehicle0 waypoint50 waypoint49)  [20.514]
181.152: (harvest-energy vehicle0)  [10.000]
191.153: (move vehicle0 waypoint49 waypoint44)  [83.371]
274.525: (harvest-energy vehicle0)  [10.000]
284.526: (harvest-energy vehicle0)  [10.000]
294.527: (harvest-energy vehicle0)  [10.000]
304.528: (harvest-energy vehicle0)  [10.000]
314.529: (harvest-energy vehicle0)  [10.000]
324.530: (harvest-energy vehicle0)  [10.000]
334.531: (move vehicle0 waypoint44 waypoint39)  [89.942]
424.474: (harvest-energy vehicle0)  [10.000]
434.475: (harvest-energy vehicle0)  [10.000]
444.476: (harvest-energy vehicle0)  [10.000]
454.477: (harvest-energy vehicle0)  [10.000]
464.478: (harvest-energy vehicle0)  [10.000]
474.479: (harvest-energy vehicle0)  [10.000]
484.480: (move vehicle0 waypoint39 waypoint67)  [96.285]
580.766: (harvest-energy vehicle0)  [10.000]
590.767: (harvest-energy vehicle0)  [10.000]
600.768: (harvest-energy vehicle0)  [10.000]
610.769: (harvest-energy vehicle0)  [10.000]
620.770: (harvest-energy vehicle0)  [10.000]
630.771: (harvest-energy vehicle0)  [10.000]
640.772: (harvest-energy vehicle0)  [10.000]
650.773: (localize-cable vehicle0 waypoint67 turbine13)  [15.000]
708.714: (harvest-energy vehicle0)  [10.000]
718.715: (retrieve-data vehicle0 data13 waypoint67 currenttide turbine13)  [55.000]
773.716: (surface vehicle0)  [40.000]
813.717: (harvest-energy vehicle0)  [10.000]
823.718: (harvest-energy vehicle0)  [10.000]
833.719: (harvest-energy vehicle0)  [10.000]
843.720: (harvest-energy vehicle0)  [10.000]
853.721: (harvest-energy vehicle0)  [10.000]
863.722: (harvest-energy vehicle0)  [10.000]
873.723: (upload-data-histograms vehicle0 data13)  [2.000]

 * All goal deadlines now no later than 875.723
b (0.000 | 875.723)