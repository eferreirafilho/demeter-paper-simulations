Number of literals: 15
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 30.925)b (7.000 | 170.057)b (6.000 | 386.362)b (5.000 | 437.089)b (4.000 | 462.091)b (3.000 | 1007.150)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 30.925)b (7.000 | 170.057)b (6.000 | 386.362)b (5.000 | 437.089)b (4.000 | 462.091)b (2.000 | 1038.392)b (1.000 | 1040.393)(G)
; No metric specified - using makespan

; Plan found with metric 1040.393
; States evaluated so far: 5000
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.50
0.000: (move vehicle1 wp_init_auv1 waypoint29)  [10.923]
10.924: (harvest-energy vehicle1)  [10.000]
20.925: (harvest-energy vehicle1)  [10.000]
30.926: (move vehicle1 waypoint29 waypoint26)  [59.123]
90.050: (harvest-energy vehicle1)  [10.000]
100.051: (harvest-energy vehicle1)  [10.000]
110.052: (harvest-energy vehicle1)  [10.000]
120.053: (harvest-energy vehicle1)  [10.000]
130.054: (harvest-energy vehicle1)  [10.000]
140.055: (harvest-energy vehicle1)  [10.000]
150.056: (harvest-energy vehicle1)  [10.000]
160.057: (harvest-energy vehicle1)  [10.000]
170.058: (move vehicle1 waypoint26 waypoint6)  [96.292]
266.351: (harvest-energy vehicle1)  [10.000]
276.352: (harvest-energy vehicle1)  [10.000]
286.353: (harvest-energy vehicle1)  [10.000]
296.354: (harvest-energy vehicle1)  [10.000]
306.355: (harvest-energy vehicle1)  [10.000]
316.356: (harvest-energy vehicle1)  [10.000]
326.357: (harvest-energy vehicle1)  [10.000]
336.358: (harvest-energy vehicle1)  [10.000]
346.359: (harvest-energy vehicle1)  [10.000]
356.360: (harvest-energy vehicle1)  [10.000]
366.361: (harvest-energy vehicle1)  [10.000]
376.362: (harvest-energy vehicle1)  [10.000]
386.363: (move vehicle1 waypoint6 waypoint2)  [20.723]
407.087: (harvest-energy vehicle1)  [10.000]
417.088: (harvest-energy vehicle1)  [10.000]
427.089: (harvest-energy vehicle1)  [10.000]
437.090: (localize-cable vehicle1 waypoint2 turbine0)  [15.000]
873.384: (harvest-energy vehicle1)  [10.000]
883.385: (retrieve-data vehicle1 data0 waypoint2 currenttide currentwaves turbine0)  [55.000]
938.386: (surface vehicle1)  [40.000]
978.387: (harvest-energy vehicle1)  [10.000]
988.388: (harvest-energy vehicle1)  [10.000]
998.389: (harvest-energy vehicle1)  [10.000]
1008.390: (harvest-energy vehicle1)  [10.000]
1018.391: (harvest-energy vehicle1)  [10.000]
1028.392: (harvest-energy vehicle1)  [10.000]
1038.393: (upload-data-histograms vehicle1 data0)  [2.000]

 * All goal deadlines now no later than 1040.393
b (0.000 | 1040.393)