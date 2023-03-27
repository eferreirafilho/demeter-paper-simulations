Number of literals: 41
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 58.000
b (57.000 | 11170.000)b (56.000 | 11170.000)b (55.000 | 36220.001)b (54.000 | 36220.001)b (51.000 | 57020.002)b (50.000 | 57020.002)b (45.000 | 98960.003)b (44.000 | 98960.003)b (42.000 | 112745.005)b (40.000 | 112746.006)b (39.000 | 126526.006)b (38.000 | 126526.006)b (36.000 | 126546.007)b (34.000 | 146351.009)b (32.000 | 146352.010)b (31.000 | 166152.010)b (30.000 | 166152.010)b (28.000 | 166172.011)b (27.000 | 212097.014)b (26.000 | 212097.014)b (23.000 | 258018.016)b (22.000 | 258018.016)b (20.000 | 258038.017)b (19.000 | 349584.021)b (18.000 | 349584.021)b (17.000 | 375364.022)b (16.000 | 375364.022)b (15.000 | 383484.023)b (14.000 | 383484.023)b (13.000 | 391604.024)b (12.000 | 391604.024)b (11.000 | 468124.025)b (10.000 | 468124.025)b (9.000 | 512924.026)b (8.000 | 512924.026)b (7.000 | 512944.028)b (5.000 | 512944.028)b (4.000 | 512944.028)b (2.000 | 512945.029);;;; Solution Found
; States evaluated: 244
; Cost: 0.000
; Time 1.33
0.000: (move vehicle1 wp_init_auv1 waypoint44)  [11170.000]
11170.001: (move vehicle1 waypoint44 waypoint18)  [25050.000]
36220.002: (move vehicle1 waypoint18 waypoint17)  [20800.000]
57020.003: (move vehicle1 waypoint17 waypoint12)  [41940.000]
98960.004: (move vehicle1 waypoint12 waypoint33)  [13780.000]
112740.005: (localize-cable vehicle1 waypoint33 turbine1)  [5.000]
112745.006: (submerge-mission vehicle1 data1 waypoint33 currenttide turbine1)  [1.000]
112746.006: (move vehicle1 waypoint33 waypoint12)  [13780.000]
126526.007: (transmit-data vehicle1 data1 waypoint0)  [20.000]
126546.008: (move vehicle1 waypoint12 waypoint51)  [19800.000]
146346.009: (localize-cable vehicle1 waypoint51 turbine5)  [5.000]
146351.010: (submerge-mission vehicle1 data5 waypoint51 currenttide turbine5)  [1.000]
146352.010: (move vehicle1 waypoint51 waypoint12)  [19800.000]
166152.011: (transmit-data vehicle1 data5 waypoint0)  [20.000]
166172.012: (move vehicle1 waypoint12 waypoint49)  [22960.000]
189132.013: (localize-cable vehicle1 waypoint49 turbine4)  [5.000]
189137.014: (move vehicle1 waypoint49 waypoint12)  [22960.000]
212097.015: (move vehicle1 waypoint12 waypoint49)  [22960.000]
235057.016: (submerge-mission vehicle1 data4 waypoint49 currenttide turbine4)  [1.000]
235058.016: (move vehicle1 waypoint49 waypoint12)  [22960.000]
258018.017: (transmit-data vehicle1 data4 waypoint0)  [20.000]
258038.018: (move vehicle1 waypoint12 waypoint17)  [41940.000]
299978.019: (move vehicle1 waypoint17 waypoint28)  [24800.000]
324778.020: (localize-cable vehicle1 waypoint28 turbine0)  [5.000]
324783.021: (submerge-mission vehicle1 data0 waypoint28 currenttide turbine0)  [1.000]
324784.021: (move vehicle1 waypoint28 waypoint17)  [24800.000]
349584.022: (move vehicle1 waypoint17 waypoint31)  [25780.000]
375364.023: (move vehicle1 waypoint31 waypoint30)  [8120.000]
383484.024: (move vehicle1 waypoint30 waypoint34)  [8120.000]
391604.025: (move vehicle1 waypoint34 waypoint6)  [76520.000]
468124.026: (move vehicle1 waypoint6 waypoint55)  [44800.000]
512924.027: (localize-cable vehicle1 waypoint55 turbine6)  [5.000]
512924.028: (transmit-data vehicle1 data0 waypoint0)  [20.000]
512944.029: (submerge-mission vehicle1 data6 waypoint55 currenttide turbine6)  [1.000]
512945.030: (transmit-data vehicle1 data6 waypoint0)  [20.000]
