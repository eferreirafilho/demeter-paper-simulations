Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 28.955)b (5.000 | 123.284)b (4.000 | 148.286)b (3.000 | 693.351)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 28.955)b (5.000 | 123.284)b (4.000 | 148.286)b (2.000 | 1093.852)b (1.000 | 1095.853)(G)
; No metric specified - using makespan

; Plan found with metric 1095.853
; States evaluated so far: 4336
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.11
0.000: (move vehicle0 wp_init_auv0 waypoint18)  [8.953]
8.954: (harvest-energy vehicle0)  [10.000]
18.955: (harvest-energy vehicle0)  [10.000]
28.956: (move vehicle0 waypoint18 waypoint42)  [44.323]
73.280: (harvest-energy vehicle0)  [10.000]
83.281: (harvest-energy vehicle0)  [10.000]
93.282: (harvest-energy vehicle0)  [10.000]
103.283: (harvest-energy vehicle0)  [10.000]
113.284: (harvest-energy vehicle0)  [10.000]
123.285: (localize-cable vehicle0 waypoint42 turbine8)  [15.000]
928.844: (harvest-energy vehicle0)  [10.000]
938.845: (retrieve-data vehicle0 data8 waypoint42 currenttide currentwaves turbine8)  [55.000]
993.846: (surface vehicle0)  [40.000]
1033.847: (harvest-energy vehicle0)  [10.000]
1043.848: (harvest-energy vehicle0)  [10.000]
1053.849: (harvest-energy vehicle0)  [10.000]
1063.850: (harvest-energy vehicle0)  [10.000]
1073.851: (harvest-energy vehicle0)  [10.000]
1083.852: (harvest-energy vehicle0)  [10.000]
1093.853: (upload-data-histograms vehicle0 data8)  [2.000]

 * All goal deadlines now no later than 1095.853
b (0.000 | 1095.853)