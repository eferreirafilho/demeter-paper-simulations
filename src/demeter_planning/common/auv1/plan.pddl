Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 10.115)b (6.000 | 160.522)b (5.000 | 302.986)b (4.000 | 327.988)b (3.000 | 873.048)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 10.115)b (6.000 | 160.522)b (5.000 | 302.986)b (4.000 | 327.988)b (2.000 | 513.702)b (1.000 | 515.703)(G)
; No metric specified - using makespan

; Plan found with metric 515.703
; States evaluated so far: 3886
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.51
0.000: (move vehicle1 wp_init_auv1 waypoint22)  [0.114]
0.115: (harvest-energy vehicle1)  [10.000]
10.116: (move vehicle1 waypoint22 waypoint17)  [90.399]
100.517: (harvest-energy vehicle1)  [10.000]
110.518: (harvest-energy vehicle1)  [10.000]
120.519: (harvest-energy vehicle1)  [10.000]
130.520: (harvest-energy vehicle1)  [10.000]
140.521: (harvest-energy vehicle1)  [10.000]
150.522: (harvest-energy vehicle1)  [10.000]
160.523: (move vehicle1 waypoint17 waypoint12)  [82.457]
242.981: (harvest-energy vehicle1)  [10.000]
252.982: (harvest-energy vehicle1)  [10.000]
262.983: (harvest-energy vehicle1)  [10.000]
272.984: (harvest-energy vehicle1)  [10.000]
282.985: (harvest-energy vehicle1)  [10.000]
292.986: (harvest-energy vehicle1)  [10.000]
302.987: (localize-cable vehicle1 waypoint12 turbine2)  [15.000]
348.694: (harvest-energy vehicle1)  [10.000]
358.695: (retrieve-data vehicle1 data2 waypoint12 currenttide turbine2)  [55.000]
413.696: (surface vehicle1)  [40.000]
453.697: (harvest-energy vehicle1)  [10.000]
463.698: (harvest-energy vehicle1)  [10.000]
473.699: (harvest-energy vehicle1)  [10.000]
483.700: (harvest-energy vehicle1)  [10.000]
493.701: (harvest-energy vehicle1)  [10.000]
503.702: (harvest-energy vehicle1)  [10.000]
513.703: (upload-data-histograms vehicle1 data2)  [2.000]

 * All goal deadlines now no later than 515.703
b (0.000 | 515.703)