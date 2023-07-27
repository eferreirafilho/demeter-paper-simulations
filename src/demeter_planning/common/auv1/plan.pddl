Number of literals: 15
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 30.878)b (7.000 | 101.329)b (6.000 | 312.526)b (5.000 | 353.252)b (4.000 | 378.254)b (3.000 | 923.313)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 30.878)b (7.000 | 101.329)b (6.000 | 312.526)b (5.000 | 353.252)b (4.000 | 378.254)b (2.000 | 687.562)b (1.000 | 689.563)(G)
; No metric specified - using makespan

; Plan found with metric 689.563
; States evaluated so far: 4487
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.68
0.000: (move vehicle1 wp_init_auv1 waypoint29)  [10.876]
10.877: (harvest-energy vehicle1)  [10.000]
20.878: (harvest-energy vehicle1)  [10.000]
30.879: (move vehicle1 waypoint29 waypoint28)  [30.446]
61.326: (harvest-energy vehicle1)  [10.000]
71.327: (harvest-energy vehicle1)  [10.000]
81.328: (harvest-energy vehicle1)  [10.000]
91.329: (harvest-energy vehicle1)  [10.000]
101.330: (move vehicle1 waypoint28 waypoint11)  [91.184]
192.515: (harvest-energy vehicle1)  [10.000]
202.516: (harvest-energy vehicle1)  [10.000]
212.517: (harvest-energy vehicle1)  [10.000]
222.518: (harvest-energy vehicle1)  [10.000]
232.519: (harvest-energy vehicle1)  [10.000]
242.520: (harvest-energy vehicle1)  [10.000]
252.521: (harvest-energy vehicle1)  [10.000]
262.522: (harvest-energy vehicle1)  [10.000]
272.523: (harvest-energy vehicle1)  [10.000]
282.524: (harvest-energy vehicle1)  [10.000]
292.525: (harvest-energy vehicle1)  [10.000]
302.526: (harvest-energy vehicle1)  [10.000]
312.527: (move vehicle1 waypoint11 waypoint7)  [20.723]
333.251: (harvest-energy vehicle1)  [10.000]
343.252: (harvest-energy vehicle1)  [10.000]
353.253: (localize-cable vehicle1 waypoint7 turbine1)  [15.000]
522.554: (harvest-energy vehicle1)  [10.000]
532.555: (retrieve-data vehicle1 data1 waypoint7 currenttide currentwaves turbine1)  [55.000]
587.556: (surface vehicle1)  [40.000]
627.557: (harvest-energy vehicle1)  [10.000]
637.558: (harvest-energy vehicle1)  [10.000]
647.559: (harvest-energy vehicle1)  [10.000]
657.560: (harvest-energy vehicle1)  [10.000]
667.561: (harvest-energy vehicle1)  [10.000]
677.562: (harvest-energy vehicle1)  [10.000]
687.563: (upload-data-histograms vehicle1 data1)  [2.000]

 * All goal deadlines now no later than 689.563
b (0.000 | 689.563)