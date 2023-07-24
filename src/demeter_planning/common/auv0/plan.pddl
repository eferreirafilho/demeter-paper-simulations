Number of literals: 15
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 313.065)b (8.000 | 313.065)b (7.000 | 313.065)b (6.000 | 313.065)b (5.000 | 317.620)b (4.000 | 342.622)b (2.000 | 497.630)b (1.000 | 499.631)(G)
; No metric specified - using makespan

; Plan found with metric 499.631
; States evaluated so far: 151
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.22
0.000: (move vehicle0 wp_init_auv0 waypoint24)  [8.892]
8.893: (harvest-energy vehicle0)  [10.000]
18.894: (harvest-energy vehicle0)  [10.000]
28.895: (move vehicle0 waypoint24 waypoint21)  [63.584]
92.480: (harvest-energy vehicle0)  [10.000]
102.481: (harvest-energy vehicle0)  [10.000]
112.482: (harvest-energy vehicle0)  [10.000]
122.483: (harvest-energy vehicle0)  [10.000]
132.484: (harvest-energy vehicle0)  [10.000]
142.485: (harvest-energy vehicle0)  [10.000]
152.486: (harvest-energy vehicle0)  [10.000]
162.487: (harvest-energy vehicle0)  [10.000]
172.488: (move vehicle0 waypoint21 waypoint17)  [20.723]
193.212: (harvest-energy vehicle0)  [10.000]
203.213: (harvest-energy vehicle0)  [10.000]
213.214: (harvest-energy vehicle0)  [10.000]
223.215: (move vehicle0 waypoint17 waypoint12)  [44.400]
267.616: (harvest-energy vehicle0)  [10.000]
277.617: (harvest-energy vehicle0)  [10.000]
287.618: (harvest-energy vehicle0)  [10.000]
297.619: (harvest-energy vehicle0)  [10.000]
307.620: (harvest-energy vehicle0)  [10.000]
317.621: (localize-cable vehicle0 waypoint12 turbine2)  [15.000]
332.622: (harvest-energy vehicle0)  [10.000]
342.623: (retrieve-data vehicle0 data2 waypoint12 currenttide currentwaves turbine2)  [55.000]
397.624: (surface vehicle0)  [40.000]
437.625: (harvest-energy vehicle0)  [10.000]
447.626: (harvest-energy vehicle0)  [10.000]
457.627: (harvest-energy vehicle0)  [10.000]
467.628: (harvest-energy vehicle0)  [10.000]
477.629: (harvest-energy vehicle0)  [10.000]
487.630: (harvest-energy vehicle0)  [10.000]
497.631: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 499.631

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 313.065)b (8.000 | 313.065)b (7.000 | 313.065)b (6.000 | 313.065)b (5.000 | 317.620)b (4.000 | 342.622)b (2.000 | 497.630)b (1.000 | 499.631)