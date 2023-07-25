Number of literals: 15
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 29.094)b (7.000 | 172.687)b (6.000 | 223.414)b (5.000 | 317.820)b (4.000 | 342.822)b (3.000 | 887.882)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 29.094)b (7.000 | 172.687)b (6.000 | 223.414)b (5.000 | 317.820)b (4.000 | 342.822)b (2.000 | 638.067)b (1.000 | 640.068)(G)
; No metric specified - using makespan

; Plan found with metric 640.068
; States evaluated so far: 6875
; States pruned based on pre-heuristic cost lower bound: 0
; Time 7.83
0.000: (move vehicle1 wp_init_auv1 waypoint24)  [9.092]
9.093: (harvest-energy vehicle1)  [10.000]
19.094: (harvest-energy vehicle1)  [10.000]
29.095: (move vehicle1 waypoint24 waypoint21)  [63.584]
92.680: (harvest-energy vehicle1)  [10.000]
102.681: (harvest-energy vehicle1)  [10.000]
112.682: (harvest-energy vehicle1)  [10.000]
122.683: (harvest-energy vehicle1)  [10.000]
132.684: (harvest-energy vehicle1)  [10.000]
142.685: (harvest-energy vehicle1)  [10.000]
152.686: (harvest-energy vehicle1)  [10.000]
162.687: (harvest-energy vehicle1)  [10.000]
172.688: (move vehicle1 waypoint21 waypoint17)  [20.723]
193.412: (harvest-energy vehicle1)  [10.000]
203.413: (harvest-energy vehicle1)  [10.000]
213.414: (harvest-energy vehicle1)  [10.000]
223.415: (move vehicle1 waypoint17 waypoint12)  [44.400]
267.816: (harvest-energy vehicle1)  [10.000]
277.817: (harvest-energy vehicle1)  [10.000]
287.818: (harvest-energy vehicle1)  [10.000]
297.819: (harvest-energy vehicle1)  [10.000]
307.820: (harvest-energy vehicle1)  [10.000]
317.821: (localize-cable vehicle1 waypoint12 turbine2)  [15.000]
473.059: (harvest-energy vehicle1)  [10.000]
483.060: (retrieve-data vehicle1 data2 waypoint12 currenttide currentwaves turbine2)  [55.000]
538.061: (surface vehicle1)  [40.000]
578.062: (harvest-energy vehicle1)  [10.000]
588.063: (harvest-energy vehicle1)  [10.000]
598.064: (harvest-energy vehicle1)  [10.000]
608.065: (harvest-energy vehicle1)  [10.000]
618.066: (harvest-energy vehicle1)  [10.000]
628.067: (harvest-energy vehicle1)  [10.000]
638.068: (upload-data-histograms vehicle1 data2)  [2.000]

 * All goal deadlines now no later than 640.068
b (0.000 | 640.068)