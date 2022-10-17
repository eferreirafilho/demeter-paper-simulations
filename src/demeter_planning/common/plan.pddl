Number of literals: 12
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%] [130%] [140%] [150%] [160%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%] [130%] [140%] [150%] [160%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
87% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 6.000
b (5.000 | 120.001)b (3.000 | 130.002)b (2.000 | 190.002);;;; Solution Found
; States evaluated: 8
; Cost: 200.002
; Time 0.00
0.000: (move vehicle1 wp0 wp1)  [60.000]
60.001: (move vehicle1 wp1 wp2)  [60.000]
120.002: (get_data vehicle1 data1 wp2)  [10.000]
130.002: (move vehicle1 wp2 wp0)  [60.000]
190.002: (transmit_data vehicle1 data1 wp0)  [10.000]
