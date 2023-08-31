Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 29.155)b (6.000 | 99.606)b (5.000 | 140.332)b (4.000 | 165.334)b (3.000 | 710.397)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 29.155)b (6.000 | 99.606)b (5.000 | 140.332)b (4.000 | 165.334)b (2.000 | 1249.687)b (1.000 | 1251.687)(G)
; No metric specified - using makespan

; Plan found with metric 1251.688
; States evaluated so far: 4830
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.77
0.000: (move vehicle0 wp_init_auv0 waypoint24)  [9.153]
9.154: (harvest-energy vehicle0)  [10.000]
19.155: (harvest-energy vehicle0)  [10.000]
29.156: (move vehicle0 waypoint24 waypoint23)  [30.446]
59.603: (harvest-energy vehicle0)  [10.000]
69.604: (harvest-energy vehicle0)  [10.000]
79.605: (harvest-energy vehicle0)  [10.000]
89.606: (harvest-energy vehicle0)  [10.000]
99.607: (move vehicle0 waypoint23 waypoint22)  [20.723]
120.331: (harvest-energy vehicle0)  [10.000]
130.332: (harvest-energy vehicle0)  [10.000]
140.333: (localize-cable vehicle0 waypoint22 turbine4)  [15.000]
1084.679: (harvest-energy vehicle0)  [10.000]
1094.680: (retrieve-data vehicle0 data4 waypoint22 currenttide currentwaves turbine4)  [55.000]
1149.681: (surface vehicle0)  [40.000]
1189.682: (harvest-energy vehicle0)  [10.000]
1199.683: (harvest-energy vehicle0)  [10.000]
1209.684: (harvest-energy vehicle0)  [10.000]
1219.685: (harvest-energy vehicle0)  [10.000]
1229.686: (harvest-energy vehicle0)  [10.000]
1239.687: (harvest-energy vehicle0)  [10.000]
1249.688: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 1251.688
b (0.000 | 1251.688)