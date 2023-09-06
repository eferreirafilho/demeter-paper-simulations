Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 27.289)b (6.000 | 520.150)b (5.000 | 956.920)b (4.000 | 991.922)b (3.000 | 1786.986)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 27.289)b (6.000 | 520.150)b (5.000 | 956.920)b (4.000 | 991.922)b (2.000 | 1317.597)b (1.000 | 1319.598)(G)
; No metric specified - using makespan

; Plan found with metric 1319.598
; States evaluated so far: 6586
; States pruned based on pre-heuristic cost lower bound: 0
; Time 7.25
0.000: (move vehicle0 wp_init_auv0 waypoint21)  [7.288]
7.289: (harvest-energy vehicle0)  [20.000]
27.290: (move vehicle0 waypoint21 waypoint16)  [172.844]
200.135: (harvest-energy vehicle0)  [20.000]
220.136: (harvest-energy vehicle0)  [20.000]
240.137: (harvest-energy vehicle0)  [20.000]
260.138: (harvest-energy vehicle0)  [20.000]
280.139: (harvest-energy vehicle0)  [20.000]
300.140: (harvest-energy vehicle0)  [20.000]
320.141: (harvest-energy vehicle0)  [20.000]
340.142: (harvest-energy vehicle0)  [20.000]
360.143: (harvest-energy vehicle0)  [20.000]
380.144: (harvest-energy vehicle0)  [20.000]
400.145: (harvest-energy vehicle0)  [20.000]
420.146: (harvest-energy vehicle0)  [20.000]
440.147: (harvest-energy vehicle0)  [20.000]
460.148: (harvest-energy vehicle0)  [20.000]
480.149: (harvest-energy vehicle0)  [20.000]
500.150: (harvest-energy vehicle0)  [20.000]
520.151: (move vehicle0 waypoint16 waypoint11)  [156.755]
676.907: (harvest-energy vehicle0)  [20.000]
696.908: (harvest-energy vehicle0)  [20.000]
716.909: (harvest-energy vehicle0)  [20.000]
736.910: (harvest-energy vehicle0)  [20.000]
756.911: (harvest-energy vehicle0)  [20.000]
776.912: (harvest-energy vehicle0)  [20.000]
796.913: (harvest-energy vehicle0)  [20.000]
816.914: (harvest-energy vehicle0)  [20.000]
836.915: (harvest-energy vehicle0)  [20.000]
856.916: (harvest-energy vehicle0)  [20.000]
876.917: (harvest-energy vehicle0)  [20.000]
896.918: (harvest-energy vehicle0)  [20.000]
916.919: (harvest-energy vehicle0)  [20.000]
936.920: (harvest-energy vehicle0)  [20.000]
956.921: (localize-cable vehicle0 waypoint11 turbine2)  [15.000]
1062.589: (harvest-energy vehicle0)  [20.000]
1082.590: (retrieve-data vehicle0 data2 waypoint11 currenttide currentwaves turbine2)  [75.000]
1157.591: (surface vehicle0)  [40.000]
1197.592: (harvest-energy vehicle0)  [20.000]
1217.593: (harvest-energy vehicle0)  [20.000]
1237.594: (harvest-energy vehicle0)  [20.000]
1257.595: (harvest-energy vehicle0)  [20.000]
1277.596: (harvest-energy vehicle0)  [20.000]
1297.597: (harvest-energy vehicle0)  [20.000]
1317.598: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 1319.598
b (0.000 | 1319.598)(G)
; No metric specified - using makespan

; Plan found with metric 1237.594
; States evaluated so far: 7504
; States pruned based on pre-heuristic cost lower bound: 1938
; Time 8.61
0.000: (move vehicle0 wp_init_auv0 waypoint21)  [7.288]
7.289: (harvest-energy vehicle0)  [20.000]
27.290: (move vehicle0 waypoint21 waypoint16)  [172.844]
200.135: (harvest-energy vehicle0)  [20.000]
220.136: (harvest-energy vehicle0)  [20.000]
240.137: (harvest-energy vehicle0)  [20.000]
260.138: (harvest-energy vehicle0)  [20.000]
280.139: (harvest-energy vehicle0)  [20.000]
300.140: (harvest-energy vehicle0)  [20.000]
320.141: (harvest-energy vehicle0)  [20.000]
340.142: (harvest-energy vehicle0)  [20.000]
360.143: (harvest-energy vehicle0)  [20.000]
380.144: (harvest-energy vehicle0)  [20.000]
400.145: (harvest-energy vehicle0)  [20.000]
420.146: (harvest-energy vehicle0)  [20.000]
440.147: (harvest-energy vehicle0)  [20.000]
460.148: (harvest-energy vehicle0)  [20.000]
480.149: (harvest-energy vehicle0)  [20.000]
500.150: (harvest-energy vehicle0)  [20.000]
520.151: (move vehicle0 waypoint16 waypoint11)  [156.755]
676.907: (harvest-energy vehicle0)  [20.000]
696.908: (harvest-energy vehicle0)  [20.000]
716.909: (harvest-energy vehicle0)  [20.000]
736.910: (harvest-energy vehicle0)  [20.000]
756.911: (harvest-energy vehicle0)  [20.000]
776.912: (harvest-energy vehicle0)  [20.000]
796.913: (harvest-energy vehicle0)  [20.000]
816.914: (harvest-energy vehicle0)  [20.000]
836.915: (harvest-energy vehicle0)  [20.000]
856.916: (harvest-energy vehicle0)  [20.000]
876.917: (harvest-energy vehicle0)  [20.000]
896.918: (harvest-energy vehicle0)  [20.000]
916.919: (harvest-energy vehicle0)  [20.000]
936.920: (harvest-energy vehicle0)  [20.000]
956.921: (localize-cable vehicle0 waypoint11 turbine2)  [15.000]
971.922: (harvest-energy vehicle0)  [20.000]
991.923: (localize-cable vehicle0 waypoint11 turbine2)  [15.000]
1006.924: (harvest-energy vehicle0)  [20.000]
1082.590: (retrieve-data vehicle0 data2 waypoint11 currenttide currentwaves turbine2)  [75.000]
1082.591: (localize-cable vehicle0 waypoint11 turbine2)  [15.000]
1097.592: (surface vehicle0)  [40.000]
1137.593: (harvest-energy vehicle0)  [20.000]
1157.591: (harvest-energy vehicle0)  [20.000]
1157.594: (harvest-energy vehicle0)  [20.000]
1177.592: (harvest-energy vehicle0)  [20.000]
1177.595: (harvest-energy vehicle0)  [20.000]
1197.593: (harvest-energy vehicle0)  [20.000]
1197.596: (harvest-energy vehicle0)  [20.000]
1217.594: (harvest-energy vehicle0)  [20.000]
1235.594: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 1237.594
b (0.000 | 1237.594)(G)
; No metric specified - using makespan

; Plan found with metric 1219.597
; States evaluated so far: 7683
; States pruned based on pre-heuristic cost lower bound: 2100
; Time 8.97
0.000: (move vehicle0 wp_init_auv0 waypoint21)  [7.288]
7.289: (harvest-energy vehicle0)  [20.000]
27.290: (move vehicle0 waypoint21 waypoint16)  [172.844]
200.135: (harvest-energy vehicle0)  [20.000]
220.136: (harvest-energy vehicle0)  [20.000]
240.137: (harvest-energy vehicle0)  [20.000]
260.138: (harvest-energy vehicle0)  [20.000]
280.139: (harvest-energy vehicle0)  [20.000]
300.140: (harvest-energy vehicle0)  [20.000]
320.141: (harvest-energy vehicle0)  [20.000]
340.142: (harvest-energy vehicle0)  [20.000]
360.143: (harvest-energy vehicle0)  [20.000]
380.144: (harvest-energy vehicle0)  [20.000]
400.145: (harvest-energy vehicle0)  [20.000]
420.146: (harvest-energy vehicle0)  [20.000]
440.147: (harvest-energy vehicle0)  [20.000]
460.148: (harvest-energy vehicle0)  [20.000]
480.149: (harvest-energy vehicle0)  [20.000]
500.150: (harvest-energy vehicle0)  [20.000]
520.151: (move vehicle0 waypoint16 waypoint11)  [156.755]
676.907: (harvest-energy vehicle0)  [20.000]
696.908: (harvest-energy vehicle0)  [20.000]
716.909: (harvest-energy vehicle0)  [20.000]
736.910: (harvest-energy vehicle0)  [20.000]
756.911: (harvest-energy vehicle0)  [20.000]
776.912: (harvest-energy vehicle0)  [20.000]
796.913: (harvest-energy vehicle0)  [20.000]
816.914: (harvest-energy vehicle0)  [20.000]
836.915: (harvest-energy vehicle0)  [20.000]
856.916: (harvest-energy vehicle0)  [20.000]
876.917: (harvest-energy vehicle0)  [20.000]
896.918: (harvest-energy vehicle0)  [20.000]
916.919: (harvest-energy vehicle0)  [20.000]
936.920: (harvest-energy vehicle0)  [20.000]
956.921: (localize-cable vehicle0 waypoint11 turbine2)  [15.000]
971.922: (harvest-energy vehicle0)  [20.000]
991.923: (localize-cable vehicle0 waypoint11 turbine2)  [15.000]
1006.924: (harvest-energy vehicle0)  [20.000]
1082.590: (retrieve-data vehicle0 data2 waypoint11 currenttide currentwaves turbine2)  [75.000]
1082.591: (localize-cable vehicle0 waypoint11 turbine2)  [15.000]
1097.592: (surface vehicle0)  [40.000]
1137.593: (harvest-energy vehicle0)  [20.000]
1157.591: (harvest-energy vehicle0)  [20.000]
1157.594: (harvest-energy vehicle0)  [20.000]
1177.592: (harvest-energy vehicle0)  [20.000]
1177.595: (harvest-energy vehicle0)  [20.000]
1197.593: (harvest-energy vehicle0)  [20.000]
1197.596: (harvest-energy vehicle0)  [20.000]
1217.597: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 1219.597
b (0.000 | 1219.597)