Number of literals: 16
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 34.202)b (8.000 | 84.436)b (7.000 | 275.894)b (6.000 | 458.366)b (5.000 | 612.114)b (4.000 | 637.116)b (3.000 | 1182.176)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 34.202)b (8.000 | 84.436)b (7.000 | 275.894)b (6.000 | 458.366)b (5.000 | 612.114)b (4.000 | 637.116)b (2.000 | 1072.782)b (1.000 | 1074.783)(G)
; No metric specified - using makespan

; Plan found with metric 1074.783
; States evaluated so far: 6256
; States pruned based on pre-heuristic cost lower bound: 0
; Time 8.24
0.000: (move vehicle3 wp_init_auv3 waypoint47)  [14.200]
14.201: (harvest-energy vehicle3)  [10.000]
24.202: (harvest-energy vehicle3)  [10.000]
34.203: (move vehicle3 waypoint47 waypoint51)  [20.230]
54.434: (harvest-energy vehicle3)  [10.000]
64.435: (harvest-energy vehicle3)  [10.000]
74.436: (harvest-energy vehicle3)  [10.000]
84.437: (move vehicle3 waypoint51 waypoint91)  [81.446]
165.884: (harvest-energy vehicle3)  [10.000]
175.885: (harvest-energy vehicle3)  [10.000]
185.886: (harvest-energy vehicle3)  [10.000]
195.887: (harvest-energy vehicle3)  [10.000]
205.888: (harvest-energy vehicle3)  [10.000]
215.889: (harvest-energy vehicle3)  [10.000]
225.890: (harvest-energy vehicle3)  [10.000]
235.891: (harvest-energy vehicle3)  [10.000]
245.892: (harvest-energy vehicle3)  [10.000]
255.893: (harvest-energy vehicle3)  [10.000]
265.894: (harvest-energy vehicle3)  [10.000]
275.895: (move vehicle3 waypoint91 waypoint136)  [82.461]
358.357: (harvest-energy vehicle3)  [10.000]
368.358: (harvest-energy vehicle3)  [10.000]
378.359: (harvest-energy vehicle3)  [10.000]
388.360: (harvest-energy vehicle3)  [10.000]
398.361: (harvest-energy vehicle3)  [10.000]
408.362: (harvest-energy vehicle3)  [10.000]
418.363: (harvest-energy vehicle3)  [10.000]
428.364: (harvest-energy vehicle3)  [10.000]
438.365: (harvest-energy vehicle3)  [10.000]
448.366: (harvest-energy vehicle3)  [10.000]
458.367: (move vehicle3 waypoint136 waypoint177)  [63.738]
522.106: (harvest-energy vehicle3)  [10.000]
532.107: (harvest-energy vehicle3)  [10.000]
542.108: (harvest-energy vehicle3)  [10.000]
552.109: (harvest-energy vehicle3)  [10.000]
562.110: (harvest-energy vehicle3)  [10.000]
572.111: (harvest-energy vehicle3)  [10.000]
582.112: (harvest-energy vehicle3)  [10.000]
592.113: (harvest-energy vehicle3)  [10.000]
602.114: (harvest-energy vehicle3)  [10.000]
612.115: (localize-cable vehicle3 waypoint177 turbine34)  [15.000]
907.774: (harvest-energy vehicle3)  [10.000]
917.775: (retrieve-data vehicle3 data34 waypoint177 currenttide currentwaves turbine34)  [55.000]
972.776: (surface vehicle3)  [40.000]
1012.777: (harvest-energy vehicle3)  [10.000]
1022.778: (harvest-energy vehicle3)  [10.000]
1032.779: (harvest-energy vehicle3)  [10.000]
1042.780: (harvest-energy vehicle3)  [10.000]
1052.781: (harvest-energy vehicle3)  [10.000]
1062.782: (harvest-energy vehicle3)  [10.000]
1072.783: (upload-data-histograms vehicle3 data34)  [2.000]

 * All goal deadlines now no later than 1074.783
b (0.000 | 1074.783)