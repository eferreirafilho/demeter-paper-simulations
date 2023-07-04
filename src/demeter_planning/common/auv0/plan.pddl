Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
50% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 357.690)b (8.000 | 357.690)b (7.000 | 357.690)b (6.000 | 376.073)b (4.000 | 436.076)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 357.690)b (8.000 | 357.690)b (7.000 | 357.690)b (6.000 | 376.073)b (4.000 | 436.076)b (2.000 | 872.912)b (1.000 | 874.912)(G)
; No metric specified - using makespan

; Plan found with metric 874.913
; States evaluated so far: 4048
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.96
0.000: (move vehicle0 wp_init_auv0 waypoint12)  [30.885]
30.886: (harvest-energy vehicle0)  [10.000]
40.887: (harvest-energy vehicle0)  [10.000]
50.888: (harvest-energy vehicle0)  [10.000]
60.889: (move vehicle0 waypoint12 waypoint34)  [61.142]
122.032: (harvest-energy vehicle0)  [10.000]
132.033: (harvest-energy vehicle0)  [10.000]
142.034: (harvest-energy vehicle0)  [10.000]
152.035: (harvest-energy vehicle0)  [10.000]
162.036: (move vehicle0 waypoint34 waypoint58)  [124.028]
286.065: (harvest-energy vehicle0)  [10.000]
296.066: (harvest-energy vehicle0)  [10.000]
306.067: (harvest-energy vehicle0)  [10.000]
316.068: (harvest-energy vehicle0)  [10.000]
326.069: (harvest-energy vehicle0)  [10.000]
336.070: (harvest-energy vehicle0)  [10.000]
346.071: (harvest-energy vehicle0)  [10.000]
356.072: (harvest-energy vehicle0)  [10.000]
366.073: (harvest-energy vehicle0)  [10.000]
376.074: (localize-cable vehicle0 waypoint58 turbine14)  [10.000]
386.075: (surface vehicle0)  [40.000]
707.904: (harvest-energy vehicle0)  [10.000]
717.905: (retrieve-data vehicle0 data14 waypoint58 currenttide turbine14)  [55.000]
772.906: (surface vehicle0)  [40.000]
812.907: (harvest-energy vehicle0)  [10.000]
822.908: (harvest-energy vehicle0)  [10.000]
832.909: (harvest-energy vehicle0)  [10.000]
842.910: (harvest-energy vehicle0)  [10.000]
852.911: (harvest-energy vehicle0)  [10.000]
862.912: (harvest-energy vehicle0)  [10.000]
872.913: (upload-data-histograms vehicle0 data14)  [2.000]

 * All goal deadlines now no later than 874.913
b (0.000 | 874.913)(G)(G)(G)