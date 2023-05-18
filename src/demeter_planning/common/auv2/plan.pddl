Number of literals: 14
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
(total-missions-completed vehicle2) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle2) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle2) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 16.000, admissible cost estimate 0.000
b (15.000 | 4.316)b (14.000 | 4.316)b (13.000 | 64.616)b (12.000 | 64.617)b (10.000 | 133.952)b (9.000 | 193.953)b (8.000 | 193.953)b (6.000 | 263.823)b (5.000 | 273.824)b (4.000 | 273.825)b (2.000 | 488.303)(G)
; No metric specified - using makespan

; Plan found with metric 490.304
; States evaluated so far: 29
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.03
0.000: (move vehicle2 wp_init_auv2 waypoint12)  [4.316]
4.317: (move vehicle2 waypoint12 waypoint17)  [60.300]
64.618: (move vehicle2 waypoint17 waypoint22)  [66.066]
130.685: (harvest-energy vehicle2)  [3.267]
133.953: (move vehicle2 waypoint22 waypoint27)  [60.000]
193.954: (move vehicle2 waypoint27 waypoint32)  [66.700]
260.655: (harvest-energy vehicle2)  [3.168]
263.824: (localize-cable vehicle2 waypoint32 turbine6)  [5.000]
268.825: (surface vehicle2)  [5.000]
273.826: (inspect-turbine vehicle2 data6 waypoint32 currenttide turbine6)  [200.000]
473.827: (surface vehicle2)  [5.000]
478.828: (harvest-energy vehicle2)  [9.475]
488.304: (upload-data-histograms vehicle2 data6)  [2.000]

 * All goal deadlines now no later than 490.304

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (15.000 | 4.316)b (14.000 | 4.316)b (13.000 | 64.616)b (12.000 | 64.617)b (10.000 | 133.952)b (9.000 | 193.953)b (8.000 | 193.953)b (6.000 | 263.823)b (5.000 | 273.824)b (4.000 | 273.825)b (2.000 | 482.802)(G)
; No metric specified - using makespan

; Plan found with metric 484.803
; States evaluated so far: 77
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.08
0.000: (move vehicle2 wp_init_auv2 waypoint12)  [4.316]
4.317: (move vehicle2 waypoint12 waypoint17)  [60.300]
64.618: (move vehicle2 waypoint17 waypoint22)  [66.066]
130.685: (harvest-energy vehicle2)  [3.267]
133.953: (move vehicle2 waypoint22 waypoint27)  [60.000]
193.954: (move vehicle2 waypoint27 waypoint32)  [66.700]
260.655: (harvest-energy vehicle2)  [3.168]
263.824: (localize-cable vehicle2 waypoint32 turbine6)  [5.000]
268.825: (inspect-turbine vehicle2 data6 waypoint32 currenttide turbine6)  [200.000]
468.826: (surface vehicle2)  [5.000]
473.827: (harvest-energy vehicle2)  [8.975]
482.803: (upload-data-histograms vehicle2 data6)  [2.000]

 * All goal deadlines now no later than 484.803
b (0.000 | 484.803)(G)b (0.000 | 484.802)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 531
; Cost: 484.803
; Time 0.60
0.000: (move vehicle2 wp_init_auv2 waypoint12)  [4.316]
4.317: (move vehicle2 waypoint12 waypoint17)  [60.300]
64.618: (move vehicle2 waypoint17 waypoint22)  [66.066]
130.685: (harvest-energy vehicle2)  [3.267]
133.953: (move vehicle2 waypoint22 waypoint27)  [60.000]
193.954: (move vehicle2 waypoint27 waypoint32)  [66.700]
260.655: (harvest-energy vehicle2)  [3.168]
263.824: (localize-cable vehicle2 waypoint32 turbine6)  [5.000]
268.825: (inspect-turbine vehicle2 data6 waypoint32 currenttide turbine6)  [200.000]
468.826: (surface vehicle2)  [5.000]
473.827: (harvest-energy vehicle2)  [8.975]
482.803: (upload-data-histograms vehicle2 data6)  [2.000]
