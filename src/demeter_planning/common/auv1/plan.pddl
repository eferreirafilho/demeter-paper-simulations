Number of literals: 15
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 29.140)b (7.000 | 123.546)b (6.000 | 244.569)b (5.000 | 348.329)b (4.000 | 373.331)b (3.000 | 918.391)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 29.140)b (7.000 | 123.546)b (6.000 | 244.569)b (5.000 | 348.329)b (4.000 | 373.331)b (2.000 | 1001.682)b (1.000 | 1003.683)(G)
; No metric specified - using makespan

; Plan found with metric 1003.683
; States evaluated so far: 6760
; States pruned based on pre-heuristic cost lower bound: 0
; Time 8.17
0.000: (move vehicle1 wp_init_auv1 waypoint14)  [9.138]
9.139: (harvest-energy vehicle1)  [10.000]
19.140: (harvest-energy vehicle1)  [10.000]
29.141: (move vehicle1 waypoint14 waypoint19)  [44.400]
73.542: (harvest-energy vehicle1)  [10.000]
83.543: (harvest-energy vehicle1)  [10.000]
93.544: (harvest-energy vehicle1)  [10.000]
103.545: (harvest-energy vehicle1)  [10.000]
113.546: (harvest-energy vehicle1)  [10.000]
123.547: (move vehicle1 waypoint19 waypoint52)  [51.015]
174.563: (harvest-energy vehicle1)  [10.000]
184.564: (harvest-energy vehicle1)  [10.000]
194.565: (harvest-energy vehicle1)  [10.000]
204.566: (harvest-energy vehicle1)  [10.000]
214.567: (harvest-energy vehicle1)  [10.000]
224.568: (harvest-energy vehicle1)  [10.000]
234.569: (harvest-energy vehicle1)  [10.000]
244.570: (move vehicle1 waypoint52 waypoint57)  [43.753]
288.324: (harvest-energy vehicle1)  [10.000]
298.325: (harvest-energy vehicle1)  [10.000]
308.326: (harvest-energy vehicle1)  [10.000]
318.327: (harvest-energy vehicle1)  [10.000]
328.328: (harvest-energy vehicle1)  [10.000]
338.329: (harvest-energy vehicle1)  [10.000]
348.330: (localize-cable vehicle1 waypoint57 turbine11)  [15.000]
836.674: (harvest-energy vehicle1)  [10.000]
846.675: (retrieve-data vehicle1 data11 waypoint57 currenttide currentwaves turbine11)  [55.000]
901.676: (surface vehicle1)  [40.000]
941.677: (harvest-energy vehicle1)  [10.000]
951.678: (harvest-energy vehicle1)  [10.000]
961.679: (harvest-energy vehicle1)  [10.000]
971.680: (harvest-energy vehicle1)  [10.000]
981.681: (harvest-energy vehicle1)  [10.000]
991.682: (harvest-energy vehicle1)  [10.000]
1001.683: (upload-data-histograms vehicle1 data11)  [2.000]

 * All goal deadlines now no later than 1003.683
b (0.000 | 1003.683)