Number of literals: 17
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
72% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000, admissible cost estimate 0.000
b (10.000 | 33.355)b (9.000 | 69.542)b (8.000 | 276.847)b (7.000 | 385.238)b (6.000 | 456.181)b (5.000 | 579.189)b (4.000 | 604.191)b (3.000 | 1149.253)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (10.000 | 33.355)b (9.000 | 69.542)b (8.000 | 276.847)b (7.000 | 385.238)b (6.000 | 456.181)b (5.000 | 579.189)b (4.000 | 604.191)b (2.000 | 1135.152)b (1.000 | 1137.152)(G)
; No metric specified - using makespan

; Plan found with metric 1137.153
; States evaluated so far: 6769
; States pruned based on pre-heuristic cost lower bound: 0
; Time 9.06
0.000: (move vehicle0 wp_init_auv0 waypoint79)  [13.353]
13.354: (harvest-energy vehicle0)  [10.000]
23.355: (harvest-energy vehicle0)  [10.000]
33.356: (move vehicle0 waypoint79 waypoint80)  [16.184]
49.541: (harvest-energy vehicle0)  [10.000]
59.542: (harvest-energy vehicle0)  [10.000]
69.543: (move vehicle0 waypoint80 waypoint50)  [87.292]
156.836: (harvest-energy vehicle0)  [10.000]
166.837: (harvest-energy vehicle0)  [10.000]
176.838: (harvest-energy vehicle0)  [10.000]
186.839: (harvest-energy vehicle0)  [10.000]
196.840: (harvest-energy vehicle0)  [10.000]
206.841: (harvest-energy vehicle0)  [10.000]
216.842: (harvest-energy vehicle0)  [10.000]
226.843: (harvest-energy vehicle0)  [10.000]
236.844: (harvest-energy vehicle0)  [10.000]
246.845: (harvest-energy vehicle0)  [10.000]
256.846: (harvest-energy vehicle0)  [10.000]
266.847: (harvest-energy vehicle0)  [10.000]
276.848: (move vehicle0 waypoint50 waypoint52)  [48.384]
325.233: (harvest-energy vehicle0)  [10.000]
335.234: (harvest-energy vehicle0)  [10.000]
345.235: (harvest-energy vehicle0)  [10.000]
355.236: (harvest-energy vehicle0)  [10.000]
365.237: (harvest-energy vehicle0)  [10.000]
375.238: (harvest-energy vehicle0)  [10.000]
385.239: (move vehicle0 waypoint52 waypoint25)  [30.938]
416.178: (harvest-energy vehicle0)  [10.000]
426.179: (harvest-energy vehicle0)  [10.000]
436.180: (harvest-energy vehicle0)  [10.000]
446.181: (harvest-energy vehicle0)  [10.000]
456.182: (move vehicle0 waypoint25 waypoint27)  [53.000]
509.183: (harvest-energy vehicle0)  [10.000]
519.184: (harvest-energy vehicle0)  [10.000]
529.185: (harvest-energy vehicle0)  [10.000]
539.186: (harvest-energy vehicle0)  [10.000]
549.187: (harvest-energy vehicle0)  [10.000]
559.188: (harvest-energy vehicle0)  [10.000]
569.189: (harvest-energy vehicle0)  [10.000]
579.190: (localize-cable vehicle0 waypoint27 turbine4)  [15.000]
970.144: (harvest-energy vehicle0)  [10.000]
980.145: (retrieve-data vehicle0 data4 waypoint27 currenttide currentwaves turbine4)  [55.000]
1035.146: (surface vehicle0)  [40.000]
1075.147: (harvest-energy vehicle0)  [10.000]
1085.148: (harvest-energy vehicle0)  [10.000]
1095.149: (harvest-energy vehicle0)  [10.000]
1105.150: (harvest-energy vehicle0)  [10.000]
1115.151: (harvest-energy vehicle0)  [10.000]
1125.152: (harvest-energy vehicle0)  [10.000]
1135.153: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 1137.153
b (0.000 | 1137.153)