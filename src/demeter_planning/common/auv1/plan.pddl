Number of literals: 15
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 29.002)b (7.000 | 154.779)b (6.000 | 190.966)b (5.000 | 365.653)b (4.000 | 390.655)b (3.000 | 935.714)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 29.002)b (7.000 | 154.779)b (6.000 | 190.966)b (5.000 | 365.653)b (4.000 | 390.655)b (2.000 | 1189.517)b (1.000 | 1191.517)(G)
; No metric specified - using makespan

; Plan found with metric 1191.518
; States evaluated so far: 7747
; States pruned based on pre-heuristic cost lower bound: 0
; Time 7.06
0.000: (move vehicle1 wp_init_auv1 waypoint45)  [9.000]
9.001: (harvest-energy vehicle1)  [10.000]
19.002: (harvest-energy vehicle1)  [10.000]
29.003: (move vehicle1 waypoint45 waypoint43)  [55.769]
84.773: (harvest-energy vehicle1)  [10.000]
94.774: (harvest-energy vehicle1)  [10.000]
104.775: (harvest-energy vehicle1)  [10.000]
114.776: (harvest-energy vehicle1)  [10.000]
124.777: (harvest-energy vehicle1)  [10.000]
134.778: (harvest-energy vehicle1)  [10.000]
144.779: (harvest-energy vehicle1)  [10.000]
154.780: (move vehicle1 waypoint43 waypoint42)  [16.184]
170.965: (harvest-energy vehicle1)  [10.000]
180.966: (harvest-energy vehicle1)  [10.000]
190.967: (move vehicle1 waypoint42 waypoint70)  [74.676]
265.644: (harvest-energy vehicle1)  [10.000]
275.645: (harvest-energy vehicle1)  [10.000]
285.646: (harvest-energy vehicle1)  [10.000]
295.647: (harvest-energy vehicle1)  [10.000]
305.648: (harvest-energy vehicle1)  [10.000]
315.649: (harvest-energy vehicle1)  [10.000]
325.650: (harvest-energy vehicle1)  [10.000]
335.651: (harvest-energy vehicle1)  [10.000]
345.652: (harvest-energy vehicle1)  [10.000]
355.653: (harvest-energy vehicle1)  [10.000]
365.654: (localize-cable vehicle1 waypoint70 turbine13)  [15.000]
1024.509: (harvest-energy vehicle1)  [10.000]
1034.510: (retrieve-data vehicle1 data13 waypoint70 currenttide currentwaves turbine13)  [55.000]
1089.511: (surface vehicle1)  [40.000]
1129.512: (harvest-energy vehicle1)  [10.000]
1139.513: (harvest-energy vehicle1)  [10.000]
1149.514: (harvest-energy vehicle1)  [10.000]
1159.515: (harvest-energy vehicle1)  [10.000]
1169.516: (harvest-energy vehicle1)  [10.000]
1179.517: (harvest-energy vehicle1)  [10.000]
1189.518: (upload-data-histograms vehicle1 data13)  [2.000]

 * All goal deadlines now no later than 1191.518
b (0.000 | 1191.518)