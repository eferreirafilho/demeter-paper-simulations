Number of literals: 26
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 41.000
b (40.000 | 653.000)b (38.000 | 653.000)b (36.000 | 656.124)b (34.000 | 5391.127)b (32.000 | 5591.128)b (30.000 | 5611.129)b (28.000 | 12906.134)b (26.000 | 13106.135)b (25.000 | 14012.136)b (24.000 | 14012.136)b (23.000 | 16571.137)b (22.000 | 16571.137)b (21.000 | 19490.138)b (20.000 | 19490.138)b (19.000 | 20396.139)b (18.000 | 20396.139)b (17.000 | 21302.140)b (16.000 | 21302.140)b (15.000 | 25126.141)b (14.000 | 25126.141)b (13.000 | 31316.142)b (12.000 | 31316.142)b (11.000 | 33754.143)b (10.000 | 33754.143)b (9.000 | 34660.144)b (8.000 | 34660.144)b (7.000 | 34680.146)b (5.000 | 34680.146)b (4.000 | 34680.146)b (2.000 | 34880.147);;;; Solution Found
; States evaluated: 168
; Cost: 0.000
; Time 0.50
0.000: (move vehicle0 wp_init_auv0 waypoint10)  [653.000]
653.001: (wait-to-recharge vehicle0)  [3.123]
656.125: (move vehicle0 waypoint10 waypoint16)  [3824.000]
4480.126: (move vehicle0 waypoint16 waypoint15)  [906.000]
5386.127: (localize-cable vehicle0 waypoint15 turbine0)  [5.000]
5391.128: (submerge-mission vehicle0 data0 waypoint15 currenttide turbine0)  [200.000]
5591.129: (transmit-data vehicle0 data0 waypoint0)  [20.000]
5611.130: (move vehicle0 waypoint15 waypoint19)  [906.000]
6517.131: (move vehicle0 waypoint19 waypoint7)  [2919.000]
9436.132: (move vehicle0 waypoint7 waypoint21)  [2559.000]
11995.133: (move vehicle0 waypoint21 waypoint20)  [906.000]
12901.134: (localize-cable vehicle0 waypoint20 turbine1)  [5.000]
12906.135: (submerge-mission vehicle0 data1 waypoint20 currenttide turbine1)  [200.000]
13106.136: (move vehicle0 waypoint20 waypoint21)  [906.000]
14012.137: (move vehicle0 waypoint21 waypoint7)  [2559.000]
16571.138: (move vehicle0 waypoint7 waypoint19)  [2919.000]
19490.139: (move vehicle0 waypoint19 waypoint15)  [906.000]
20396.140: (move vehicle0 waypoint15 waypoint16)  [906.000]
21302.141: (move vehicle0 waypoint16 waypoint10)  [3824.000]
25126.142: (move vehicle0 waypoint10 waypoint11)  [6190.000]
31316.143: (move vehicle0 waypoint11 waypoint36)  [2438.000]
33754.144: (move vehicle0 waypoint36 waypoint35)  [906.000]
34660.145: (localize-cable vehicle0 waypoint35 turbine4)  [5.000]
34660.146: (transmit-data vehicle0 data1 waypoint0)  [20.000]
34680.147: (submerge-mission vehicle0 data4 waypoint35 currenttide turbine4)  [200.000]
34880.148: (transmit-data vehicle0 data4 waypoint0)  [20.000]
