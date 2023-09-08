Number of literals: 17
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
72% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 793.865)b (10.000 | 793.865)b (9.000 | 793.865)b (8.000 | 793.865)b (7.000 | 793.865)b (6.000 | 793.865)b (5.000 | 793.865)b (4.000 | 793.865)b (2.000 | 948.873)b (1.000 | 950.873)(G)
; No metric specified - using makespan

; Plan found with metric 950.874
; States evaluated so far: 239
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.36
0.000: (move vehicle2 wp_init_auv2 waypoint39)  [13.769]
13.770: (harvest-energy vehicle2)  [10.000]
23.771: (harvest-energy vehicle2)  [10.000]
33.772: (move vehicle2 waypoint39 waypoint67)  [14.015]
47.788: (harvest-energy vehicle2)  [10.000]
57.789: (harvest-energy vehicle2)  [10.000]
67.790: (move vehicle2 waypoint67 waypoint100)  [97.553]
165.344: (harvest-energy vehicle2)  [10.000]
175.345: (harvest-energy vehicle2)  [10.000]
185.346: (harvest-energy vehicle2)  [10.000]
195.347: (harvest-energy vehicle2)  [10.000]
205.348: (harvest-energy vehicle2)  [10.000]
215.349: (harvest-energy vehicle2)  [10.000]
225.350: (harvest-energy vehicle2)  [10.000]
235.351: (harvest-energy vehicle2)  [10.000]
245.352: (harvest-energy vehicle2)  [10.000]
255.353: (harvest-energy vehicle2)  [10.000]
265.354: (harvest-energy vehicle2)  [10.000]
275.355: (harvest-energy vehicle2)  [10.000]
285.356: (harvest-energy vehicle2)  [10.000]
295.357: (move vehicle2 waypoint100 waypoint137)  [33.138]
328.496: (harvest-energy vehicle2)  [10.000]
338.497: (harvest-energy vehicle2)  [10.000]
348.498: (harvest-energy vehicle2)  [10.000]
358.499: (harvest-energy vehicle2)  [10.000]
368.500: (move vehicle2 waypoint137 waypoint175)  [96.046]
464.547: (harvest-energy vehicle2)  [10.000]
474.548: (harvest-energy vehicle2)  [10.000]
484.549: (harvest-energy vehicle2)  [10.000]
494.550: (harvest-energy vehicle2)  [10.000]
504.551: (harvest-energy vehicle2)  [10.000]
514.552: (harvest-energy vehicle2)  [10.000]
524.553: (harvest-energy vehicle2)  [10.000]
534.554: (harvest-energy vehicle2)  [10.000]
544.555: (harvest-energy vehicle2)  [10.000]
554.556: (harvest-energy vehicle2)  [10.000]
564.557: (harvest-energy vehicle2)  [10.000]
574.558: (harvest-energy vehicle2)  [10.000]
584.559: (harvest-energy vehicle2)  [10.000]
594.560: (move vehicle2 waypoint175 waypoint212)  [32.769]
627.330: (harvest-energy vehicle2)  [10.000]
637.331: (harvest-energy vehicle2)  [10.000]
647.332: (harvest-energy vehicle2)  [10.000]
657.333: (harvest-energy vehicle2)  [10.000]
667.334: (localize-cable vehicle2 waypoint212 turbine41)  [15.000]
783.865: (harvest-energy vehicle2)  [10.000]
793.866: (retrieve-data vehicle2 data41 waypoint212 currenttide currentwaves turbine41)  [55.000]
848.867: (surface vehicle2)  [40.000]
888.868: (harvest-energy vehicle2)  [10.000]
898.869: (harvest-energy vehicle2)  [10.000]
908.870: (harvest-energy vehicle2)  [10.000]
918.871: (harvest-energy vehicle2)  [10.000]
928.872: (harvest-energy vehicle2)  [10.000]
938.873: (harvest-energy vehicle2)  [10.000]
948.874: (upload-data-histograms vehicle2 data41)  [2.000]

 * All goal deadlines now no later than 950.874

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 793.865)b (10.000 | 793.865)b (9.000 | 793.865)b (8.000 | 793.865)b (7.000 | 793.865)b (6.000 | 793.865)b (5.000 | 793.865)b (4.000 | 793.865)