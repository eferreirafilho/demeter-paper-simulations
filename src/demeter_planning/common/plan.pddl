Number of literals: 35
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
75% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000
b (9.000 | 4.001)b (8.000 | 6.002)b (7.000 | 8.003)b (6.000 | 10.004)b (5.000 | 12.005)b (3.000 | 17.006)b (2.000 | 19.006);;;; Solution Found
; States evaluated: 12
; Cost: 29.006
; Time 0.00
0.000: (move vehicle1 wp0 wp1)  [2.000]
2.001: (move vehicle1 wp1 wp2)  [2.000]
4.002: (move vehicle1 wp2 wp3)  [2.000]
6.003: (move vehicle1 wp3 wp4)  [2.000]
8.004: (move vehicle1 wp4 wp5)  [2.000]
10.005: (move vehicle1 wp5 wp6)  [2.000]
12.006: (get_data vehicle1 data1 wp6)  [5.000]
17.006: (move vehicle1 wp6 wp0)  [2.000]
19.006: (transmit_data vehicle1 data1 wp0)  [10.000]
