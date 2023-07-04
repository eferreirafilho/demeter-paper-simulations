Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
37% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 58.305)b (8.000 | 58.305)b (7.000 | 79.125)b (6.000 | 150.070)b (5.000 | 175.072)b (4.000 | 175.072)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 58.305)b (8.000 | 58.305)b (7.000 | 79.125)b (6.000 | 150.070)b (5.000 | 175.072)b (4.000 | 175.072)b (2.000 | 206.489)b (1.000 | 208.490)(G)
; No metric specified - using makespan

; Plan found with metric 208.490
; States evaluated so far: 3058
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.25
0.000: (move vehicle1 wp_init_auv1 waypoint19)  [26.640]
26.641: (harvest-energy vehicle1)  [1.000]
27.642: (harvest-energy vehicle1)  [1.000]
28.643: (move vehicle1 waypoint19 waypoint16)  [48.480]
77.124: (harvest-energy vehicle1)  [1.000]
78.125: (harvest-energy vehicle1)  [1.000]
79.126: (move vehicle1 waypoint16 waypoint34)  [66.940]
146.067: (harvest-energy vehicle1)  [1.000]
147.068: (harvest-energy vehicle1)  [1.000]
148.069: (harvest-energy vehicle1)  [1.000]
149.070: (harvest-energy vehicle1)  [1.000]
150.071: (localize-cable vehicle1 waypoint34 turbine8)  [10.000]
163.484: (surface vehicle1)  [15.000]
178.485: (retrieve-data vehicle1 data8 waypoint34 currenttide turbine8)  [10.000]
188.486: (surface vehicle1)  [15.000]
203.487: (harvest-energy vehicle1)  [1.000]
204.488: (harvest-energy vehicle1)  [1.000]
205.489: (harvest-energy vehicle1)  [1.000]
206.490: (upload-data-histograms vehicle1 data8)  [2.000]

 * All goal deadlines now no later than 208.490
b (0.000 | 208.490)