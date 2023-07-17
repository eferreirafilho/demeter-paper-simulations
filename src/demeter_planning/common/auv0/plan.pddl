Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 38.316)b (6.000 | 230.353)b (5.000 | 288.841)b (4.000 | 313.843)b (3.000 | 858.903)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 38.316)b (6.000 | 230.353)b (5.000 | 288.841)b (4.000 | 313.843)b (2.000 | 513.702)b (1.000 | 515.703)(G)
; No metric specified - using makespan

; Plan found with metric 515.703
; States evaluated so far: 4079
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.78
0.000: (move vehicle0 wp_init_auv0 waypoint19)  [18.314]
18.315: (harvest-energy vehicle0)  [10.000]
28.316: (harvest-energy vehicle0)  [10.000]
38.317: (move vehicle0 waypoint19 waypoint16)  [112.028]
150.346: (harvest-energy vehicle0)  [10.000]
160.347: (harvest-energy vehicle0)  [10.000]
170.348: (harvest-energy vehicle0)  [10.000]
180.349: (harvest-energy vehicle0)  [10.000]
190.350: (harvest-energy vehicle0)  [10.000]
200.351: (harvest-energy vehicle0)  [10.000]
210.352: (harvest-energy vehicle0)  [10.000]
220.353: (harvest-energy vehicle0)  [10.000]
230.354: (move vehicle0 waypoint16 waypoint12)  [38.485]
268.840: (harvest-energy vehicle0)  [10.000]
278.841: (harvest-energy vehicle0)  [10.000]
288.842: (localize-cable vehicle0 waypoint12 turbine2)  [15.000]
348.694: (harvest-energy vehicle0)  [10.000]
358.695: (retrieve-data vehicle0 data2 waypoint12 currenttide turbine2)  [55.000]
413.696: (surface vehicle0)  [40.000]
453.697: (harvest-energy vehicle0)  [10.000]
463.698: (harvest-energy vehicle0)  [10.000]
473.699: (harvest-energy vehicle0)  [10.000]
483.700: (harvest-energy vehicle0)  [10.000]
493.701: (harvest-energy vehicle0)  [10.000]
503.702: (harvest-energy vehicle0)  [10.000]
513.703: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 515.703
b (0.000 | 515.703)