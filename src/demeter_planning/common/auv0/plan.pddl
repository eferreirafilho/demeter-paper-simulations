Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 29.909)b (6.000 | 50.957)b (5.000 | 141.070)b (4.000 | 166.072)b (3.000 | 711.136)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 29.909)b (6.000 | 50.957)b (5.000 | 141.070)b (4.000 | 166.072)b (2.000 | 666.387)b (1.000 | 668.387)(G)
; No metric specified - using makespan

; Plan found with metric 668.388
; States evaluated so far: 3023
; States pruned based on pre-heuristic cost lower bound: 0
; Time 2.68
0.000: (move vehicle0 wp_init_auv0 waypoint19)  [9.907]
9.908: (harvest-energy vehicle0)  [10.000]
19.909: (harvest-energy vehicle0)  [10.000]
29.910: (move vehicle0 waypoint19 waypoint20)  [11.046]
40.957: (harvest-energy vehicle0)  [10.000]
50.958: (move vehicle0 waypoint20 waypoint22)  [40.107]
91.066: (harvest-energy vehicle0)  [10.000]
101.067: (harvest-energy vehicle0)  [10.000]
111.068: (harvest-energy vehicle0)  [10.000]
121.069: (harvest-energy vehicle0)  [10.000]
131.070: (harvest-energy vehicle0)  [10.000]
141.071: (localize-cable vehicle0 waypoint22 turbine4)  [15.000]
501.379: (harvest-energy vehicle0)  [10.000]
511.380: (retrieve-data vehicle0 data4 waypoint22 currenttide currentwaves turbine4)  [55.000]
566.381: (surface vehicle0)  [40.000]
606.382: (harvest-energy vehicle0)  [10.000]
616.383: (harvest-energy vehicle0)  [10.000]
626.384: (harvest-energy vehicle0)  [10.000]
636.385: (harvest-energy vehicle0)  [10.000]
646.386: (harvest-energy vehicle0)  [10.000]
656.387: (harvest-energy vehicle0)  [10.000]
666.388: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 668.388
b (0.000 | 668.388)