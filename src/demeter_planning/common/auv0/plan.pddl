Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 29.894)b (6.000 | 170.226)b (5.000 | 210.952)b (4.000 | 235.954)b (3.000 | 781.016)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 29.894)b (6.000 | 170.226)b (5.000 | 210.952)b (4.000 | 235.954)b (2.000 | 690.017)b (1.000 | 692.017)(G)
; No metric specified - using makespan

; Plan found with metric 692.018
; States evaluated so far: 3566
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.20
0.000: (move vehicle0 wp_init_auv0 waypoint19)  [9.892]
9.893: (harvest-energy vehicle0)  [10.000]
19.894: (harvest-energy vehicle0)  [10.000]
29.895: (move vehicle0 waypoint19 waypoint16)  [60.323]
90.219: (harvest-energy vehicle0)  [10.000]
100.220: (harvest-energy vehicle0)  [10.000]
110.221: (harvest-energy vehicle0)  [10.000]
120.222: (harvest-energy vehicle0)  [10.000]
130.223: (harvest-energy vehicle0)  [10.000]
140.224: (harvest-energy vehicle0)  [10.000]
150.225: (harvest-energy vehicle0)  [10.000]
160.226: (harvest-energy vehicle0)  [10.000]
170.227: (move vehicle0 waypoint16 waypoint12)  [20.723]
190.951: (harvest-energy vehicle0)  [10.000]
200.952: (harvest-energy vehicle0)  [10.000]
210.953: (localize-cable vehicle0 waypoint12 turbine2)  [15.000]
525.009: (harvest-energy vehicle0)  [10.000]
535.010: (retrieve-data vehicle0 data2 waypoint12 currenttide currentwaves turbine2)  [55.000]
590.011: (surface vehicle0)  [40.000]
630.012: (harvest-energy vehicle0)  [10.000]
640.013: (harvest-energy vehicle0)  [10.000]
650.014: (harvest-energy vehicle0)  [10.000]
660.015: (harvest-energy vehicle0)  [10.000]
670.016: (harvest-energy vehicle0)  [10.000]
680.017: (harvest-energy vehicle0)  [10.000]
690.018: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 692.018
b (0.000 | 692.018)