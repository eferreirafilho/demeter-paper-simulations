Number of literals: 15
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000, admissible cost estimate 0.000
b (10.000 | 358.705)b (9.000 | 358.705)b (8.000 | 358.705)b (7.000 | 358.705)b (6.000 | 358.902)b (5.000 | 502.280)b (4.000 | 527.282)b (3.000 | 1072.342)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (10.000 | 358.705)b (9.000 | 358.705)b (8.000 | 358.705)b (7.000 | 358.705)b (6.000 | 358.902)b (5.000 | 502.280)b (4.000 | 527.282)b (2.000 | 873.747)b (1.000 | 875.747)(G)
; No metric specified - using makespan

; Plan found with metric 875.748
; States evaluated so far: 5920
; States pruned based on pre-heuristic cost lower bound: 0
; Time 5.85
0.000: (move vehicle1 wp_init_auv1 waypoint67)  [16.885]
16.886: (harvest-energy vehicle1)  [10.000]
26.887: (harvest-energy vehicle1)  [10.000]
36.888: (move vehicle1 waypoint67 waypoint39)  [96.285]
133.174: (harvest-energy vehicle1)  [10.000]
143.175: (harvest-energy vehicle1)  [10.000]
153.176: (harvest-energy vehicle1)  [10.000]
163.177: (harvest-energy vehicle1)  [10.000]
173.178: (harvest-energy vehicle1)  [10.000]
183.179: (harvest-energy vehicle1)  [10.000]
193.180: (move vehicle1 waypoint39 waypoint40)  [20.514]
213.695: (harvest-energy vehicle1)  [10.000]
223.696: (harvest-energy vehicle1)  [10.000]
233.698: (move vehicle1 waypoint40 waypoint42)  [75.199]
308.898: (harvest-energy vehicle1)  [10.000]
318.899: (harvest-energy vehicle1)  [10.000]
328.900: (harvest-energy vehicle1)  [10.000]
338.901: (harvest-energy vehicle1)  [10.000]
348.902: (harvest-energy vehicle1)  [10.000]
358.903: (move vehicle1 waypoint42 waypoint47)  [83.371]
442.275: (harvest-energy vehicle1)  [10.000]
452.276: (harvest-energy vehicle1)  [10.000]
462.277: (harvest-energy vehicle1)  [10.000]
472.278: (harvest-energy vehicle1)  [10.000]
482.279: (harvest-energy vehicle1)  [10.000]
492.280: (harvest-energy vehicle1)  [10.000]
502.281: (localize-cable vehicle1 waypoint47 turbine9)  [15.000]
708.739: (harvest-energy vehicle1)  [10.000]
718.740: (retrieve-data vehicle1 data9 waypoint47 currenttide turbine9)  [55.000]
773.741: (surface vehicle1)  [40.000]
813.742: (harvest-energy vehicle1)  [10.000]
823.743: (harvest-energy vehicle1)  [10.000]
833.744: (harvest-energy vehicle1)  [10.000]
843.745: (harvest-energy vehicle1)  [10.000]
853.746: (harvest-energy vehicle1)  [10.000]
863.747: (harvest-energy vehicle1)  [10.000]
873.748: (upload-data-histograms vehicle1 data9)  [2.000]

 * All goal deadlines now no later than 875.748
b (0.000 | 875.748)(G)(G)(G)