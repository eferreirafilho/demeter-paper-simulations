Number of literals: 14
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
90% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000
b (9.000 | 60.000)b (8.000 | 120.001)b (7.000 | 180.002)b (6.000 | 240.003)b (5.000 | 300.004)b (3.000 | 310.005)b (2.000 | 370.005);;;; Solution Found
; States evaluated: 12
; Cost: 380.005
; Time 0.00
0.000: (move vehicle1 wp9 wp2)  [60.000]
60.001: (move vehicle1 wp2 wp3)  [60.000]
120.002: (move vehicle1 wp3 wp4)  [60.000]
180.003: (move vehicle1 wp4 wp5)  [60.000]
240.004: (move vehicle1 wp5 wp6)  [60.000]
300.005: (get_data vehicle1 data1 wp6)  [10.000]
310.005: (move vehicle1 wp6 wp0)  [60.000]
370.005: (transmit_data vehicle1 data1 wp0)  [10.000]
