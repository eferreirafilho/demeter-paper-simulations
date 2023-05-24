Number of literals: 15
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
No semaphore facts found, returning
(total-missions-completed vehicle1) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle1) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle1) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 18.000, admissible cost estimate 0.000
b (17.000 | 5.066)b (16.000 | 5.066)b (15.000 | 16.133)b (14.000 | 16.133)b (13.000 | 61.784)b (12.000 | 61.784)b (11.000 | 155.535)b (10.000 | 155.535)b (9.000 | 214.368)b (8.000 | 214.369)b (6.000 | 219.831)b (5.000 | 229.832)b (4.000 | 229.833)b (2.000 | 444.311)(G)
; No metric specified - using makespan

; Plan found with metric 446.312
; States evaluated so far: 31
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.03
0.000: (move vehicle1 wp_init_auv1 waypoint61)  [5.066]
5.067: (move vehicle1 waypoint61 waypoint57)  [11.066]
16.134: (move vehicle1 waypoint57 waypoint52)  [45.650]
61.785: (move vehicle1 waypoint52 waypoint49)  [47.066]
108.852: (move vehicle1 waypoint49 waypoint44)  [46.683]
155.536: (move vehicle1 waypoint44 waypoint72)  [58.833]
214.370: (harvest-energy vehicle1)  [5.461]
219.832: (localize-cable vehicle1 waypoint72 turbine14)  [5.000]
224.833: (surface vehicle1)  [5.000]
229.834: (inspect-turbine vehicle1 data14 waypoint72 currenttide turbine14)  [200.000]
429.835: (surface vehicle1)  [5.000]
434.836: (harvest-energy vehicle1)  [9.475]
444.312: (upload-data-histograms vehicle1 data14)  [2.000]

 * All goal deadlines now no later than 446.312

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (17.000 | 5.066)b (16.000 | 5.066)b (15.000 | 16.133)b (14.000 | 16.133)b (13.000 | 61.784)b (12.000 | 61.784)b (11.000 | 155.535)b (10.000 | 155.535)b (9.000 | 214.368)b (8.000 | 214.369)b (6.000 | 219.831)b (5.000 | 229.832)b (4.000 | 229.833)b (2.000 | 438.810)(G)
; No metric specified - using makespan

; Plan found with metric 440.811
; States evaluated so far: 80
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.08
0.000: (move vehicle1 wp_init_auv1 waypoint61)  [5.066]
5.067: (move vehicle1 waypoint61 waypoint57)  [11.066]
16.134: (move vehicle1 waypoint57 waypoint52)  [45.650]
61.785: (move vehicle1 waypoint52 waypoint49)  [47.066]
108.852: (move vehicle1 waypoint49 waypoint44)  [46.683]
155.536: (move vehicle1 waypoint44 waypoint72)  [58.833]
214.370: (harvest-energy vehicle1)  [5.461]
219.832: (localize-cable vehicle1 waypoint72 turbine14)  [5.000]
224.833: (inspect-turbine vehicle1 data14 waypoint72 currenttide turbine14)  [200.000]
424.834: (surface vehicle1)  [5.000]
429.835: (harvest-energy vehicle1)  [8.975]
438.811: (upload-data-histograms vehicle1 data14)  [2.000]

 * All goal deadlines now no later than 440.811
b (0.000 | 440.811)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 707
; Cost: 440.811
; Time 0.79
0.000: (move vehicle1 wp_init_auv1 waypoint61)  [5.066]
5.067: (move vehicle1 waypoint61 waypoint57)  [11.066]
16.134: (move vehicle1 waypoint57 waypoint52)  [45.650]
61.785: (move vehicle1 waypoint52 waypoint49)  [47.066]
108.852: (move vehicle1 waypoint49 waypoint44)  [46.683]
155.536: (move vehicle1 waypoint44 waypoint72)  [58.833]
214.370: (harvest-energy vehicle1)  [5.461]
219.832: (localize-cable vehicle1 waypoint72 turbine14)  [5.000]
224.833: (inspect-turbine vehicle1 data14 waypoint72 currenttide turbine14)  [200.000]
424.834: (surface vehicle1)  [5.000]
429.835: (harvest-energy vehicle1)  [8.975]
438.811: (upload-data-histograms vehicle1 data14)  [2.000]
