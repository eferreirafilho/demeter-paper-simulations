Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
37% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000, admissible cost estimate 0.000
b (10.000 | 20.900)b (8.000 | 21.901)b (7.000 | 184.205)b (6.000 | 332.459)b (4.000 | 345.462)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (10.000 | 20.900)b (8.000 | 21.901)b (7.000 | 184.205)b (6.000 | 332.459)b (4.000 | 345.462)b (2.000 | 393.875)b (1.000 | 395.876)(G)
; No metric specified - using makespan

; Plan found with metric 395.876
; States evaluated so far: 4024
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.96
0.000: (move vehicle0 wp_init_auv0 waypoint18)  [20.900]
20.901: (harvest-energy vehicle0)  [1.000]
21.903: (move vehicle0 waypoint18 waypoint14)  [159.299]
181.203: (harvest-energy vehicle0)  [1.000]
182.204: (harvest-energy vehicle0)  [1.000]
183.205: (harvest-energy vehicle0)  [1.000]
184.206: (move vehicle0 waypoint14 waypoint10)  [145.250]
329.457: (harvest-energy vehicle0)  [1.000]
330.458: (harvest-energy vehicle0)  [1.000]
331.459: (harvest-energy vehicle0)  [1.000]
332.460: (localize-cable vehicle0 waypoint10 turbine2)  [10.000]
342.461: (surface vehicle0)  [2.000]
357.870: (harvest-energy vehicle0)  [1.000]
358.871: (retrieve-data vehicle0 data2 waypoint10 currenttide turbine2)  [30.000]
388.872: (surface vehicle0)  [2.000]
390.873: (harvest-energy vehicle0)  [1.000]
391.874: (harvest-energy vehicle0)  [1.000]
392.875: (harvest-energy vehicle0)  [1.000]
393.876: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 395.876
b (0.000 | 395.876)