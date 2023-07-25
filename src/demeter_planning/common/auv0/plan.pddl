Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 30.832)b (6.000 | 120.622)b (5.000 | 174.502)b (4.000 | 199.504)b (3.000 | 744.566)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 30.832)b (6.000 | 120.622)b (5.000 | 174.502)b (4.000 | 199.504)b (2.000 | 657.097)b (1.000 | 659.098)(G)
; No metric specified - using makespan

; Plan found with metric 659.098
; States evaluated so far: 5067
; States pruned based on pre-heuristic cost lower bound: 0
; Time 6.41
0.000: (move vehicle0 wp_init_auv0 waypoint27)  [10.830]
10.831: (harvest-energy vehicle0)  [10.000]
20.832: (harvest-energy vehicle0)  [10.000]
30.833: (move vehicle0 waypoint27 waypoint25)  [39.784]
70.618: (harvest-energy vehicle0)  [10.000]
80.619: (harvest-energy vehicle0)  [10.000]
90.620: (harvest-energy vehicle0)  [10.000]
100.621: (harvest-energy vehicle0)  [10.000]
110.622: (harvest-energy vehicle0)  [10.000]
120.623: (move vehicle0 waypoint25 waypoint52)  [23.876]
144.500: (harvest-energy vehicle0)  [10.000]
154.501: (harvest-energy vehicle0)  [10.000]
164.502: (harvest-energy vehicle0)  [10.000]
174.503: (localize-cable vehicle0 waypoint52 turbine10)  [15.000]
492.089: (harvest-energy vehicle0)  [10.000]
502.090: (retrieve-data vehicle0 data10 waypoint52 currenttide currentwaves turbine10)  [55.000]
557.091: (surface vehicle0)  [40.000]
597.092: (harvest-energy vehicle0)  [10.000]
607.093: (harvest-energy vehicle0)  [10.000]
617.094: (harvest-energy vehicle0)  [10.000]
627.095: (harvest-energy vehicle0)  [10.000]
637.096: (harvest-energy vehicle0)  [10.000]
647.097: (harvest-energy vehicle0)  [10.000]
657.098: (upload-data-histograms vehicle0 data10)  [2.000]

 * All goal deadlines now no later than 659.098
b (0.000 | 659.098)