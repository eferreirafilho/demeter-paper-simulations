Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 37.659)b (6.000 | 134.206)b (5.000 | 192.694)b (4.000 | 217.696)b (3.000 | 762.758)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 37.659)b (6.000 | 134.206)b (5.000 | 192.694)b (4.000 | 217.696)b (2.000 | 513.107)b (1.000 | 515.108)(G)
; No metric specified - using makespan

; Plan found with metric 515.108
; States evaluated so far: 3897
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.96
0.000: (move vehicle1 wp_init_auv1 waypoint14)  [17.657]
17.658: (harvest-energy vehicle1)  [10.000]
27.659: (harvest-energy vehicle1)  [10.000]
37.660: (move vehicle1 waypoint14 waypoint13)  [56.542]
94.203: (harvest-energy vehicle1)  [10.000]
104.204: (harvest-energy vehicle1)  [10.000]
114.205: (harvest-energy vehicle1)  [10.000]
124.206: (harvest-energy vehicle1)  [10.000]
134.207: (move vehicle1 waypoint13 waypoint12)  [38.485]
172.693: (harvest-energy vehicle1)  [10.000]
182.694: (harvest-energy vehicle1)  [10.000]
192.695: (localize-cable vehicle1 waypoint12 turbine2)  [15.000]
348.099: (harvest-energy vehicle1)  [10.000]
358.100: (retrieve-data vehicle1 data2 waypoint12 currenttide turbine2)  [55.000]
413.101: (surface vehicle1)  [40.000]
453.102: (harvest-energy vehicle1)  [10.000]
463.103: (harvest-energy vehicle1)  [10.000]
473.104: (harvest-energy vehicle1)  [10.000]
483.105: (harvest-energy vehicle1)  [10.000]
493.106: (harvest-energy vehicle1)  [10.000]
503.107: (harvest-energy vehicle1)  [10.000]
513.108: (upload-data-histograms vehicle1 data2)  [2.000]

 * All goal deadlines now no later than 515.108
b (0.000 | 515.108)