Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 31.709)b (6.000 | 141.316)b (5.000 | 260.216)b (4.000 | 285.218)b (3.000 | 830.278)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 31.709)b (6.000 | 141.316)b (5.000 | 260.216)b (4.000 | 285.218)b (2.000 | 650.632)b (1.000 | 652.632)(G)
; No metric specified - using makespan

; Plan found with metric 652.633
; States evaluated so far: 5221
; States pruned based on pre-heuristic cost lower bound: 0
; Time 5.92
0.000: (move vehicle1 wp_init_auv1 waypoint9)  [11.707]
11.708: (harvest-energy vehicle1)  [10.000]
21.709: (harvest-energy vehicle1)  [10.000]
31.710: (move vehicle1 waypoint9 waypoint27)  [49.600]
81.311: (harvest-energy vehicle1)  [10.000]
91.312: (harvest-energy vehicle1)  [10.000]
101.313: (harvest-energy vehicle1)  [10.000]
111.314: (harvest-energy vehicle1)  [10.000]
121.315: (harvest-energy vehicle1)  [10.000]
131.316: (harvest-energy vehicle1)  [10.000]
141.317: (move vehicle1 waypoint27 waypoint32)  [48.892]
190.210: (harvest-energy vehicle1)  [10.000]
200.211: (harvest-energy vehicle1)  [10.000]
210.212: (harvest-energy vehicle1)  [10.000]
220.213: (harvest-energy vehicle1)  [10.000]
230.214: (harvest-energy vehicle1)  [10.000]
240.215: (harvest-energy vehicle1)  [10.000]
250.216: (harvest-energy vehicle1)  [10.000]
260.217: (localize-cable vehicle1 waypoint32 turbine6)  [15.000]
485.624: (harvest-energy vehicle1)  [10.000]
495.625: (retrieve-data vehicle1 data6 waypoint32 currenttide currentwaves turbine6)  [55.000]
550.626: (surface vehicle1)  [40.000]
590.627: (harvest-energy vehicle1)  [10.000]
600.628: (harvest-energy vehicle1)  [10.000]
610.629: (harvest-energy vehicle1)  [10.000]
620.630: (harvest-energy vehicle1)  [10.000]
630.631: (harvest-energy vehicle1)  [10.000]
640.632: (harvest-energy vehicle1)  [10.000]
650.633: (upload-data-histograms vehicle1 data6)  [2.000]

 * All goal deadlines now no later than 652.633
b (0.000 | 652.633)