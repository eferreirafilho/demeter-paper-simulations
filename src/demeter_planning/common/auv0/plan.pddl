Number of literals: 17
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
72% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000, admissible cost estimate 0.000
b (10.000 | 31.602)b (9.000 | 153.456)b (8.000 | 174.504)b (7.000 | 265.002)b (6.000 | 317.944)b (5.000 | 405.950)b (4.000 | 430.952)b (3.000 | 976.013)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (10.000 | 31.602)b (9.000 | 153.456)b (8.000 | 174.504)b (7.000 | 265.002)b (6.000 | 317.944)b (5.000 | 405.950)b (4.000 | 430.952)b (2.000 | 827.912)b (1.000 | 829.912)(G)
; No metric specified - using makespan

; Plan found with metric 829.913
; States evaluated so far: 10420
; States pruned based on pre-heuristic cost lower bound: 0
; Time 9.98
0.000: (move vehicle0 wp_init_auv0 waypoint67)  [11.600]
11.601: (harvest-energy vehicle0)  [10.000]
21.602: (harvest-energy vehicle0)  [10.000]
31.603: (move vehicle0 waypoint67 waypoint39)  [51.846]
83.450: (harvest-energy vehicle0)  [10.000]
93.451: (harvest-energy vehicle0)  [10.000]
103.452: (harvest-energy vehicle0)  [10.000]
113.453: (harvest-energy vehicle0)  [10.000]
123.454: (harvest-energy vehicle0)  [10.000]
133.455: (harvest-energy vehicle0)  [10.000]
143.456: (harvest-energy vehicle0)  [10.000]
153.457: (move vehicle0 waypoint39 waypoint40)  [11.046]
164.504: (harvest-energy vehicle0)  [10.000]
174.505: (move vehicle0 waypoint40 waypoint42)  [40.492]
214.998: (harvest-energy vehicle0)  [10.000]
224.999: (harvest-energy vehicle0)  [10.000]
235.000: (harvest-energy vehicle0)  [10.000]
245.001: (harvest-energy vehicle0)  [10.000]
255.002: (harvest-energy vehicle0)  [10.000]
265.003: (move vehicle0 waypoint42 waypoint15)  [22.938]
287.942: (harvest-energy vehicle0)  [10.000]
297.943: (harvest-energy vehicle0)  [10.000]
307.944: (harvest-energy vehicle0)  [10.000]
317.945: (move vehicle0 waypoint15 waypoint17)  [38.000]
355.946: (harvest-energy vehicle0)  [10.000]
365.947: (harvest-energy vehicle0)  [10.000]
375.948: (harvest-energy vehicle0)  [10.000]
385.949: (harvest-energy vehicle0)  [10.000]
395.950: (harvest-energy vehicle0)  [10.000]
405.951: (localize-cable vehicle0 waypoint17 turbine3)  [15.000]
662.904: (harvest-energy vehicle0)  [10.000]
672.905: (retrieve-data vehicle0 data3 waypoint17 currenttide currentwaves turbine3)  [55.000]
727.906: (surface vehicle0)  [40.000]
767.907: (harvest-energy vehicle0)  [10.000]
777.908: (harvest-energy vehicle0)  [10.000]
787.909: (harvest-energy vehicle0)  [10.000]
797.910: (harvest-energy vehicle0)  [10.000]
807.911: (harvest-energy vehicle0)  [10.000]
817.912: (harvest-energy vehicle0)  [10.000]
827.913: (upload-data-histograms vehicle0 data3)  [2.000]

 * All goal deadlines now no later than 829.913
b (0.000 | 829.913)