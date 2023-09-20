Number of literals: 16
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 17.493)b (8.000 | 82.298)b (7.000 | 243.169)b (6.000 | 490.784)b (5.000 | 618.807)b (4.000 | 643.809)b (3.000 | 1188.870)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 17.493)b (8.000 | 82.298)b (7.000 | 243.169)b (6.000 | 490.784)b (5.000 | 618.807)b (4.000 | 643.809)b (2.000 | 1518.297)b (1.000 | 1520.297)(G)
; No metric specified - using makespan

; Plan found with metric 1520.298
; States evaluated so far: 8985
; States pruned based on pre-heuristic cost lower bound: 0
; Time 10.08
0.000: (move vehicle0 wp_init_auv0 waypoint15)  [7.492]
7.493: (harvest-energy vehicle0)  [10.000]
17.494: (move vehicle0 waypoint15 waypoint19)  [24.800]
42.295: (harvest-energy vehicle0)  [10.000]
52.296: (harvest-energy vehicle0)  [10.000]
62.297: (harvest-energy vehicle0)  [10.000]
72.298: (harvest-energy vehicle0)  [10.000]
82.299: (move vehicle0 waypoint19 waypoint22)  [70.861]
153.161: (harvest-energy vehicle0)  [10.000]
163.162: (harvest-energy vehicle0)  [10.000]
173.163: (harvest-energy vehicle0)  [10.000]
183.164: (harvest-energy vehicle0)  [10.000]
193.165: (harvest-energy vehicle0)  [10.000]
203.166: (harvest-energy vehicle0)  [10.000]
213.167: (harvest-energy vehicle0)  [10.000]
223.168: (harvest-energy vehicle0)  [10.000]
233.169: (harvest-energy vehicle0)  [10.000]
243.170: (move vehicle0 waypoint22 waypoint57)  [107.600]
350.771: (harvest-energy vehicle0)  [10.000]
360.772: (harvest-energy vehicle0)  [10.000]
370.773: (harvest-energy vehicle0)  [10.000]
380.774: (harvest-energy vehicle0)  [10.000]
390.775: (harvest-energy vehicle0)  [10.000]
400.776: (harvest-energy vehicle0)  [10.000]
410.777: (harvest-energy vehicle0)  [10.000]
420.778: (harvest-energy vehicle0)  [10.000]
430.779: (harvest-energy vehicle0)  [10.000]
440.780: (harvest-energy vehicle0)  [10.000]
450.781: (harvest-energy vehicle0)  [10.000]
460.782: (harvest-energy vehicle0)  [10.000]
470.783: (harvest-energy vehicle0)  [10.000]
480.784: (harvest-energy vehicle0)  [10.000]
490.785: (move vehicle0 waypoint57 waypoint95)  [58.015]
548.801: (harvest-energy vehicle0)  [10.000]
558.802: (harvest-energy vehicle0)  [10.000]
568.803: (harvest-energy vehicle0)  [10.000]
578.804: (harvest-energy vehicle0)  [10.000]
588.805: (harvest-energy vehicle0)  [10.000]
598.806: (harvest-energy vehicle0)  [10.000]
608.807: (harvest-energy vehicle0)  [10.000]
618.808: (localize-cable vehicle0 waypoint95 turbine18)  [15.000]
1353.289: (harvest-energy vehicle0)  [10.000]
1363.290: (retrieve-data vehicle0 data18 waypoint95 currenttide currentwaves turbine18)  [55.000]
1418.291: (surface vehicle0)  [40.000]
1458.292: (harvest-energy vehicle0)  [10.000]
1468.293: (harvest-energy vehicle0)  [10.000]
1478.294: (harvest-energy vehicle0)  [10.000]
1488.295: (harvest-energy vehicle0)  [10.000]
1498.296: (harvest-energy vehicle0)  [10.000]
1508.297: (harvest-energy vehicle0)  [10.000]
1518.298: (upload-data-histograms vehicle0 data18)  [2.000]

 * All goal deadlines now no later than 1520.298
b (0.000 | 1520.298)