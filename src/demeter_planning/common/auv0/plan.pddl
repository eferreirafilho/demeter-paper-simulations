Number of literals: 15
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 39.516)b (8.000 | 208.781)b (7.000 | 277.270)b (6.000 | 457.077)b (5.000 | 621.027)b (4.000 | 646.029)b (3.000 | 1191.089)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 39.516)b (8.000 | 208.781)b (7.000 | 277.270)b (6.000 | 457.077)b (5.000 | 621.027)b (4.000 | 646.029)b (2.000 | 873.782)b (1.000 | 875.782)(G)
; No metric specified - using makespan

; Plan found with metric 875.783
; States evaluated so far: 7198
; States pruned based on pre-heuristic cost lower bound: 0
; Time 8.44
0.000: (move vehicle0 wp_init_auv0 waypoint4)  [19.514]
19.515: (harvest-energy vehicle0)  [10.000]
29.516: (harvest-energy vehicle0)  [10.000]
39.517: (move vehicle0 waypoint4 waypoint22)  [99.257]
138.775: (harvest-energy vehicle0)  [10.000]
148.776: (harvest-energy vehicle0)  [10.000]
158.777: (harvest-energy vehicle0)  [10.000]
168.778: (harvest-energy vehicle0)  [10.000]
178.779: (harvest-energy vehicle0)  [10.000]
188.780: (harvest-energy vehicle0)  [10.000]
198.781: (harvest-energy vehicle0)  [10.000]
208.782: (move vehicle0 waypoint22 waypoint26)  [38.485]
247.268: (harvest-energy vehicle0)  [10.000]
257.269: (harvest-energy vehicle0)  [10.000]
267.270: (harvest-energy vehicle0)  [10.000]
277.271: (move vehicle0 waypoint26 waypoint29)  [109.799]
387.071: (harvest-energy vehicle0)  [10.000]
397.072: (harvest-energy vehicle0)  [10.000]
407.073: (harvest-energy vehicle0)  [10.000]
417.074: (harvest-energy vehicle0)  [10.000]
427.075: (harvest-energy vehicle0)  [10.000]
437.076: (harvest-energy vehicle0)  [10.000]
447.077: (harvest-energy vehicle0)  [10.000]
457.078: (move vehicle0 waypoint29 waypoint62)  [93.942]
551.021: (harvest-energy vehicle0)  [10.000]
561.022: (harvest-energy vehicle0)  [10.000]
571.023: (harvest-energy vehicle0)  [10.000]
581.024: (harvest-energy vehicle0)  [10.000]
591.025: (harvest-energy vehicle0)  [10.000]
601.026: (harvest-energy vehicle0)  [10.000]
611.027: (harvest-energy vehicle0)  [10.000]
621.028: (localize-cable vehicle0 waypoint62 turbine12)  [15.000]
708.774: (harvest-energy vehicle0)  [10.000]
718.775: (retrieve-data vehicle0 data12 waypoint62 currenttide turbine12)  [55.000]
773.776: (surface vehicle0)  [40.000]
813.777: (harvest-energy vehicle0)  [10.000]
823.778: (harvest-energy vehicle0)  [10.000]
833.779: (harvest-energy vehicle0)  [10.000]
843.780: (harvest-energy vehicle0)  [10.000]
853.781: (harvest-energy vehicle0)  [10.000]
863.782: (harvest-energy vehicle0)  [10.000]
873.783: (upload-data-histograms vehicle0 data12)  [2.000]

 * All goal deadlines now no later than 875.783
b (0.000 | 875.783)(G)(G)