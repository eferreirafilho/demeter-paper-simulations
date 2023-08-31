Number of literals: 15
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000, admissible cost estimate 0.000
b (9.000 | 10.000)b (8.000 | 40.941)b (7.000 | 170.072)b (6.000 | 396.378)b (5.000 | 437.104)b (4.000 | 462.106)b (3.000 | 1007.165)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 10.000)b (8.000 | 40.941)b (7.000 | 170.072)b (6.000 | 396.378)b (5.000 | 437.104)b (4.000 | 462.106)b (2.000 | 617.114)b (1.000 | 619.115)(G)
; No metric specified - using makespan

; Plan found with metric 619.115
; States evaluated so far: 5260
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.79
0.000: (harvest-energy vehicle1)  [10.000]
10.001: (move vehicle1 wp_init_auv1 waypoint29)  [10.938]
20.940: (harvest-energy vehicle1)  [10.000]
30.941: (harvest-energy vehicle1)  [10.000]
40.942: (move vehicle1 waypoint29 waypoint26)  [59.123]
100.066: (harvest-energy vehicle1)  [10.000]
110.067: (harvest-energy vehicle1)  [10.000]
120.068: (harvest-energy vehicle1)  [10.000]
130.069: (harvest-energy vehicle1)  [10.000]
140.070: (harvest-energy vehicle1)  [10.000]
150.071: (harvest-energy vehicle1)  [10.000]
160.072: (harvest-energy vehicle1)  [10.000]
170.073: (move vehicle1 waypoint26 waypoint6)  [96.292]
266.366: (harvest-energy vehicle1)  [10.000]
276.367: (harvest-energy vehicle1)  [10.000]
286.368: (harvest-energy vehicle1)  [10.000]
296.369: (harvest-energy vehicle1)  [10.000]
306.370: (harvest-energy vehicle1)  [10.000]
316.371: (harvest-energy vehicle1)  [10.000]
326.372: (harvest-energy vehicle1)  [10.000]
336.373: (harvest-energy vehicle1)  [10.000]
346.374: (harvest-energy vehicle1)  [10.000]
356.375: (harvest-energy vehicle1)  [10.000]
366.376: (harvest-energy vehicle1)  [10.000]
376.377: (harvest-energy vehicle1)  [10.000]
386.378: (harvest-energy vehicle1)  [10.000]
396.379: (move vehicle1 waypoint6 waypoint2)  [20.723]
417.103: (harvest-energy vehicle1)  [10.000]
427.104: (harvest-energy vehicle1)  [10.000]
437.105: (localize-cable vehicle1 waypoint2 turbine0)  [15.000]
452.106: (harvest-energy vehicle1)  [10.000]
462.107: (retrieve-data vehicle1 data0 waypoint2 currenttide currentwaves turbine0)  [55.000]
517.108: (surface vehicle1)  [40.000]
557.109: (harvest-energy vehicle1)  [10.000]
567.110: (harvest-energy vehicle1)  [10.000]
577.111: (harvest-energy vehicle1)  [10.000]
587.112: (harvest-energy vehicle1)  [10.000]
597.113: (harvest-energy vehicle1)  [10.000]
607.114: (harvest-energy vehicle1)  [10.000]
617.115: (upload-data-histograms vehicle1 data0)  [2.000]

 * All goal deadlines now no later than 619.115
b (0.000 | 619.115)