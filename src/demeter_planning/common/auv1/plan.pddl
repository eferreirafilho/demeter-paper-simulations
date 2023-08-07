Number of literals: 16
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000, admissible cost estimate 0.000
b (10.000 | 187.415)b (9.000 | 187.415)b (8.000 | 187.415)b (7.000 | 210.752)b (6.000 | 329.436)b (5.000 | 423.842)b (4.000 | 448.844)b (3.000 | 993.904)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (10.000 | 187.415)b (9.000 | 187.415)b (8.000 | 187.415)b (7.000 | 210.752)b (6.000 | 329.436)b (5.000 | 423.842)b (4.000 | 448.844)b (2.000 | 942.462)b (1.000 | 944.463)(G)
; No metric specified - using makespan

; Plan found with metric 944.463
; States evaluated so far: 5189
; States pruned based on pre-heuristic cost lower bound: 0
; Time 5.42
0.000: (move vehicle1 wp_init_auv1 waypoint29)  [10.892]
10.893: (harvest-energy vehicle1)  [10.000]
20.894: (harvest-energy vehicle1)  [10.000]
30.895: (move vehicle1 waypoint29 waypoint26)  [59.123]
90.019: (harvest-energy vehicle1)  [10.000]
100.020: (harvest-energy vehicle1)  [10.000]
110.021: (harvest-energy vehicle1)  [10.000]
120.022: (harvest-energy vehicle1)  [10.000]
130.023: (harvest-energy vehicle1)  [10.000]
140.024: (harvest-energy vehicle1)  [10.000]
150.025: (harvest-energy vehicle1)  [10.000]
160.026: (harvest-energy vehicle1)  [10.000]
170.027: (move vehicle1 waypoint26 waypoint22)  [20.723]
190.751: (harvest-energy vehicle1)  [10.000]
200.752: (harvest-energy vehicle1)  [10.000]
210.753: (move vehicle1 waypoint22 waypoint17)  [48.676]
259.430: (harvest-energy vehicle1)  [10.000]
269.431: (harvest-energy vehicle1)  [10.000]
279.432: (harvest-energy vehicle1)  [10.000]
289.433: (harvest-energy vehicle1)  [10.000]
299.434: (harvest-energy vehicle1)  [10.000]
309.435: (harvest-energy vehicle1)  [10.000]
319.436: (harvest-energy vehicle1)  [10.000]
329.437: (move vehicle1 waypoint17 waypoint12)  [44.400]
373.838: (harvest-energy vehicle1)  [10.000]
383.839: (harvest-energy vehicle1)  [10.000]
393.840: (harvest-energy vehicle1)  [10.000]
403.841: (harvest-energy vehicle1)  [10.000]
413.842: (harvest-energy vehicle1)  [10.000]
423.843: (localize-cable vehicle1 waypoint12 turbine2)  [15.000]
777.454: (harvest-energy vehicle1)  [10.000]
787.455: (retrieve-data vehicle1 data2 waypoint12 currenttide currentwaves turbine2)  [55.000]
842.456: (surface vehicle1)  [40.000]
882.457: (harvest-energy vehicle1)  [10.000]
892.458: (harvest-energy vehicle1)  [10.000]
902.459: (harvest-energy vehicle1)  [10.000]
912.460: (harvest-energy vehicle1)  [10.000]
922.461: (harvest-energy vehicle1)  [10.000]
932.462: (harvest-energy vehicle1)  [10.000]
942.463: (upload-data-histograms vehicle1 data2)  [2.000]

 * All goal deadlines now no later than 944.463
b (0.000 | 944.463)