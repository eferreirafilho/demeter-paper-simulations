Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
37% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 58.700)b (8.000 | 58.700)b (7.000 | 64.378)b (6.000 | 144.482)b (4.000 | 170.485)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 58.700)b (8.000 | 58.700)b (7.000 | 64.378)b (6.000 | 144.482)b (4.000 | 170.485)b (2.000 | 206.769)b (1.000 | 208.770)(G)
; No metric specified - using makespan

; Plan found with metric 208.770
; States evaluated so far: 3464
; States pruned based on pre-heuristic cost lower bound: 0
; Time 2.94
0.000: (move vehicle2 wp_init_auv2 waypoint18)  [35.574]
35.575: (harvest-energy vehicle2)  [1.000]
36.576: (harvest-energy vehicle2)  [1.000]
37.577: (move vehicle2 waypoint18 waypoint19)  [25.800]
63.378: (harvest-energy vehicle2)  [1.000]
64.379: (move vehicle2 waypoint19 waypoint42)  [77.100]
141.480: (harvest-energy vehicle2)  [1.000]
142.481: (harvest-energy vehicle2)  [1.000]
143.482: (harvest-energy vehicle2)  [1.000]
144.483: (localize-cable vehicle2 waypoint42 turbine10)  [10.000]
154.484: (surface vehicle2)  [15.000]
177.764: (harvest-energy vehicle2)  [1.000]
178.765: (retrieve-data vehicle2 data10 waypoint42 currenttide turbine10)  [10.000]
188.766: (surface vehicle2)  [15.000]
203.767: (harvest-energy vehicle2)  [1.000]
204.768: (harvest-energy vehicle2)  [1.000]
205.769: (harvest-energy vehicle2)  [1.000]
206.770: (upload-data-histograms vehicle2 data10)  [2.000]

 * All goal deadlines now no later than 208.770
b (0.000 | 208.770)