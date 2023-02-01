Number of literals: 120
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
95% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 26.000
b (25.000 | 60.000)b (24.000 | 240.003)b (23.000 | 300.004)b (22.000 | 360.005)b (21.000 | 420.006)b (20.000 | 480.007)b (19.000 | 480.007)b (18.000 | 540.008)b (17.000 | 540.008)b (16.000 | 540.008)b (15.000 | 540.008)b (14.000 | 540.008)b (13.000 | 540.008)b (11.000 | 540.008)b (10.000 | 600.009)b (8.000 | 600.009)b (7.000 | 610.009)b (5.000 | 610.010)b (4.000 | 670.010)b (2.000 | 670.010);;;; Solution Found
; States evaluated: 72
; Cost: 680.010
; Time 0.04
0.000: (move auv0 wp_init_auv0 wp_turbine0_point0)  [60.000]
0.000: (move auv1 wp_init_auv1 wp_turbine0_point0)  [60.000]
60.001: (move auv0 wp_turbine0_point0 wp_turbine0_point1)  [60.000]
60.001: (move auv1 wp_turbine0_point0 wp_turbine1_point0)  [60.000]
120.002: (move auv0 wp_turbine0_point1 wp_turbine0_point2)  [60.000]
120.002: (move auv1 wp_turbine1_point0 wp_turbine1_point1)  [60.000]
180.003: (move auv0 wp_turbine0_point2 wp_turbine0_point3)  [60.000]
180.003: (move auv1 wp_turbine1_point1 wp_turbine1_point2)  [60.000]
240.004: (move auv0 wp_turbine0_point3 wp_turbine0_point4)  [60.000]
240.004: (move auv1 wp_turbine1_point2 wp_turbine1_point3)  [60.000]
300.005: (move auv0 wp_turbine0_point4 wp_turbine0_point5)  [60.000]
300.005: (move auv1 wp_turbine1_point3 wp_turbine1_point4)  [60.000]
360.006: (move auv0 wp_turbine0_point5 wp_turbine0_point6)  [60.000]
360.006: (move auv1 wp_turbine1_point4 wp_turbine1_point5)  [60.000]
420.007: (move auv0 wp_turbine0_point6 wp_turbine0_point7)  [60.000]
420.007: (move auv1 wp_turbine1_point5 wp_turbine1_point6)  [60.000]
480.008: (move auv0 wp_turbine0_point7 wp_turbine0_point8)  [60.000]
480.008: (move auv1 wp_turbine1_point6 wp_turbine1_point7)  [60.000]
540.009: (move auv1 wp_turbine1_point7 wp_turbine1_point8)  [60.000]
540.009: (get_data auv0 data0 wp_turbine0_point8)  [10.000]
550.009: (move auv0 wp_turbine0_point8 wp_turbine0_point0)  [60.000]
600.010: (get_data auv1 data1 wp_turbine1_point8)  [10.000]
610.009: (transmit_data auv0 data0 wp_turbine0_point0)  [10.000]
610.010: (move auv1 wp_turbine1_point8 wp_turbine1_point0)  [60.000]
670.010: (transmit_data auv1 data1 wp_turbine1_point0)  [10.000]
