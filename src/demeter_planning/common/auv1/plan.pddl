Number of literals: 42
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 36.000
b (34.000 | 37570.000)b (32.000 | 37570.000)b (31.000 | 270690.001)b (30.000 | 270690.001)b (29.000 | 288800.002)b (28.000 | 288800.002)b (27.000 | 347180.003)b (26.000 | 347180.003)b (24.000 | 398355.005)b (22.000 | 398356.006)b (20.000 | 398356.107)b (19.000 | 507906.109)b (18.000 | 507906.109)b (17.000 | 521516.110)b (16.000 | 521516.110)b (14.000 | 521521.111)b (12.000 | 521522.112)b (11.000 | 557282.112)b (10.000 | 557282.112)b (9.000 | 606042.113)b (8.000 | 606042.113)b (7.000 | 606047.115)b (5.000 | 606047.115)b (4.000 | 606047.115)b (2.000 | 606048.116);;;; Solution Found
; States evaluated: 63
; Cost: 0.000
; Time 0.70
0.000: (move vehicle1 wp_init_auv1 waypoint6)  [37570.000]
37570.001: (move vehicle1 waypoint6 waypoint15)  [233120.000]
270690.002: (move vehicle1 waypoint15 waypoint19)  [18110.000]
288800.003: (move vehicle1 waypoint19 waypoint7)  [58380.000]
347180.004: (move vehicle1 waypoint7 waypoint21)  [51170.000]
398350.005: (localize-cable vehicle1 waypoint21 turbine1)  [5.000]
398355.006: (submerge-mission vehicle1 data1 waypoint21 currenttide turbine1)  [1.000]
398356.007: (transmit-data vehicle1 data1 waypoint0 turbine0)  [0.100]
398356.108: (move vehicle1 waypoint21 waypoint7)  [51170.000]
449526.109: (move vehicle1 waypoint7 waypoint19)  [58380.000]
507906.110: (move vehicle1 waypoint19 waypoint18)  [13610.000]
521516.111: (localize-cable vehicle1 waypoint18 turbine0)  [5.000]
521521.112: (submerge-mission vehicle1 data0 waypoint18 currenttide turbine0)  [1.000]
521522.112: (move vehicle1 waypoint18 waypoint11)  [35760.000]
557282.113: (move vehicle1 waypoint11 waypoint36)  [48760.000]
606042.114: (transmit-data vehicle1 data0 waypoint0 turbine0)  [0.100]
606042.115: (localize-cable vehicle1 waypoint36 turbine4)  [5.000]
606047.116: (submerge-mission vehicle1 data4 waypoint36 currenttide turbine4)  [1.000]
606048.117: (transmit-data vehicle1 data4 waypoint0 turbine0)  [0.100]
