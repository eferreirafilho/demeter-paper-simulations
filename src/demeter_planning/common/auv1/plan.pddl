Number of literals: 16
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
72% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000, admissible cost estimate 0.000
b (10.000 | 40.202)b (9.000 | 188.380)b (8.000 | 311.300)b (7.000 | 351.817)b (6.000 | 485.194)b (5.000 | 652.944)b (4.000 | 677.946)b (3.000 | 1223.006)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (10.000 | 40.202)b (9.000 | 188.380)b (8.000 | 311.300)b (7.000 | 351.817)b (6.000 | 485.194)b (5.000 | 652.944)b (4.000 | 677.946)b (2.000 | 873.757)b (1.000 | 875.757)(G)
; No metric specified - using makespan

; Plan found with metric 875.758
; States evaluated so far: 8557
; States pruned based on pre-heuristic cost lower bound: 0
; Time 8.86
0.000: (move vehicle1 wp_init_auv1 waypoint29)  [20.200]
20.201: (harvest-energy vehicle1)  [10.000]
30.202: (harvest-energy vehicle1)  [10.000]
40.203: (move vehicle1 waypoint29 waypoint52)  [88.171]
128.375: (harvest-energy vehicle1)  [10.000]
138.376: (harvest-energy vehicle1)  [10.000]
148.377: (harvest-energy vehicle1)  [10.000]
158.378: (harvest-energy vehicle1)  [10.000]
168.379: (harvest-energy vehicle1)  [10.000]
178.380: (harvest-energy vehicle1)  [10.000]
188.381: (move vehicle1 waypoint52 waypoint50)  [72.914]
261.296: (harvest-energy vehicle1)  [10.000]
271.297: (harvest-energy vehicle1)  [10.000]
281.298: (harvest-energy vehicle1)  [10.000]
291.299: (harvest-energy vehicle1)  [10.000]
301.300: (harvest-energy vehicle1)  [10.000]
311.301: (move vehicle1 waypoint50 waypoint49)  [20.514]
331.816: (harvest-energy vehicle1)  [10.000]
341.817: (harvest-energy vehicle1)  [10.000]
351.818: (move vehicle1 waypoint49 waypoint44)  [83.371]
435.190: (harvest-energy vehicle1)  [10.000]
445.191: (harvest-energy vehicle1)  [10.000]
455.192: (harvest-energy vehicle1)  [10.000]
465.193: (harvest-energy vehicle1)  [10.000]
475.194: (harvest-energy vehicle1)  [10.000]
485.195: (move vehicle1 waypoint44 waypoint72)  [97.742]
582.938: (harvest-energy vehicle1)  [10.000]
592.939: (harvest-energy vehicle1)  [10.000]
602.940: (harvest-energy vehicle1)  [10.000]
612.941: (harvest-energy vehicle1)  [10.000]
622.942: (harvest-energy vehicle1)  [10.000]
632.943: (harvest-energy vehicle1)  [10.000]
642.944: (harvest-energy vehicle1)  [10.000]
652.945: (localize-cable vehicle1 waypoint72 turbine14)  [15.000]
708.749: (harvest-energy vehicle1)  [10.000]
718.750: (retrieve-data vehicle1 data14 waypoint72 currenttide turbine14)  [55.000]
773.751: (surface vehicle1)  [40.000]
813.752: (harvest-energy vehicle1)  [10.000]
823.753: (harvest-energy vehicle1)  [10.000]
833.754: (harvest-energy vehicle1)  [10.000]
843.755: (harvest-energy vehicle1)  [10.000]
853.756: (harvest-energy vehicle1)  [10.000]
863.757: (harvest-energy vehicle1)  [10.000]
873.758: (upload-data-histograms vehicle1 data14)  [2.000]

 * All goal deadlines now no later than 875.758
b (0.000 | 875.758)(G)(G)