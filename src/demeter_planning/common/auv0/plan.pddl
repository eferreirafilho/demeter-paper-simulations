Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 358.720)b (7.000 | 358.720)b (6.000 | 358.720)b (5.000 | 358.720)b (4.000 | 358.720)b (2.000 | 513.728)b (1.000 | 515.728)(G)
; No metric specified - using makespan

; Plan found with metric 515.729
; States evaluated so far: 108
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.14
0.000: (move vehicle0 wp_init_auv0 waypoint19)  [18.342]
18.343: (harvest-energy vehicle0)  [10.000]
28.344: (harvest-energy vehicle0)  [10.000]
38.345: (move vehicle0 waypoint19 waypoint16)  [112.028]
150.374: (harvest-energy vehicle0)  [10.000]
160.375: (harvest-energy vehicle0)  [10.000]
170.376: (harvest-energy vehicle0)  [10.000]
180.377: (harvest-energy vehicle0)  [10.000]
190.378: (harvest-energy vehicle0)  [10.000]
200.379: (harvest-energy vehicle0)  [10.000]
210.380: (harvest-energy vehicle0)  [10.000]
220.381: (harvest-energy vehicle0)  [10.000]
230.382: (move vehicle0 waypoint16 waypoint12)  [38.485]
268.868: (harvest-energy vehicle0)  [10.000]
278.869: (harvest-energy vehicle0)  [10.000]
288.870: (localize-cable vehicle0 waypoint12 turbine2)  [15.000]
348.720: (harvest-energy vehicle0)  [10.000]
358.721: (retrieve-data vehicle0 data2 waypoint12 currenttide turbine2)  [55.000]
413.722: (surface vehicle0)  [40.000]
453.723: (harvest-energy vehicle0)  [10.000]
463.724: (harvest-energy vehicle0)  [10.000]
473.725: (harvest-energy vehicle0)  [10.000]
483.726: (harvest-energy vehicle0)  [10.000]
493.727: (harvest-energy vehicle0)  [10.000]
503.728: (harvest-energy vehicle0)  [10.000]
513.729: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 515.729

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 358.720)b (7.000 | 358.720)b (6.000 | 358.720)b (5.000 | 358.720)b (4.000 | 358.720)