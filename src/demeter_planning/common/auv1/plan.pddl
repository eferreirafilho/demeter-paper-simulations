Number of literals: 15
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 30.878)b (7.000 | 170.010)b (6.000 | 386.315)b (5.000 | 437.042)b (4.000 | 462.044)b (3.000 | 1007.106)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 30.878)b (7.000 | 170.010)b (6.000 | 386.315)b (5.000 | 437.042)b (4.000 | 462.044)b (2.000 | 664.262)b (1.000 | 666.262)(G)
; No metric specified - using makespan

; Plan found with metric 666.263
; States evaluated so far: 5000
; States pruned based on pre-heuristic cost lower bound: 0
; Time 6.13
0.000: (move vehicle1 wp_init_auv1 waypoint29)  [10.876]
10.877: (harvest-energy vehicle1)  [10.000]
20.878: (harvest-energy vehicle1)  [10.000]
30.879: (move vehicle1 waypoint29 waypoint26)  [59.123]
90.003: (harvest-energy vehicle1)  [10.000]
100.004: (harvest-energy vehicle1)  [10.000]
110.005: (harvest-energy vehicle1)  [10.000]
120.006: (harvest-energy vehicle1)  [10.000]
130.007: (harvest-energy vehicle1)  [10.000]
140.008: (harvest-energy vehicle1)  [10.000]
150.009: (harvest-energy vehicle1)  [10.000]
160.010: (harvest-energy vehicle1)  [10.000]
170.011: (move vehicle1 waypoint26 waypoint6)  [96.292]
266.304: (harvest-energy vehicle1)  [10.000]
276.305: (harvest-energy vehicle1)  [10.000]
286.306: (harvest-energy vehicle1)  [10.000]
296.307: (harvest-energy vehicle1)  [10.000]
306.308: (harvest-energy vehicle1)  [10.000]
316.309: (harvest-energy vehicle1)  [10.000]
326.310: (harvest-energy vehicle1)  [10.000]
336.311: (harvest-energy vehicle1)  [10.000]
346.312: (harvest-energy vehicle1)  [10.000]
356.313: (harvest-energy vehicle1)  [10.000]
366.314: (harvest-energy vehicle1)  [10.000]
376.315: (harvest-energy vehicle1)  [10.000]
386.316: (move vehicle1 waypoint6 waypoint2)  [20.723]
407.040: (harvest-energy vehicle1)  [10.000]
417.041: (harvest-energy vehicle1)  [10.000]
427.042: (harvest-energy vehicle1)  [10.000]
437.043: (localize-cable vehicle1 waypoint2 turbine0)  [15.000]
499.254: (harvest-energy vehicle1)  [10.000]
509.255: (retrieve-data vehicle1 data0 waypoint2 currenttide currentwaves turbine0)  [55.000]
564.256: (surface vehicle1)  [40.000]
604.257: (harvest-energy vehicle1)  [10.000]
614.258: (harvest-energy vehicle1)  [10.000]
624.259: (harvest-energy vehicle1)  [10.000]
634.260: (harvest-energy vehicle1)  [10.000]
644.261: (harvest-energy vehicle1)  [10.000]
654.262: (harvest-energy vehicle1)  [10.000]
664.263: (upload-data-histograms vehicle1 data0)  [2.000]

 * All goal deadlines now no later than 666.263
b (0.000 | 666.263)