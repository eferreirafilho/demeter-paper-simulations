Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 37.773)b (7.000 | 188.179)b (6.000 | 330.357)b (5.000 | 481.164)b (4.000 | 506.166)b (3.000 | 1051.226)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 37.773)b (7.000 | 188.179)b (6.000 | 330.357)b (5.000 | 481.164)b (4.000 | 506.166)b (2.000 | 873.757)b (1.000 | 875.757)(G)
; No metric specified - using makespan

; Plan found with metric 875.758
; States evaluated so far: 5525
; States pruned based on pre-heuristic cost lower bound: 0
; Time 5.61
0.000: (move vehicle2 wp_init_auv2 waypoint17)  [17.771]
17.772: (harvest-energy vehicle2)  [10.000]
27.773: (harvest-energy vehicle2)  [10.000]
37.774: (move vehicle2 waypoint17 waypoint22)  [90.399]
128.174: (harvest-energy vehicle2)  [10.000]
138.175: (harvest-energy vehicle2)  [10.000]
148.176: (harvest-energy vehicle2)  [10.000]
158.177: (harvest-energy vehicle2)  [10.000]
168.178: (harvest-energy vehicle2)  [10.000]
178.179: (harvest-energy vehicle2)  [10.000]
188.180: (move vehicle2 waypoint22 waypoint27)  [82.171]
270.352: (harvest-energy vehicle2)  [10.000]
280.353: (harvest-energy vehicle2)  [10.000]
290.354: (harvest-energy vehicle2)  [10.000]
300.355: (harvest-energy vehicle2)  [10.000]
310.356: (harvest-energy vehicle2)  [10.000]
320.357: (harvest-energy vehicle2)  [10.000]
330.358: (move vehicle2 waypoint27 waypoint32)  [90.800]
421.159: (harvest-energy vehicle2)  [10.000]
431.160: (harvest-energy vehicle2)  [10.000]
441.161: (harvest-energy vehicle2)  [10.000]
451.162: (harvest-energy vehicle2)  [10.000]
461.163: (harvest-energy vehicle2)  [10.000]
471.164: (harvest-energy vehicle2)  [10.000]
481.165: (localize-cable vehicle2 waypoint32 turbine6)  [15.000]
708.749: (harvest-energy vehicle2)  [10.000]
718.750: (retrieve-data vehicle2 data6 waypoint32 currenttide turbine6)  [55.000]
773.751: (surface vehicle2)  [40.000]
813.752: (harvest-energy vehicle2)  [10.000]
823.753: (harvest-energy vehicle2)  [10.000]
833.754: (harvest-energy vehicle2)  [10.000]
843.755: (harvest-energy vehicle2)  [10.000]
853.756: (harvest-energy vehicle2)  [10.000]
863.757: (harvest-energy vehicle2)  [10.000]
873.758: (upload-data-histograms vehicle2 data6)  [2.000]

 * All goal deadlines now no later than 875.758
b (0.000 | 875.758)(G)(G)(G)