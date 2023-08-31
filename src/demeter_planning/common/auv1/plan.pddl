Number of literals: 16
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 30.802)b (8.000 | 139.239)b (7.000 | 244.138)b (6.000 | 353.791)b (5.000 | 457.551)b (4.000 | 482.553)b (3.000 | 1027.613)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 30.802)b (8.000 | 139.239)b (7.000 | 244.138)b (6.000 | 353.791)b (5.000 | 457.551)b (4.000 | 482.553)b (2.000 | 1249.617)b (1.000 | 1251.618)(G)
; No metric specified - using makespan

; Plan found with metric 1251.618
; States evaluated so far: 8868
; States pruned based on pre-heuristic cost lower bound: 0
; Time 9.09
0.000: (move vehicle1 wp_init_auv1 waypoint37)  [10.800]
10.801: (harvest-energy vehicle1)  [10.000]
20.802: (harvest-energy vehicle1)  [10.000]
30.803: (move vehicle1 waypoint37 waypoint42)  [48.430]
79.234: (harvest-energy vehicle1)  [10.000]
89.235: (harvest-energy vehicle1)  [10.000]
99.236: (harvest-energy vehicle1)  [10.000]
109.237: (harvest-energy vehicle1)  [10.000]
119.238: (harvest-energy vehicle1)  [10.000]
129.239: (harvest-energy vehicle1)  [10.000]
139.240: (move vehicle1 waypoint42 waypoint47)  [44.892]
184.133: (harvest-energy vehicle1)  [10.000]
194.134: (harvest-energy vehicle1)  [10.000]
204.135: (harvest-energy vehicle1)  [10.000]
214.136: (harvest-energy vehicle1)  [10.000]
224.137: (harvest-energy vehicle1)  [10.000]
234.138: (harvest-energy vehicle1)  [10.000]
244.139: (move vehicle1 waypoint47 waypoint52)  [49.646]
293.786: (harvest-energy vehicle1)  [10.000]
303.787: (harvest-energy vehicle1)  [10.000]
313.788: (harvest-energy vehicle1)  [10.000]
323.789: (harvest-energy vehicle1)  [10.000]
333.790: (harvest-energy vehicle1)  [10.000]
343.791: (harvest-energy vehicle1)  [10.000]
353.792: (move vehicle1 waypoint52 waypoint57)  [43.753]
397.546: (harvest-energy vehicle1)  [10.000]
407.547: (harvest-energy vehicle1)  [10.000]
417.548: (harvest-energy vehicle1)  [10.000]
427.549: (harvest-energy vehicle1)  [10.000]
437.550: (harvest-energy vehicle1)  [10.000]
447.551: (harvest-energy vehicle1)  [10.000]
457.552: (localize-cable vehicle1 waypoint57 turbine11)  [15.000]
1084.609: (harvest-energy vehicle1)  [10.000]
1094.610: (retrieve-data vehicle1 data11 waypoint57 currenttide currentwaves turbine11)  [55.000]
1149.611: (surface vehicle1)  [40.000]
1189.612: (harvest-energy vehicle1)  [10.000]
1199.613: (harvest-energy vehicle1)  [10.000]
1209.614: (harvest-energy vehicle1)  [10.000]
1219.615: (harvest-energy vehicle1)  [10.000]
1229.616: (harvest-energy vehicle1)  [10.000]
1239.617: (harvest-energy vehicle1)  [10.000]
1249.618: (upload-data-histograms vehicle1 data11)  [2.000]

 * All goal deadlines now no later than 1251.618
b (0.000 | 1251.618)