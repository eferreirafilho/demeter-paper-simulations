Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
50% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 6.000, admissible cost estimate 0.000
b (5.000 | 32.863)b (4.000 | 57.865)b (3.000 | 602.932)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (5.000 | 32.863)b (4.000 | 57.865)b (2.000 | 901.205)b (1.000 | 901.205)(G)
; No metric specified - using makespan

; Plan found with metric 901.205
; States evaluated so far: 1937
; States pruned based on pre-heuristic cost lower bound: 0
; Time 1.33
0.000: (move vehicle1 wp_init_auv1 waypoint12)  [12.861]
12.862: (harvest-energy vehicle1)  [10.000]
22.863: (harvest-energy vehicle1)  [10.000]
32.864: (localize-cable vehicle1 waypoint12 turbine2)  [15.000]
591.169: (harvest-energy vehicle1)  [10.000]
601.170: (retrieve-data vehicle1 data2 waypoint12 currenttide currentwaves turbine2)  [55.000]
656.171: (surface vehicle1)  [40.000]
696.172: (harvest-energy vehicle1)  [10.000]
706.173: (harvest-energy vehicle1)  [10.000]
716.174: (harvest-energy vehicle1)  [10.000]
726.175: (harvest-energy vehicle1)  [10.000]
736.176: (harvest-energy vehicle1)  [10.000]
746.177: (harvest-energy vehicle1)  [10.000]
756.178: (upload-data-histograms vehicle1 data2)  [2.000]

 * All goal deadlines now no later than 901.205
b (0.000 | 901.205)(G)
; No metric specified - using makespan

; Plan found with metric 758.178
; States evaluated so far: 1969
; States pruned based on pre-heuristic cost lower bound: 139
; Time 1.36
0.000: (move vehicle1 wp_init_auv1 waypoint12)  [12.861]
12.862: (harvest-energy vehicle1)  [10.000]
22.863: (harvest-energy vehicle1)  [10.000]
32.864: (localize-cable vehicle1 waypoint12 turbine2)  [15.000]
591.169: (harvest-energy vehicle1)  [10.000]
601.170: (retrieve-data vehicle1 data2 waypoint12 currenttide currentwaves turbine2)  [55.000]
656.171: (surface vehicle1)  [40.000]
696.172: (harvest-energy vehicle1)  [10.000]
706.173: (harvest-energy vehicle1)  [10.000]
716.174: (harvest-energy vehicle1)  [10.000]
726.175: (harvest-energy vehicle1)  [10.000]
736.176: (harvest-energy vehicle1)  [10.000]
746.177: (harvest-energy vehicle1)  [10.000]
756.178: (upload-data-histograms vehicle1 data2)  [2.000]

 * All goal deadlines now no later than 758.178
b (0.000 | 758.178)