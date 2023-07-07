Number of literals: 12
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 38.059)b (5.000 | 237.268)b (4.000 | 262.270)b (3.000 | 807.329)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 38.059)b (5.000 | 237.268)b (4.000 | 262.270)b (2.000 | 513.702)b (1.000 | 515.703)(G)
; No metric specified - using makespan

; Plan found with metric 515.703
; States evaluated so far: 2861
; States pruned based on pre-heuristic cost lower bound: 0
; Time 2.52
0.000: (move vehicle0 wp_init_auv0 waypoint2)  [18.057]
18.058: (harvest-energy vehicle0)  [10.000]
28.059: (harvest-energy vehicle0)  [10.000]
38.061: (move vehicle0 waypoint2 waypoint12)  [119.199]
157.261: (harvest-energy vehicle0)  [10.000]
167.262: (harvest-energy vehicle0)  [10.000]
177.263: (harvest-energy vehicle0)  [10.000]
187.264: (harvest-energy vehicle0)  [10.000]
197.265: (harvest-energy vehicle0)  [10.000]
207.266: (harvest-energy vehicle0)  [10.000]
217.267: (harvest-energy vehicle0)  [10.000]
227.268: (harvest-energy vehicle0)  [10.000]
237.269: (localize-cable vehicle0 waypoint12 turbine2)  [15.000]
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