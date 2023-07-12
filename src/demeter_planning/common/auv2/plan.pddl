Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 42.916)b (7.000 | 111.405)b (6.000 | 328.929)b (5.000 | 459.477)b (4.000 | 484.479)b (3.000 | 1029.540)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 42.916)b (7.000 | 111.405)b (6.000 | 328.929)b (5.000 | 459.477)b (4.000 | 484.479)b (2.000 | 873.447)b (1.000 | 875.448)(G)
; No metric specified - using makespan

; Plan found with metric 875.448
; States evaluated so far: 4964
; States pruned based on pre-heuristic cost lower bound: 0
; Time 5.89
0.000: (move vehicle2 wp_init_auv2 waypoint7)  [22.914]
22.915: (harvest-energy vehicle2)  [10.000]
32.916: (harvest-energy vehicle2)  [10.000]
42.917: (move vehicle2 waypoint7 waypoint8)  [38.485]
81.403: (harvest-energy vehicle2)  [10.000]
91.404: (harvest-energy vehicle2)  [10.000]
101.405: (harvest-energy vehicle2)  [10.000]
111.406: (move vehicle2 waypoint8 waypoint23)  [127.514]
238.921: (harvest-energy vehicle2)  [10.000]
248.922: (harvest-energy vehicle2)  [10.000]
258.923: (harvest-energy vehicle2)  [10.000]
268.924: (harvest-energy vehicle2)  [10.000]
278.925: (harvest-energy vehicle2)  [10.000]
288.926: (harvest-energy vehicle2)  [10.000]
298.927: (harvest-energy vehicle2)  [10.000]
308.928: (harvest-energy vehicle2)  [10.000]
318.929: (harvest-energy vehicle2)  [10.000]
328.930: (move vehicle2 waypoint23 waypoint52)  [80.542]
409.473: (harvest-energy vehicle2)  [10.000]
419.474: (harvest-energy vehicle2)  [10.000]
429.475: (harvest-energy vehicle2)  [10.000]
439.476: (harvest-energy vehicle2)  [10.000]
449.477: (harvest-energy vehicle2)  [10.000]
459.478: (localize-cable vehicle2 waypoint52 turbine10)  [15.000]
708.439: (harvest-energy vehicle2)  [10.000]
718.440: (retrieve-data vehicle2 data10 waypoint52 currenttide turbine10)  [55.000]
773.441: (surface vehicle2)  [40.000]
813.442: (harvest-energy vehicle2)  [10.000]
823.443: (harvest-energy vehicle2)  [10.000]
833.444: (harvest-energy vehicle2)  [10.000]
843.445: (harvest-energy vehicle2)  [10.000]
853.446: (harvest-energy vehicle2)  [10.000]
863.447: (harvest-energy vehicle2)  [10.000]
873.448: (upload-data-histograms vehicle2 data10)  [2.000]

 * All goal deadlines now no later than 875.448
b (0.000 | 875.448)