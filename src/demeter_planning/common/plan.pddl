Number of literals: 12
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%] [130%] [140%] [150%] [160%] [170%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%] [130%] [140%] [150%] [160%] [170%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
82% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000
b (6.000 | 12.001)b (5.000 | 18.002)b (3.000 | 28.003)b (2.000 | 34.003);;;; Solution Found
; States evaluated: 9
; Cost: 44.003
; Time 0.00
0.000: (move vehicle1 wp0 wp1)  [6.000]
6.001: (move vehicle1 wp1 wp2)  [6.000]
12.002: (move vehicle1 wp2 wp3)  [6.000]
18.003: (get_data vehicle1 data1 wp3)  [10.000]
28.003: (move vehicle1 wp3 wp0)  [6.000]
34.003: (transmit_data vehicle1 data1 wp0)  [10.000]
