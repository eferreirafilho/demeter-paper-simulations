Number of literals: 15
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000, admissible cost estimate 0.000
b (10.000 | 358.610)b (9.000 | 358.610)b (8.000 | 358.610)b (7.000 | 358.610)b (6.000 | 358.610)b (5.000 | 480.451)b (4.000 | 505.453)b (3.000 | 1050.513)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (10.000 | 358.610)b (9.000 | 358.610)b (8.000 | 358.610)b (7.000 | 358.610)b (6.000 | 358.610)b (5.000 | 480.451)b (4.000 | 505.453)b (2.000 | 873.667)b (1.000 | 875.668)(G)
; No metric specified - using makespan

; Plan found with metric 875.668
; States evaluated so far: 5604
; States pruned based on pre-heuristic cost lower bound: 0
; Time 6.56
0.000: (move vehicle2 wp_init_auv2 waypoint32)  [19.714]
19.715: (harvest-energy vehicle2)  [10.000]
29.716: (harvest-energy vehicle2)  [10.000]
39.717: (move vehicle2 waypoint32 waypoint30)  [61.857]
101.575: (harvest-energy vehicle2)  [10.000]
111.576: (harvest-energy vehicle2)  [10.000]
121.577: (harvest-energy vehicle2)  [10.000]
131.578: (harvest-energy vehicle2)  [10.000]
141.579: (move vehicle2 waypoint30 waypoint29)  [20.514]
162.094: (harvest-energy vehicle2)  [10.000]
172.095: (harvest-energy vehicle2)  [10.000]
182.096: (move vehicle2 waypoint29 waypoint24)  [82.171]
264.268: (harvest-energy vehicle2)  [10.000]
274.269: (harvest-energy vehicle2)  [10.000]
284.270: (harvest-energy vehicle2)  [10.000]
294.271: (harvest-energy vehicle2)  [10.000]
304.272: (harvest-energy vehicle2)  [10.000]
314.273: (move vehicle2 waypoint24 waypoint47)  [96.171]
410.445: (harvest-energy vehicle2)  [10.000]
420.446: (harvest-energy vehicle2)  [10.000]
430.447: (harvest-energy vehicle2)  [10.000]
440.448: (harvest-energy vehicle2)  [10.000]
450.449: (harvest-energy vehicle2)  [10.000]
460.450: (harvest-energy vehicle2)  [10.000]
470.451: (harvest-energy vehicle2)  [10.000]
480.452: (localize-cable vehicle2 waypoint47 turbine9)  [15.000]
708.659: (harvest-energy vehicle2)  [10.000]
718.660: (retrieve-data vehicle2 data9 waypoint47 currenttide turbine9)  [55.000]
773.661: (surface vehicle2)  [40.000]
813.662: (harvest-energy vehicle2)  [10.000]
823.663: (harvest-energy vehicle2)  [10.000]
833.664: (harvest-energy vehicle2)  [10.000]
843.665: (harvest-energy vehicle2)  [10.000]
853.666: (harvest-energy vehicle2)  [10.000]
863.667: (harvest-energy vehicle2)  [10.000]
873.668: (upload-data-histograms vehicle2 data9)  [2.000]

 * All goal deadlines now no later than 875.668
b (0.000 | 875.668)