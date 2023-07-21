Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
50% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 27.650)b (5.000 | 30.463)b (4.000 | 55.465)b (2.000 | 210.473)b (1.000 | 212.474)(G)
; No metric specified - using makespan

; Plan found with metric 212.474
; States evaluated so far: 46
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.06
0.000: (move vehicle0 wp_init_auv0 waypoint27)  [10.461]
10.462: (harvest-energy vehicle0)  [10.000]
20.463: (harvest-energy vehicle0)  [10.000]
30.464: (localize-cable vehicle0 waypoint27 turbine5)  [15.000]
45.465: (harvest-energy vehicle0)  [10.000]
55.466: (retrieve-data vehicle0 data5 waypoint27 currenttide currentwaves turbine5)  [55.000]
110.467: (surface vehicle0)  [40.000]
150.468: (harvest-energy vehicle0)  [10.000]
160.469: (harvest-energy vehicle0)  [10.000]
170.470: (harvest-energy vehicle0)  [10.000]
180.471: (harvest-energy vehicle0)  [10.000]
190.472: (harvest-energy vehicle0)  [10.000]
200.473: (harvest-energy vehicle0)  [10.000]
210.474: (upload-data-histograms vehicle0 data5)  [2.000]

 * All goal deadlines now no later than 212.474

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 27.650)b (5.000 | 30.463)b (4.000 | 55.465)b (2.000 | 210.473)b (1.000 | 212.474)