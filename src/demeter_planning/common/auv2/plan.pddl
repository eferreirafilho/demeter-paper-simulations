Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 358.650)b (8.000 | 358.650)b (7.000 | 358.650)b (6.000 | 358.650)b (5.000 | 480.536)b (4.000 | 505.538)b (3.000 | 1050.598)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 358.650)b (8.000 | 358.650)b (7.000 | 358.650)b (6.000 | 358.650)b (5.000 | 480.536)b (4.000 | 505.538)b (2.000 | 873.702)b (1.000 | 875.703)(G)
; No metric specified - using makespan

; Plan found with metric 875.703
; States evaluated so far: 4733
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.97
0.000: (move vehicle2 wp_init_auv2 waypoint29)  [19.057]
19.058: (harvest-energy vehicle2)  [10.000]
29.059: (harvest-energy vehicle2)  [10.000]
39.060: (move vehicle2 waypoint29 waypoint24)  [82.171]
121.232: (harvest-energy vehicle2)  [10.000]
131.233: (harvest-energy vehicle2)  [10.000]
141.234: (harvest-energy vehicle2)  [10.000]
151.235: (harvest-energy vehicle2)  [10.000]
161.236: (harvest-energy vehicle2)  [10.000]
171.237: (harvest-energy vehicle2)  [10.000]
181.239: (move vehicle2 waypoint24 waypoint19)  [90.399]
271.639: (harvest-energy vehicle2)  [10.000]
281.640: (harvest-energy vehicle2)  [10.000]
291.641: (harvest-energy vehicle2)  [10.000]
301.642: (harvest-energy vehicle2)  [10.000]
311.643: (harvest-energy vehicle2)  [10.000]
321.644: (harvest-energy vehicle2)  [10.000]
331.645: (move vehicle2 waypoint19 waypoint42)  [88.885]
420.531: (harvest-energy vehicle2)  [10.000]
430.532: (harvest-energy vehicle2)  [10.000]
440.533: (harvest-energy vehicle2)  [10.000]
450.534: (harvest-energy vehicle2)  [10.000]
460.535: (harvest-energy vehicle2)  [10.000]
470.536: (harvest-energy vehicle2)  [10.000]
480.537: (localize-cable vehicle2 waypoint42 turbine8)  [15.000]
708.694: (harvest-energy vehicle2)  [10.000]
718.695: (retrieve-data vehicle2 data8 waypoint42 currenttide turbine8)  [55.000]
773.696: (surface vehicle2)  [40.000]
813.697: (harvest-energy vehicle2)  [10.000]
823.698: (harvest-energy vehicle2)  [10.000]
833.699: (harvest-energy vehicle2)  [10.000]
843.700: (harvest-energy vehicle2)  [10.000]
853.701: (harvest-energy vehicle2)  [10.000]
863.702: (harvest-energy vehicle2)  [10.000]
873.703: (upload-data-histograms vehicle2 data8)  [2.000]

 * All goal deadlines now no later than 875.703
b (0.000 | 875.703)