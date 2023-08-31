Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 29.817)b (6.000 | 170.149)b (5.000 | 210.875)b (4.000 | 235.877)b (3.000 | 780.939)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 29.817)b (6.000 | 170.149)b (5.000 | 210.875)b (4.000 | 235.877)b (2.000 | 1039.077)b (1.000 | 1041.078)(G)
; No metric specified - using makespan

; Plan found with metric 1041.078
; States evaluated so far: 3566
; States pruned based on pre-heuristic cost lower bound: 0
; Time 2.67
0.000: (move vehicle0 wp_init_auv0 waypoint19)  [9.815]
9.816: (harvest-energy vehicle0)  [10.000]
19.817: (harvest-energy vehicle0)  [10.000]
29.818: (move vehicle0 waypoint19 waypoint16)  [60.323]
90.142: (harvest-energy vehicle0)  [10.000]
100.143: (harvest-energy vehicle0)  [10.000]
110.144: (harvest-energy vehicle0)  [10.000]
120.145: (harvest-energy vehicle0)  [10.000]
130.146: (harvest-energy vehicle0)  [10.000]
140.147: (harvest-energy vehicle0)  [10.000]
150.148: (harvest-energy vehicle0)  [10.000]
160.149: (harvest-energy vehicle0)  [10.000]
170.150: (move vehicle0 waypoint16 waypoint12)  [20.723]
190.874: (harvest-energy vehicle0)  [10.000]
200.875: (harvest-energy vehicle0)  [10.000]
210.876: (localize-cable vehicle0 waypoint12 turbine2)  [15.000]
874.069: (harvest-energy vehicle0)  [10.000]
884.070: (retrieve-data vehicle0 data2 waypoint12 currenttide currentwaves turbine2)  [55.000]
939.071: (surface vehicle0)  [40.000]
979.072: (harvest-energy vehicle0)  [10.000]
989.073: (harvest-energy vehicle0)  [10.000]
999.074: (harvest-energy vehicle0)  [10.000]
1009.075: (harvest-energy vehicle0)  [10.000]
1019.076: (harvest-energy vehicle0)  [10.000]
1029.077: (harvest-energy vehicle0)  [10.000]
1039.078: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 1041.078
b (0.000 | 1041.078)