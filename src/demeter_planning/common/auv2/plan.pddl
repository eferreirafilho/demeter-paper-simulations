Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 44.802)b (6.000 | 137.749)b (5.000 | 288.556)b (4.000 | 313.558)b (3.000 | 858.618)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 44.802)b (6.000 | 137.749)b (5.000 | 288.556)b (4.000 | 313.558)b (2.000 | 513.652)b (1.000 | 515.653)(G)
; No metric specified - using makespan

; Plan found with metric 515.653
; States evaluated so far: 3909
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.43
0.000: (move vehicle2 wp_init_auv2 waypoint26)  [24.799]
24.801: (harvest-energy vehicle2)  [10.000]
34.802: (harvest-energy vehicle2)  [10.000]
44.803: (move vehicle2 waypoint26 waypoint27)  [52.942]
97.746: (harvest-energy vehicle2)  [10.000]
107.747: (harvest-energy vehicle2)  [10.000]
117.748: (harvest-energy vehicle2)  [10.000]
127.749: (harvest-energy vehicle2)  [10.000]
137.750: (move vehicle2 waypoint27 waypoint32)  [90.800]
228.551: (harvest-energy vehicle2)  [10.000]
238.552: (harvest-energy vehicle2)  [10.000]
248.553: (harvest-energy vehicle2)  [10.000]
258.554: (harvest-energy vehicle2)  [10.000]
268.555: (harvest-energy vehicle2)  [10.000]
278.556: (harvest-energy vehicle2)  [10.000]
288.557: (localize-cable vehicle2 waypoint32 turbine6)  [15.000]
348.644: (harvest-energy vehicle2)  [10.000]
358.645: (retrieve-data vehicle2 data6 waypoint32 currenttide turbine6)  [55.000]
413.646: (surface vehicle2)  [40.000]
453.647: (harvest-energy vehicle2)  [10.000]
463.648: (harvest-energy vehicle2)  [10.000]
473.649: (harvest-energy vehicle2)  [10.000]
483.650: (harvest-energy vehicle2)  [10.000]
493.651: (harvest-energy vehicle2)  [10.000]
503.652: (harvest-energy vehicle2)  [10.000]
513.653: (upload-data-histograms vehicle2 data6)  [2.000]

 * All goal deadlines now no later than 515.653
b (0.000 | 515.653)