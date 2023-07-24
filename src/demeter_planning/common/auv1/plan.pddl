Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 374.635)b (7.000 | 374.635)b (6.000 | 374.635)b (5.000 | 374.635)b (4.000 | 374.635)b (2.000 | 529.642)b (1.000 | 531.643)(G)
; No metric specified - using makespan

; Plan found with metric 531.643
; States evaluated so far: 124
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.17
0.000: (move vehicle1 wp_init_auv1 waypoint9)  [11.769]
11.770: (harvest-energy vehicle1)  [10.000]
21.771: (harvest-energy vehicle1)  [10.000]
31.772: (move vehicle1 waypoint9 waypoint20)  [59.323]
91.096: (harvest-energy vehicle1)  [10.000]
101.097: (harvest-energy vehicle1)  [10.000]
111.098: (harvest-energy vehicle1)  [10.000]
121.099: (harvest-energy vehicle1)  [10.000]
131.100: (harvest-energy vehicle1)  [10.000]
141.101: (harvest-energy vehicle1)  [10.000]
151.102: (harvest-energy vehicle1)  [10.000]
161.103: (harvest-energy vehicle1)  [10.000]
171.104: (move vehicle1 waypoint20 waypoint47)  [23.030]
194.135: (harvest-energy vehicle1)  [10.000]
204.136: (harvest-energy vehicle1)  [10.000]
214.137: (harvest-energy vehicle1)  [10.000]
224.138: (localize-cable vehicle1 waypoint47 turbine9)  [15.000]
364.634: (harvest-energy vehicle1)  [10.000]
374.635: (retrieve-data vehicle1 data9 waypoint47 currenttide currentwaves turbine9)  [55.000]
429.636: (surface vehicle1)  [40.000]
469.637: (harvest-energy vehicle1)  [10.000]
479.638: (harvest-energy vehicle1)  [10.000]
489.639: (harvest-energy vehicle1)  [10.000]
499.640: (harvest-energy vehicle1)  [10.000]
509.641: (harvest-energy vehicle1)  [10.000]
519.642: (harvest-energy vehicle1)  [10.000]
529.643: (upload-data-histograms vehicle1 data9)  [2.000]

 * All goal deadlines now no later than 531.643

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 374.635)b (7.000 | 374.635)b (6.000 | 374.635)b (5.000 | 374.635)b (4.000 | 374.635)b (2.000 | 529.642)b (1.000 | 531.643)