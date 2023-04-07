Number of literals: 21
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 28.000
b (27.000 | 168.400)b (26.000 | 168.400)b (24.000 | 173.401)b (22.000 | 380.336)b (20.000 | 405.138)b (18.000 | 762.941)b (16.000 | 968.217)b (15.000 | 1256.418)b (14.000 | 1256.418)b (13.000 | 1321.019)b (12.000 | 1321.019)b (11.000 | 1385.620)b (10.000 | 1385.620)b (9.000 | 1797.221)b (8.000 | 1797.221)b (7.000 | 1817.223)b (5.000 | 1817.223)b (4.000 | 1817.223)b (2.000 | 2023.013)b (1.000 | 2043.014);;;; Solution Found
; States evaluated: 132
; Cost: 0.000
; Time 0.37
0.000: (move vehicle1 wp_init_auv1 waypoint6)  [168.400]
168.401: (localize-cable vehicle1 waypoint6 turbine1)  [5.000]
173.402: (submerge-mission vehicle1 data1 waypoint6 currenttide turbine1)  [200.000]
373.402: (wait-to-recharge vehicle1)  [6.934]
380.337: (transmit-data vehicle1 data1 waypoint0)  [20.000]
400.338: (wait-to-recharge vehicle1)  [4.800]
405.139: (move vehicle1 waypoint6 waypoint7)  [64.600]
469.740: (move vehicle1 waypoint7 waypoint21)  [288.200]
757.941: (localize-cable vehicle1 waypoint21 turbine4)  [5.000]
762.942: (submerge-mission vehicle1 data4 waypoint21 currenttide turbine4)  [200.000]
962.942: (wait-to-recharge vehicle1)  [5.275]
968.218: (move vehicle1 waypoint21 waypoint7)  [288.200]
1256.419: (move vehicle1 waypoint7 waypoint6)  [64.600]
1321.020: (move vehicle1 waypoint6 waypoint10)  [64.600]
1385.621: (move vehicle1 waypoint10 waypoint26)  [411.600]
1797.222: (localize-cable vehicle1 waypoint26 turbine5)  [5.000]
1797.223: (transmit-data vehicle1 data4 waypoint0)  [20.000]
1817.224: (submerge-mission vehicle1 data5 waypoint26 currenttide turbine5)  [200.000]
2017.224: (wait-to-recharge vehicle1)  [5.789]
2023.014: (transmit-data vehicle1 data5 waypoint0)  [20.000]
