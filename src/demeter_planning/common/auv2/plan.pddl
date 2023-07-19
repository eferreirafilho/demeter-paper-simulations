Number of literals: 15
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000, admissible cost estimate 0.000
b (10.000 | 358.685)b (9.000 | 358.685)b (8.000 | 358.685)b (7.000 | 358.685)b (6.000 | 485.421)b (5.000 | 627.885)b (4.000 | 652.887)b (3.000 | 1197.947)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (10.000 | 358.685)b (9.000 | 358.685)b (8.000 | 358.685)b (7.000 | 358.685)b (6.000 | 485.421)b (5.000 | 627.885)b (4.000 | 652.887)b (2.000 | 873.732)b (1.000 | 875.733)(G)
; No metric specified - using makespan

; Plan found with metric 875.733
; States evaluated so far: 6008
; States pruned based on pre-heuristic cost lower bound: 0
; Time 6.41
0.000: (move vehicle2 wp_init_auv2 waypoint32)  [22.028]
22.029: (harvest-energy vehicle2)  [10.000]
32.030: (harvest-energy vehicle2)  [10.000]
42.031: (move vehicle2 waypoint32 waypoint27)  [90.800]
132.832: (harvest-energy vehicle2)  [10.000]
142.833: (harvest-energy vehicle2)  [10.000]
152.834: (harvest-energy vehicle2)  [10.000]
162.835: (harvest-energy vehicle2)  [10.000]
172.836: (harvest-energy vehicle2)  [10.000]
182.837: (harvest-energy vehicle2)  [10.000]
192.838: (move vehicle2 waypoint27 waypoint22)  [82.171]
275.010: (harvest-energy vehicle2)  [10.000]
285.011: (harvest-energy vehicle2)  [10.000]
295.012: (harvest-energy vehicle2)  [10.000]
305.013: (harvest-energy vehicle2)  [10.000]
315.014: (harvest-energy vehicle2)  [10.000]
325.015: (harvest-energy vehicle2)  [10.000]
335.016: (move vehicle2 waypoint22 waypoint17)  [90.399]
425.416: (harvest-energy vehicle2)  [10.000]
435.417: (harvest-energy vehicle2)  [10.000]
445.418: (harvest-energy vehicle2)  [10.000]
455.419: (harvest-energy vehicle2)  [10.000]
465.420: (harvest-energy vehicle2)  [10.000]
475.421: (harvest-energy vehicle2)  [10.000]
485.422: (move vehicle2 waypoint17 waypoint12)  [82.457]
567.880: (harvest-energy vehicle2)  [10.000]
577.881: (harvest-energy vehicle2)  [10.000]
587.882: (harvest-energy vehicle2)  [10.000]
597.883: (harvest-energy vehicle2)  [10.000]
607.884: (harvest-energy vehicle2)  [10.000]
617.885: (harvest-energy vehicle2)  [10.000]
627.886: (localize-cable vehicle2 waypoint12 turbine2)  [15.000]
708.724: (harvest-energy vehicle2)  [10.000]
718.725: (retrieve-data vehicle2 data2 waypoint12 currenttide turbine2)  [55.000]
773.726: (surface vehicle2)  [40.000]
813.727: (harvest-energy vehicle2)  [10.000]
823.728: (harvest-energy vehicle2)  [10.000]
833.729: (harvest-energy vehicle2)  [10.000]
843.730: (harvest-energy vehicle2)  [10.000]
853.731: (harvest-energy vehicle2)  [10.000]
863.732: (harvest-energy vehicle2)  [10.000]
873.733: (upload-data-histograms vehicle2 data2)  [2.000]

 * All goal deadlines now no later than 875.733
b (0.000 | 875.733)