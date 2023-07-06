Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 44.830)b (6.000 | 234.638)b (5.000 | 388.587)b (4.000 | 413.589)b (3.000 | 1108.665)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 44.830)b (6.000 | 234.638)b (5.000 | 388.587)b (4.000 | 413.589)b (2.000 | 578.598)b (1.000 | 580.599)(G)
; No metric specified - using makespan

; Plan found with metric 580.599
; States evaluated so far: 4598
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.50
0.000: (move vehicle2 wp_init_auv2 waypoint26)  [24.828]
24.829: (harvest-energy vehicle2)  [10.000]
34.830: (harvest-energy vehicle2)  [10.000]
44.831: (move vehicle2 waypoint26 waypoint29)  [109.799]
154.631: (harvest-energy vehicle2)  [10.000]
164.632: (harvest-energy vehicle2)  [10.000]
174.633: (harvest-energy vehicle2)  [10.000]
184.634: (harvest-energy vehicle2)  [10.000]
194.635: (harvest-energy vehicle2)  [10.000]
204.636: (harvest-energy vehicle2)  [10.000]
214.637: (harvest-energy vehicle2)  [10.000]
224.638: (harvest-energy vehicle2)  [10.000]
234.639: (move vehicle2 waypoint29 waypoint62)  [93.942]
328.582: (harvest-energy vehicle2)  [10.000]
338.583: (harvest-energy vehicle2)  [10.000]
348.584: (harvest-energy vehicle2)  [10.000]
358.585: (harvest-energy vehicle2)  [10.000]
368.586: (harvest-energy vehicle2)  [10.000]
378.587: (harvest-energy vehicle2)  [10.000]
388.588: (localize-cable vehicle2 waypoint62 turbine12)  [15.000]
403.589: (harvest-energy vehicle2)  [10.000]
413.590: (retrieve-data vehicle2 data12 waypoint62 currenttide turbine12)  [55.000]
468.591: (surface vehicle2)  [40.000]
508.592: (harvest-energy vehicle2)  [10.000]
518.593: (harvest-energy vehicle2)  [10.000]
528.594: (harvest-energy vehicle2)  [10.000]
538.595: (harvest-energy vehicle2)  [10.000]
548.596: (harvest-energy vehicle2)  [10.000]
558.597: (harvest-energy vehicle2)  [10.000]
568.598: (harvest-energy vehicle2)  [10.000]
578.599: (upload-data-histograms vehicle2 data12)  [2.000]

 * All goal deadlines now no later than 580.599
b (0.000 | 580.599)