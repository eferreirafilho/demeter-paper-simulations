Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 43.087)b (6.000 | 166.978)b (5.000 | 241.324)b (4.000 | 266.326)b (3.000 | 811.385)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 43.087)b (6.000 | 166.978)b (5.000 | 241.324)b (4.000 | 266.326)b (2.000 | 513.642)b (1.000 | 515.643)(G)
; No metric specified - using makespan

; Plan found with metric 515.643
; States evaluated so far: 4118
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.49
0.000: (move vehicle2 wp_init_auv2 waypoint27)  [23.085]
23.086: (harvest-energy vehicle2)  [10.000]
33.087: (harvest-energy vehicle2)  [10.000]
43.088: (move vehicle2 waypoint27 waypoint25)  [73.885]
116.974: (harvest-energy vehicle2)  [10.000]
126.975: (harvest-energy vehicle2)  [10.000]
136.976: (harvest-energy vehicle2)  [10.000]
146.977: (harvest-energy vehicle2)  [10.000]
156.978: (harvest-energy vehicle2)  [10.000]
166.979: (move vehicle2 waypoint25 waypoint52)  [44.342]
211.322: (harvest-energy vehicle2)  [10.000]
221.323: (harvest-energy vehicle2)  [10.000]
231.324: (harvest-energy vehicle2)  [10.000]
241.325: (localize-cable vehicle2 waypoint52 turbine10)  [15.000]
348.634: (harvest-energy vehicle2)  [10.000]
358.635: (retrieve-data vehicle2 data10 waypoint52 currenttide turbine10)  [55.000]
413.636: (surface vehicle2)  [40.000]
453.637: (harvest-energy vehicle2)  [10.000]
463.638: (harvest-energy vehicle2)  [10.000]
473.639: (harvest-energy vehicle2)  [10.000]
483.640: (harvest-energy vehicle2)  [10.000]
493.641: (harvest-energy vehicle2)  [10.000]
503.642: (harvest-energy vehicle2)  [10.000]
513.643: (upload-data-histograms vehicle2 data10)  [2.000]

 * All goal deadlines now no later than 515.643
b (0.000 | 515.643)