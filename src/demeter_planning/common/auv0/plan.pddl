Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 31.771)b (6.000 | 140.470)b (5.000 | 247.107)b (4.000 | 272.109)b (3.000 | 817.168)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 31.771)b (6.000 | 140.470)b (5.000 | 247.107)b (4.000 | 272.109)b (2.000 | 618.537)b (1.000 | 620.537)(G)
; No metric specified - using makespan

; Plan found with metric 620.538
; States evaluated so far: 5143
; States pruned based on pre-heuristic cost lower bound: 0
; Time 5.42
0.000: (move vehicle0 wp_init_auv0 waypoint9)  [11.769]
11.770: (harvest-energy vehicle0)  [10.000]
21.771: (harvest-energy vehicle0)  [10.000]
31.772: (move vehicle0 waypoint9 waypoint4)  [48.692]
80.465: (harvest-energy vehicle0)  [10.000]
90.466: (harvest-energy vehicle0)  [10.000]
100.467: (harvest-energy vehicle0)  [10.000]
110.468: (harvest-energy vehicle0)  [10.000]
120.469: (harvest-energy vehicle0)  [10.000]
130.470: (harvest-energy vehicle0)  [10.000]
140.471: (move vehicle0 waypoint4 waypoint12)  [46.630]
187.102: (harvest-energy vehicle0)  [10.000]
197.103: (harvest-energy vehicle0)  [10.000]
207.104: (harvest-energy vehicle0)  [10.000]
217.105: (harvest-energy vehicle0)  [10.000]
227.106: (harvest-energy vehicle0)  [10.000]
237.107: (harvest-energy vehicle0)  [10.000]
247.108: (localize-cable vehicle0 waypoint12 turbine2)  [15.000]
453.529: (harvest-energy vehicle0)  [10.000]
463.530: (retrieve-data vehicle0 data2 waypoint12 currenttide currentwaves turbine2)  [55.000]
518.531: (surface vehicle0)  [40.000]
558.532: (harvest-energy vehicle0)  [10.000]
568.533: (harvest-energy vehicle0)  [10.000]
578.534: (harvest-energy vehicle0)  [10.000]
588.535: (harvest-energy vehicle0)  [10.000]
598.536: (harvest-energy vehicle0)  [10.000]
608.537: (harvest-energy vehicle0)  [10.000]
618.538: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 620.538
b (0.000 | 620.538)