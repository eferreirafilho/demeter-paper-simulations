Number of literals: 18
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
75% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 13.000, admissible cost estimate 0.000
b (12.000 | 798.770)b (11.000 | 798.770)b (10.000 | 798.770)b (9.000 | 798.770)b (8.000 | 798.770)b (7.000 | 798.770)b (6.000 | 798.770)b (5.000 | 798.770)b (4.000 | 798.770)b (2.000 | 953.778)b (1.000 | 955.779)(G)
; No metric specified - using makespan

; Plan found with metric 955.779
; States evaluated so far: 241
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.30
0.000: (move vehicle0 wp_init_auv0 waypoint27)  [12.000]
12.001: (harvest-energy vehicle0)  [10.000]
22.002: (harvest-energy vehicle0)  [10.000]
32.003: (move vehicle0 waypoint27 waypoint25)  [39.784]
71.788: (harvest-energy vehicle0)  [10.000]
81.789: (harvest-energy vehicle0)  [10.000]
91.790: (harvest-energy vehicle0)  [10.000]
101.791: (harvest-energy vehicle0)  [10.000]
111.792: (harvest-energy vehicle0)  [10.000]
121.793: (move vehicle0 waypoint25 waypoint24)  [11.046]
132.840: (harvest-energy vehicle0)  [10.000]
142.841: (harvest-energy vehicle0)  [10.000]
152.842: (move vehicle0 waypoint24 waypoint47)  [51.784]
204.627: (harvest-energy vehicle0)  [10.000]
214.628: (harvest-energy vehicle0)  [10.000]
224.629: (harvest-energy vehicle0)  [10.000]
234.630: (harvest-energy vehicle0)  [10.000]
244.631: (harvest-energy vehicle0)  [10.000]
254.632: (harvest-energy vehicle0)  [10.000]
264.633: (move vehicle0 waypoint47 waypoint45)  [37.830]
302.464: (harvest-energy vehicle0)  [10.000]
312.465: (harvest-energy vehicle0)  [10.000]
322.466: (harvest-energy vehicle0)  [10.000]
332.467: (harvest-energy vehicle0)  [10.000]
342.468: (harvest-energy vehicle0)  [10.000]
352.469: (move vehicle0 waypoint45 waypoint44)  [11.046]
363.516: (harvest-energy vehicle0)  [10.000]
373.517: (harvest-energy vehicle0)  [10.000]
383.518: (move vehicle0 waypoint44 waypoint72)  [52.630]
436.149: (harvest-energy vehicle0)  [10.000]
446.150: (harvest-energy vehicle0)  [10.000]
456.151: (harvest-energy vehicle0)  [10.000]
466.152: (harvest-energy vehicle0)  [10.000]
476.153: (harvest-energy vehicle0)  [10.000]
486.154: (harvest-energy vehicle0)  [10.000]
496.155: (harvest-energy vehicle0)  [10.000]
506.156: (localize-cable vehicle0 waypoint72 turbine14)  [15.000]
788.770: (harvest-energy vehicle0)  [10.000]
798.771: (retrieve-data vehicle0 data14 waypoint72 currenttide currentwaves turbine14)  [55.000]
853.772: (surface vehicle0)  [40.000]
893.773: (harvest-energy vehicle0)  [10.000]
903.774: (harvest-energy vehicle0)  [10.000]
913.775: (harvest-energy vehicle0)  [10.000]
923.776: (harvest-energy vehicle0)  [10.000]
933.777: (harvest-energy vehicle0)  [10.000]
943.778: (harvest-energy vehicle0)  [10.000]
953.779: (upload-data-histograms vehicle0 data14)  [2.000]

 * All goal deadlines now no later than 955.779

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (12.000 | 798.770)b (11.000 | 798.770)b (10.000 | 798.770)b (9.000 | 798.770)b (8.000 | 798.770)b (7.000 | 798.770)b (6.000 | 798.770)b (5.000 | 798.770)b (4.000 | 798.770)b (2.000 | 953.778)b (1.000 | 955.779)