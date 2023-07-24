Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 29.648)b (5.000 | 63.712)b (4.000 | 88.714)b (3.000 | 633.780)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 29.648)b (5.000 | 63.712)b (4.000 | 88.714)b (2.000 | 997.817)b (1.000 | 999.818)(G)
; No metric specified - using makespan

; Plan found with metric 999.818
; States evaluated so far: 3572
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.09
0.000: (move vehicle1 wp_init_auv1 waypoint14)  [9.646]
9.647: (harvest-energy vehicle1)  [10.000]
19.648: (harvest-energy vehicle1)  [10.000]
29.649: (move vehicle1 waypoint14 waypoint42)  [14.061]
43.711: (harvest-energy vehicle1)  [10.000]
53.712: (harvest-energy vehicle1)  [10.000]
63.713: (localize-cable vehicle1 waypoint42 turbine8)  [15.000]
832.809: (harvest-energy vehicle1)  [10.000]
842.810: (retrieve-data vehicle1 data8 waypoint42 currenttide currentwaves turbine8)  [55.000]
897.811: (surface vehicle1)  [40.000]
937.812: (harvest-energy vehicle1)  [10.000]
947.813: (harvest-energy vehicle1)  [10.000]
957.814: (harvest-energy vehicle1)  [10.000]
967.815: (harvest-energy vehicle1)  [10.000]
977.816: (harvest-energy vehicle1)  [10.000]
987.817: (harvest-energy vehicle1)  [10.000]
997.818: (upload-data-histograms vehicle1 data8)  [2.000]

 * All goal deadlines now no later than 999.818
b (0.000 | 999.818)