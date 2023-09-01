Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 570.500)b (6.000 | 570.500)b (5.000 | 570.500)b (4.000 | 570.500)b (2.000 | 725.508)b (1.000 | 727.508)(G)
; No metric specified - using makespan

; Plan found with metric 727.509
; States evaluated so far: 75
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.08
0.000: (move vehicle0 wp_init_auv0 waypoint24)  [9.000]
9.001: (harvest-energy vehicle0)  [10.000]
19.002: (harvest-energy vehicle0)  [10.000]
29.003: (move vehicle0 waypoint24 waypoint57)  [46.384]
75.388: (harvest-energy vehicle0)  [10.000]
85.389: (harvest-energy vehicle0)  [10.000]
95.390: (harvest-energy vehicle0)  [10.000]
105.391: (harvest-energy vehicle0)  [10.000]
115.392: (harvest-energy vehicle0)  [10.000]
125.393: (harvest-energy vehicle0)  [10.000]
135.394: (localize-cable vehicle0 waypoint57 turbine11)  [15.000]
560.500: (harvest-energy vehicle0)  [10.000]
570.501: (retrieve-data vehicle0 data11 waypoint57 currenttide currentwaves turbine11)  [55.000]
625.502: (surface vehicle0)  [40.000]
665.503: (harvest-energy vehicle0)  [10.000]
675.504: (harvest-energy vehicle0)  [10.000]
685.505: (harvest-energy vehicle0)  [10.000]
695.506: (harvest-energy vehicle0)  [10.000]
705.507: (harvest-energy vehicle0)  [10.000]
715.508: (harvest-energy vehicle0)  [10.000]
725.509: (upload-data-histograms vehicle0 data11)  [2.000]

 * All goal deadlines now no later than 727.509

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 570.500)b (6.000 | 570.500)b (5.000 | 570.500)b (4.000 | 570.500)