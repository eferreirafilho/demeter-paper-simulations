Number of literals: 14
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
90% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 12.000
b (11.000 | 60.000)b (10.000 | 120.001)b (9.000 | 180.002)b (8.000 | 240.003)b (7.000 | 300.004)b (6.000 | 360.005)b (5.000 | 420.006)b (3.000 | 430.007)b (2.000 | 490.007);;;; Solution Found
; States evaluated: 14
; Cost: 500.007
; Time 0.01
0.000: (move vehicle1 wp9 wp2)  [60.000]
60.001: (move vehicle1 wp2 wp3)  [60.000]
120.002: (move vehicle1 wp3 wp4)  [60.000]
180.003: (move vehicle1 wp4 wp5)  [60.000]
240.004: (move vehicle1 wp5 wp6)  [60.000]
300.005: (move vehicle1 wp6 wp7)  [60.000]
360.006: (move vehicle1 wp7 wp8)  [60.000]
420.007: (get_data vehicle1 data1 wp8)  [10.000]
430.007: (move vehicle1 wp8 wp0)  [60.000]
490.007: (transmit_data vehicle1 data1 wp0)  [10.000]
