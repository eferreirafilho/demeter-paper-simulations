Number of literals: 21
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%] [130%] [140%] [150%] [160%] [170%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%] [130%] [140%] [150%] [160%] [170%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
82% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 11.000
b (10.000 | 55.000)b (9.000 | 110.001)b (8.000 | 165.002)b (7.000 | 220.003)b (6.000 | 275.004)b (5.000 | 330.005)b (3.000 | 335.006)b (2.000 | 390.006);;;; Solution Found
; States evaluated: 13
; Cost: 395.006
; Time 0.00
0.000: (move vehicle1 wp7 wp1)  [55.000]
55.001: (move vehicle1 wp1 wp2)  [55.000]
110.002: (move vehicle1 wp2 wp3)  [55.000]
165.003: (move vehicle1 wp3 wp4)  [55.000]
220.004: (move vehicle1 wp4 wp5)  [55.000]
275.005: (move vehicle1 wp5 wp6)  [55.000]
330.006: (get_data vehicle1 data1 wp6)  [5.000]
335.006: (move vehicle1 wp6 wp0)  [55.000]
390.006: (transmit_data vehicle1 data1 wp0)  [5.000]
