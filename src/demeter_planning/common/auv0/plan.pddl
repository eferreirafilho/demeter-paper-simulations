Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 30.771)b (6.000 | 120.561)b (5.000 | 174.441)b (4.000 | 199.443)b (3.000 | 744.506)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 30.771)b (6.000 | 120.561)b (5.000 | 174.441)b (4.000 | 199.443)b (2.000 | 793.817)b (1.000 | 795.818)(G)
; No metric specified - using makespan

; Plan found with metric 795.818
; States evaluated so far: 3581
; States pruned based on pre-heuristic cost lower bound: 0
; Time 2.57
0.000: (move vehicle0 wp_init_auv0 waypoint27)  [10.769]
10.770: (harvest-energy vehicle0)  [10.000]
20.771: (harvest-energy vehicle0)  [10.000]
30.772: (move vehicle0 waypoint27 waypoint25)  [39.784]
70.557: (harvest-energy vehicle0)  [10.000]
80.558: (harvest-energy vehicle0)  [10.000]
90.559: (harvest-energy vehicle0)  [10.000]
100.560: (harvest-energy vehicle0)  [10.000]
110.561: (harvest-energy vehicle0)  [10.000]
120.562: (move vehicle0 waypoint25 waypoint52)  [23.876]
144.439: (harvest-energy vehicle0)  [10.000]
154.440: (harvest-energy vehicle0)  [10.000]
164.441: (harvest-energy vehicle0)  [10.000]
174.442: (localize-cable vehicle0 waypoint52 turbine10)  [15.000]
628.809: (harvest-energy vehicle0)  [10.000]
638.810: (retrieve-data vehicle0 data10 waypoint52 currenttide currentwaves turbine10)  [55.000]
693.811: (surface vehicle0)  [40.000]
733.812: (harvest-energy vehicle0)  [10.000]
743.813: (harvest-energy vehicle0)  [10.000]
753.814: (harvest-energy vehicle0)  [10.000]
763.815: (harvest-energy vehicle0)  [10.000]
773.816: (harvest-energy vehicle0)  [10.000]
783.817: (harvest-energy vehicle0)  [10.000]
793.818: (upload-data-histograms vehicle0 data10)  [2.000]

 * All goal deadlines now no later than 795.818
b (0.000 | 795.818)