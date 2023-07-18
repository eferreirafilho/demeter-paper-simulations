Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 358.330)b (7.000 | 358.330)b (6.000 | 358.330)b (5.000 | 412.017)b (4.000 | 437.019)b (3.000 | 982.079)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 358.330)b (7.000 | 358.330)b (6.000 | 358.330)b (5.000 | 412.017)b (4.000 | 437.019)b (2.000 | 873.437)b (1.000 | 875.438)(G)
; No metric specified - using makespan

; Plan found with metric 875.438
; States evaluated so far: 3064
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.11
0.000: (move vehicle2 wp_init_auv2 waypoint26)  [24.685]
24.686: (harvest-energy vehicle2)  [10.000]
34.687: (harvest-energy vehicle2)  [10.000]
44.688: (move vehicle2 waypoint26 waypoint6)  [178.828]
223.517: (harvest-energy vehicle2)  [10.000]
233.518: (harvest-energy vehicle2)  [10.000]
243.519: (harvest-energy vehicle2)  [10.000]
253.520: (harvest-energy vehicle2)  [10.000]
263.521: (harvest-energy vehicle2)  [10.000]
273.522: (harvest-energy vehicle2)  [10.000]
283.523: (harvest-energy vehicle2)  [10.000]
293.524: (harvest-energy vehicle2)  [10.000]
303.525: (harvest-energy vehicle2)  [10.000]
313.526: (harvest-energy vehicle2)  [10.000]
323.527: (harvest-energy vehicle2)  [10.000]
333.528: (harvest-energy vehicle2)  [10.000]
343.529: (harvest-energy vehicle2)  [10.000]
353.530: (move vehicle2 waypoint6 waypoint2)  [38.485]
392.016: (harvest-energy vehicle2)  [10.000]
402.017: (harvest-energy vehicle2)  [10.000]
412.018: (localize-cable vehicle2 waypoint2 turbine0)  [15.000]
708.429: (harvest-energy vehicle2)  [10.000]
718.430: (retrieve-data vehicle2 data0 waypoint2 currenttide turbine0)  [55.000]
773.431: (surface vehicle2)  [40.000]
813.432: (harvest-energy vehicle2)  [10.000]
823.433: (harvest-energy vehicle2)  [10.000]
833.434: (harvest-energy vehicle2)  [10.000]
843.435: (harvest-energy vehicle2)  [10.000]
853.436: (harvest-energy vehicle2)  [10.000]
863.437: (harvest-energy vehicle2)  [10.000]
873.438: (upload-data-histograms vehicle2 data0)  [2.000]

 * All goal deadlines now no later than 875.438
b (0.000 | 875.438)