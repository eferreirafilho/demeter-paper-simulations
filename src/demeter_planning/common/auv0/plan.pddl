Number of literals: 14
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
(total-missions-completed vehicle0) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 16.000, admissible cost estimate 0.000
b (15.000 | 3.933)b (14.000 | 3.933)b (13.000 | 47.534)b (12.000 | 47.534)b (11.000 | 149.319)b (10.000 | 149.319)b (9.000 | 210.153)b (8.000 | 210.153)b (6.000 | 215.408)b (5.000 | 225.409)b (4.000 | 225.410)b (2.000 | 439.888)(G)
; No metric specified - using makespan

; Plan found with metric 441.889
; States evaluated so far: 29
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.03
0.000: (move vehicle0 wp_init_auv0 waypoint42)  [3.933]
3.934: (move vehicle0 waypoint42 waypoint40)  [43.600]
47.535: (move vehicle0 waypoint40 waypoint36)  [48.950]
96.486: (move vehicle0 waypoint36 waypoint32)  [52.833]
149.320: (move vehicle0 waypoint32 waypoint54)  [60.833]
210.154: (harvest-energy vehicle0)  [5.254]
215.409: (localize-cable vehicle0 waypoint54 turbine13)  [5.000]
220.410: (surface vehicle0)  [5.000]
225.411: (inspect-turbine vehicle0 data13 waypoint54 currenttide turbine13)  [200.000]
425.412: (surface vehicle0)  [5.000]
430.413: (harvest-energy vehicle0)  [9.475]
439.889: (upload-data-histograms vehicle0 data13)  [2.000]

 * All goal deadlines now no later than 441.889

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (15.000 | 3.933)b (14.000 | 3.933)b (13.000 | 47.534)b (12.000 | 47.534)b (11.000 | 149.319)b (10.000 | 149.319)b (9.000 | 210.153)b (8.000 | 210.153)b (6.000 | 215.408)b (5.000 | 225.409)b (4.000 | 225.410)b (2.000 | 434.387)(G)
; No metric specified - using makespan

; Plan found with metric 436.388
; States evaluated so far: 75
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.08
0.000: (move vehicle0 wp_init_auv0 waypoint42)  [3.933]
3.934: (move vehicle0 waypoint42 waypoint40)  [43.600]
47.535: (move vehicle0 waypoint40 waypoint36)  [48.950]
96.486: (move vehicle0 waypoint36 waypoint32)  [52.833]
149.320: (move vehicle0 waypoint32 waypoint54)  [60.833]
210.154: (harvest-energy vehicle0)  [5.254]
215.409: (localize-cable vehicle0 waypoint54 turbine13)  [5.000]
220.410: (inspect-turbine vehicle0 data13 waypoint54 currenttide turbine13)  [200.000]
420.411: (surface vehicle0)  [5.000]
425.412: (harvest-energy vehicle0)  [8.975]
434.388: (upload-data-histograms vehicle0 data13)  [2.000]

 * All goal deadlines now no later than 436.388
b (0.000 | 436.388)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 528
; Cost: 436.388
; Time 0.67
0.000: (move vehicle0 wp_init_auv0 waypoint42)  [3.933]
3.934: (move vehicle0 waypoint42 waypoint40)  [43.600]
47.535: (move vehicle0 waypoint40 waypoint36)  [48.950]
96.486: (move vehicle0 waypoint36 waypoint32)  [52.833]
149.320: (move vehicle0 waypoint32 waypoint54)  [60.833]
210.154: (harvest-energy vehicle0)  [5.254]
215.409: (localize-cable vehicle0 waypoint54 turbine13)  [5.000]
220.410: (inspect-turbine vehicle0 data13 waypoint54 currenttide turbine13)  [200.000]
420.411: (surface vehicle0)  [5.000]
425.412: (harvest-energy vehicle0)  [8.975]
434.388: (upload-data-histograms vehicle0 data13)  [2.000]
