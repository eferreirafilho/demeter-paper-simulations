Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 30.000, admissible cost estimate 0.000
b (28.000 | 10.000)b (26.000 | 20.001)b (24.000 | 30.002)b (22.000 | 40.003)b (20.000 | 50.004)b (18.000 | 60.005)b (16.000 | 70.006)b (14.000 | 80.007)b (12.000 | 90.008)b (10.000 | 100.009)b (8.000 | 110.010)b (7.000 | 129.888)b (6.000 | 270.220)b (5.000 | 320.947)b (4.000 | 345.949)b (3.000 | 891.009)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (28.000 | 10.000)b (26.000 | 20.001)b (24.000 | 30.002)b (22.000 | 40.003)b (20.000 | 50.004)b (18.000 | 60.005)b (16.000 | 70.006)b (14.000 | 80.007)b (12.000 | 90.008)b (10.000 | 100.009)b (8.000 | 110.010)b (7.000 | 129.888)b (6.000 | 270.220)b (5.000 | 320.947)b (4.000 | 345.949)b (2.000 | 603.292)b (1.000 | 605.293)(G)
; No metric specified - using makespan

; Plan found with metric 605.293
; States evaluated so far: 5627
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.83
0.000: (harvest-energy vehicle0)  [10.000]
10.001: (harvest-energy vehicle0)  [10.000]
20.002: (harvest-energy vehicle0)  [10.000]
30.003: (harvest-energy vehicle0)  [10.000]
40.004: (harvest-energy vehicle0)  [10.000]
50.005: (harvest-energy vehicle0)  [10.000]
60.006: (harvest-energy vehicle0)  [10.000]
70.007: (harvest-energy vehicle0)  [10.000]
80.008: (harvest-energy vehicle0)  [10.000]
90.009: (harvest-energy vehicle0)  [10.000]
100.010: (harvest-energy vehicle0)  [10.000]
110.011: (move vehicle0 wp_init_auv0 waypoint19)  [9.876]
119.888: (harvest-energy vehicle0)  [10.000]
129.889: (move vehicle0 waypoint19 waypoint16)  [60.323]
190.213: (harvest-energy vehicle0)  [10.000]
200.214: (harvest-energy vehicle0)  [10.000]
210.215: (harvest-energy vehicle0)  [10.000]
220.216: (harvest-energy vehicle0)  [10.000]
230.217: (harvest-energy vehicle0)  [10.000]
240.218: (harvest-energy vehicle0)  [10.000]
250.219: (harvest-energy vehicle0)  [10.000]
260.220: (harvest-energy vehicle0)  [10.000]
270.221: (move vehicle0 waypoint16 waypoint12)  [20.723]
290.945: (harvest-energy vehicle0)  [10.000]
300.946: (harvest-energy vehicle0)  [10.000]
310.947: (harvest-energy vehicle0)  [10.000]
320.948: (localize-cable vehicle0 waypoint12 turbine2)  [15.000]
438.284: (harvest-energy vehicle0)  [10.000]
448.285: (retrieve-data vehicle0 data2 waypoint12 currenttide currentwaves turbine2)  [55.000]
503.286: (surface vehicle0)  [40.000]
543.287: (harvest-energy vehicle0)  [10.000]
553.288: (harvest-energy vehicle0)  [10.000]
563.289: (harvest-energy vehicle0)  [10.000]
573.290: (harvest-energy vehicle0)  [10.000]
583.291: (harvest-energy vehicle0)  [10.000]
593.292: (harvest-energy vehicle0)  [10.000]
603.293: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 605.293
b (0.000 | 605.293)