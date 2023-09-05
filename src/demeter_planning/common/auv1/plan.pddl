Number of literals: 16
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 28.940)b (8.000 | 136.808)b (7.000 | 227.306)b (6.000 | 258.355)b (5.000 | 370.208)b (4.000 | 395.210)b (3.000 | 940.269)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 28.940)b (8.000 | 136.808)b (7.000 | 227.306)b (6.000 | 258.355)b (5.000 | 370.208)b (4.000 | 395.210)b (2.000 | 1188.697)b (1.000 | 1190.697)(G)
; No metric specified - using makespan

; Plan found with metric 1190.698
; States evaluated so far: 8615
; States pruned based on pre-heuristic cost lower bound: 0
; Time 8.85
0.000: (move vehicle1 wp_init_auv1 waypoint19)  [8.938]
8.939: (harvest-energy vehicle1)  [10.000]
18.940: (harvest-energy vehicle1)  [10.000]
28.941: (move vehicle1 waypoint19 waypoint42)  [47.861]
76.803: (harvest-energy vehicle1)  [10.000]
86.804: (harvest-energy vehicle1)  [10.000]
96.805: (harvest-energy vehicle1)  [10.000]
106.806: (harvest-energy vehicle1)  [10.000]
116.807: (harvest-energy vehicle1)  [10.000]
126.808: (harvest-energy vehicle1)  [10.000]
136.809: (move vehicle1 waypoint42 waypoint40)  [40.492]
177.302: (harvest-energy vehicle1)  [10.000]
187.303: (harvest-energy vehicle1)  [10.000]
197.304: (harvest-energy vehicle1)  [10.000]
207.305: (harvest-energy vehicle1)  [10.000]
217.306: (harvest-energy vehicle1)  [10.000]
227.307: (move vehicle1 waypoint40 waypoint39)  [11.046]
238.354: (harvest-energy vehicle1)  [10.000]
248.355: (harvest-energy vehicle1)  [10.000]
258.356: (move vehicle1 waypoint39 waypoint67)  [51.846]
310.203: (harvest-energy vehicle1)  [10.000]
320.204: (harvest-energy vehicle1)  [10.000]
330.205: (harvest-energy vehicle1)  [10.000]
340.206: (harvest-energy vehicle1)  [10.000]
350.207: (harvest-energy vehicle1)  [10.000]
360.208: (harvest-energy vehicle1)  [10.000]
370.209: (localize-cable vehicle1 waypoint67 turbine13)  [15.000]
1023.689: (harvest-energy vehicle1)  [10.000]
1033.690: (retrieve-data vehicle1 data13 waypoint67 currenttide currentwaves turbine13)  [55.000]
1088.691: (surface vehicle1)  [40.000]
1128.692: (harvest-energy vehicle1)  [10.000]
1138.693: (harvest-energy vehicle1)  [10.000]
1148.694: (harvest-energy vehicle1)  [10.000]
1158.695: (harvest-energy vehicle1)  [10.000]
1168.696: (harvest-energy vehicle1)  [10.000]
1178.697: (harvest-energy vehicle1)  [10.000]
1188.698: (upload-data-histograms vehicle1 data13)  [2.000]

 * All goal deadlines now no later than 1190.698
b (0.000 | 1190.698)