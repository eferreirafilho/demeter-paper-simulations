Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
28% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 4.201)b (6.000 | 55.264)b (4.000 | 81.267)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 4.201)b (6.000 | 55.264)b (4.000 | 81.267)b (2.000 | 146.319)b (1.000 | 148.320)(G)
; No metric specified - using makespan

; Plan found with metric 148.320
; States evaluated so far: 3605
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.42
0.000: (move vehicle0 wp_init_auv0 waypoint20)  [3.200]
3.201: (harvest-energy vehicle0)  [1.000]
4.202: (move vehicle0 waypoint20 waypoint22)  [49.060]
53.263: (harvest-energy vehicle0)  [1.000]
54.264: (harvest-energy vehicle0)  [1.000]
55.265: (localize-cable vehicle0 waypoint22 turbine5)  [10.000]
65.266: (surface vehicle0)  [15.000]
117.314: (harvest-energy vehicle0)  [1.000]
118.315: (retrieve-data vehicle0 data5 waypoint22 currenttide turbine5)  [10.000]
128.316: (surface vehicle0)  [15.000]
143.317: (harvest-energy vehicle0)  [1.000]
144.318: (harvest-energy vehicle0)  [1.000]
145.319: (harvest-energy vehicle0)  [1.000]
146.320: (upload-data-histograms vehicle0 data5)  [2.000]

 * All goal deadlines now no later than 148.320
b (0.000 | 148.320)