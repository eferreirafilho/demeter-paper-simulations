Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 30.848)b (5.000 | 68.235)b (4.000 | 93.237)b (3.000 | 638.304)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 30.848)b (5.000 | 68.235)b (4.000 | 93.237)b (2.000 | 1000.662)b (1.000 | 1002.662)(G)
; No metric specified - using makespan

; Plan found with metric 1002.663
; States evaluated so far: 3572
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.20
0.000: (move vehicle0 wp_init_auv0 waypoint39)  [10.846]
10.847: (harvest-energy vehicle0)  [10.000]
20.848: (harvest-energy vehicle0)  [10.000]
30.849: (move vehicle0 waypoint39 waypoint72)  [17.384]
48.234: (harvest-energy vehicle0)  [10.000]
58.235: (harvest-energy vehicle0)  [10.000]
68.236: (localize-cable vehicle0 waypoint72 turbine14)  [15.000]
835.654: (harvest-energy vehicle0)  [10.000]
845.655: (retrieve-data vehicle0 data14 waypoint72 currenttide currentwaves turbine14)  [55.000]
900.656: (surface vehicle0)  [40.000]
940.657: (harvest-energy vehicle0)  [10.000]
950.658: (harvest-energy vehicle0)  [10.000]
960.659: (harvest-energy vehicle0)  [10.000]
970.660: (harvest-energy vehicle0)  [10.000]
980.661: (harvest-energy vehicle0)  [10.000]
990.662: (harvest-energy vehicle0)  [10.000]
1000.663: (upload-data-histograms vehicle0 data14)  [2.000]

 * All goal deadlines now no later than 1002.663
b (0.000 | 1002.663)