Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 60.603)b (7.000 | 210.724)b (6.000 | 377.817)b (5.000 | 508.394)b (4.000 | 533.396)b (3.000 | 1078.457)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 60.603)b (7.000 | 210.724)b (6.000 | 377.817)b (5.000 | 508.394)b (4.000 | 533.396)b (2.000 | 873.192)b (1.000 | 875.193)(G)
; No metric specified - using makespan

; Plan found with metric 875.193
; States evaluated so far: 5745
; States pruned based on pre-heuristic cost lower bound: 0
; Time 5.74
0.000: (move vehicle0 wp_init_auv0 waypoint30)  [30.599]
30.601: (harvest-energy vehicle0)  [10.000]
40.602: (harvest-energy vehicle0)  [10.000]
50.603: (harvest-energy vehicle0)  [10.000]
60.604: (move vehicle0 waypoint30 waypoint34)  [90.114]
150.719: (harvest-energy vehicle0)  [10.000]
160.720: (harvest-energy vehicle0)  [10.000]
170.721: (harvest-energy vehicle0)  [10.000]
180.722: (harvest-energy vehicle0)  [10.000]
190.723: (harvest-energy vehicle0)  [10.000]
200.724: (harvest-energy vehicle0)  [10.000]
210.725: (move vehicle0 waypoint34 waypoint16)  [97.085]
307.811: (harvest-energy vehicle0)  [10.000]
317.812: (harvest-energy vehicle0)  [10.000]
327.813: (harvest-energy vehicle0)  [10.000]
337.814: (harvest-energy vehicle0)  [10.000]
347.815: (harvest-energy vehicle0)  [10.000]
357.816: (harvest-energy vehicle0)  [10.000]
367.817: (harvest-energy vehicle0)  [10.000]
377.818: (move vehicle0 waypoint16 waypoint18)  [80.571]
458.390: (harvest-energy vehicle0)  [10.000]
468.391: (harvest-energy vehicle0)  [10.000]
478.392: (harvest-energy vehicle0)  [10.000]
488.393: (harvest-energy vehicle0)  [10.000]
498.394: (harvest-energy vehicle0)  [10.000]
508.395: (localize-cable vehicle0 waypoint18 turbine4)  [15.000]
708.184: (harvest-energy vehicle0)  [10.000]
718.185: (retrieve-data vehicle0 data4 waypoint18 currenttide turbine4)  [55.000]
773.186: (surface vehicle0)  [40.000]
813.187: (harvest-energy vehicle0)  [10.000]
823.188: (harvest-energy vehicle0)  [10.000]
833.189: (harvest-energy vehicle0)  [10.000]
843.190: (harvest-energy vehicle0)  [10.000]
853.191: (harvest-energy vehicle0)  [10.000]
863.192: (harvest-energy vehicle0)  [10.000]
873.193: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 875.193
b (0.000 | 875.193)