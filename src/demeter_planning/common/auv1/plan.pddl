Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 29.140)b (5.000 | 140.162)b (4.000 | 165.164)b (3.000 | 710.228)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 29.140)b (5.000 | 140.162)b (4.000 | 165.164)b (2.000 | 650.837)b (1.000 | 652.838)(G)
; No metric specified - using makespan

; Plan found with metric 652.838
; States evaluated so far: 3510
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.16
0.000: (move vehicle1 wp_init_auv1 waypoint19)  [9.138]
9.139: (harvest-energy vehicle1)  [10.000]
19.140: (harvest-energy vehicle1)  [10.000]
29.141: (move vehicle1 waypoint19 waypoint52)  [51.015]
80.157: (harvest-energy vehicle1)  [10.000]
90.158: (harvest-energy vehicle1)  [10.000]
100.159: (harvest-energy vehicle1)  [10.000]
110.160: (harvest-energy vehicle1)  [10.000]
120.161: (harvest-energy vehicle1)  [10.000]
130.162: (harvest-energy vehicle1)  [10.000]
140.163: (localize-cable vehicle1 waypoint52 turbine10)  [15.000]
485.829: (harvest-energy vehicle1)  [10.000]
495.830: (retrieve-data vehicle1 data10 waypoint52 currenttide currentwaves turbine10)  [55.000]
550.831: (surface vehicle1)  [40.000]
590.832: (harvest-energy vehicle1)  [10.000]
600.833: (harvest-energy vehicle1)  [10.000]
610.834: (harvest-energy vehicle1)  [10.000]
620.835: (harvest-energy vehicle1)  [10.000]
630.836: (harvest-energy vehicle1)  [10.000]
640.837: (harvest-energy vehicle1)  [10.000]
650.838: (upload-data-histograms vehicle1 data10)  [2.000]

 * All goal deadlines now no later than 652.838
b (0.000 | 652.838)