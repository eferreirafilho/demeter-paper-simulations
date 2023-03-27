Number of literals: 39
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 52.000
b (51.000 | 11320.000)b (50.000 | 11320.000)b (49.000 | 36740.001)b (48.000 | 36740.001)b (45.000 | 55620.002)b (44.000 | 55620.002)b (42.000 | 74745.004)b (40.000 | 74746.005)b (39.000 | 93866.005)b (38.000 | 93866.005)b (36.000 | 93886.006)b (34.000 | 116051.008)b (32.000 | 116052.009)b (31.000 | 138212.009)b (30.000 | 138212.009)b (28.000 | 138232.010)b (26.000 | 151428.013)b (24.000 | 151448.014)b (22.000 | 194583.017)b (20.000 | 194584.018)b (19.000 | 216834.018)b (18.000 | 216834.018)b (17.000 | 237714.019)b (16.000 | 237714.019)b (15.000 | 246974.020)b (14.000 | 246974.020)b (13.000 | 252794.021)b (12.000 | 252794.021)b (11.000 | 290224.022)b (10.000 | 290224.022)b (9.000 | 323344.023)b (8.000 | 323344.023)b (7.000 | 323364.025)b (5.000 | 323364.025)b (4.000 | 323364.025)b (2.000 | 323365.026);;;; Solution Found
; States evaluated: 203
; Cost: 0.000
; Time 1.17
0.000: (move vehicle0 wp_init_auv0 waypoint21)  [11320.000]
11320.001: (move vehicle0 waypoint21 waypoint20)  [25420.000]
36740.002: (move vehicle0 waypoint20 waypoint19)  [18880.000]
55620.003: (move vehicle0 waypoint19 waypoint71)  [19120.000]
74740.004: (localize-cable vehicle0 waypoint71 turbine9)  [5.000]
74745.005: (submerge-mission vehicle0 data9 waypoint71 currenttide turbine9)  [1.000]
74746.005: (move vehicle0 waypoint71 waypoint19)  [19120.000]
93866.006: (transmit-data vehicle0 data9 waypoint0)  [20.000]
93886.007: (move vehicle0 waypoint19 waypoint69)  [22160.000]
116046.008: (localize-cable vehicle0 waypoint69 turbine8)  [5.000]
116051.009: (submerge-mission vehicle0 data8 waypoint69 currenttide turbine8)  [1.000]
116052.009: (move vehicle0 waypoint69 waypoint19)  [22160.000]
138212.010: (transmit-data vehicle0 data8 waypoint0)  [20.000]
138232.011: (move vehicle0 waypoint19 waypoint38)  [13190.000]
151422.012: (localize-cable vehicle0 waypoint38 turbine2)  [5.000]
151427.013: (submerge-mission vehicle0 data2 waypoint38 currenttide turbine2)  [1.000]
151428.014: (transmit-data vehicle0 data2 waypoint0)  [20.000]
151448.015: (move vehicle0 waypoint38 waypoint20)  [20880.000]
172328.016: (move vehicle0 waypoint20 waypoint41)  [22250.000]
194578.017: (localize-cable vehicle0 waypoint41 turbine3)  [5.000]
194583.018: (submerge-mission vehicle0 data3 waypoint41 currenttide turbine3)  [1.000]
194584.018: (move vehicle0 waypoint41 waypoint20)  [22250.000]
216834.019: (move vehicle0 waypoint20 waypoint38)  [20880.000]
237714.020: (move vehicle0 waypoint38 waypoint37)  [9260.000]
246974.021: (move vehicle0 waypoint37 waypoint36)  [5820.000]
252794.022: (move vehicle0 waypoint36 waypoint22)  [37430.000]
290224.023: (move vehicle0 waypoint22 waypoint64)  [33120.000]
323344.024: (localize-cable vehicle0 waypoint64 turbine7)  [5.000]
323344.025: (transmit-data vehicle0 data3 waypoint0)  [20.000]
323364.026: (submerge-mission vehicle0 data7 waypoint64 currenttide turbine7)  [1.000]
323365.027: (transmit-data vehicle0 data7 waypoint0)  [20.000]
