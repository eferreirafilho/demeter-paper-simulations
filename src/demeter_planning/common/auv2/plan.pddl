Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 36.802)b (5.000 | 191.551)b (4.000 | 216.553)b (3.000 | 761.617)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 36.802)b (5.000 | 191.551)b (4.000 | 216.553)b (2.000 | 513.727)b (1.000 | 515.727)(G)
; No metric specified - using makespan

; Plan found with metric 515.728
; States evaluated so far: 2896
; States pruned based on pre-heuristic cost lower bound: 0
; Time 2.52
0.000: (move vehicle2 wp_init_auv2 waypoint19)  [16.799]
16.801: (harvest-energy vehicle2)  [10.000]
26.802: (harvest-energy vehicle2)  [10.000]
36.803: (move vehicle2 waypoint19 waypoint52)  [94.742]
131.546: (harvest-energy vehicle2)  [10.000]
141.547: (harvest-energy vehicle2)  [10.000]
151.548: (harvest-energy vehicle2)  [10.000]
161.549: (harvest-energy vehicle2)  [10.000]
171.550: (harvest-energy vehicle2)  [10.000]
181.551: (harvest-energy vehicle2)  [10.000]
191.552: (localize-cable vehicle2 waypoint52 turbine10)  [15.000]
348.719: (harvest-energy vehicle2)  [10.000]
358.720: (retrieve-data vehicle2 data10 waypoint52 currenttide turbine10)  [55.000]
413.721: (surface vehicle2)  [40.000]
453.722: (harvest-energy vehicle2)  [10.000]
463.723: (harvest-energy vehicle2)  [10.000]
473.724: (harvest-energy vehicle2)  [10.000]
483.725: (harvest-energy vehicle2)  [10.000]
493.726: (harvest-energy vehicle2)  [10.000]
503.727: (harvest-energy vehicle2)  [10.000]
513.728: (upload-data-histograms vehicle2 data10)  [2.000]

 * All goal deadlines now no later than 515.728
b (0.000 | 515.728)(G)(G)(G)