Number of literals: 16
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
70% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 0.000
b (9.000 | 29.494)b (8.000 | 154.240)b (7.000 | 190.427)b (6.000 | 352.913)b (5.000 | 495.414)b (4.000 | 520.416)b (3.000 | 1215.492)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 29.494)b (8.000 | 154.240)b (7.000 | 190.427)b (6.000 | 352.913)b (5.000 | 495.414)b (4.000 | 520.416)b (2.000 | 1311.338)b (1.000 | 1313.339)(G)
; No metric specified - using makespan

; Plan found with metric 1313.339
; States evaluated so far: 10495
; States pruned based on pre-heuristic cost lower bound: 0
; Time 13.58
0.000: (move vehicle0 wp_init_auv0 waypoint120)  [9.492]
9.493: (harvest-energy vehicle0)  [10.000]
19.494: (harvest-energy vehicle0)  [10.000]
29.495: (move vehicle0 waypoint120 waypoint118)  [54.738]
84.234: (harvest-energy vehicle0)  [10.000]
94.235: (harvest-energy vehicle0)  [10.000]
104.236: (harvest-energy vehicle0)  [10.000]
114.237: (harvest-energy vehicle0)  [10.000]
124.238: (harvest-energy vehicle0)  [10.000]
134.239: (harvest-energy vehicle0)  [10.000]
144.240: (harvest-energy vehicle0)  [10.000]
154.241: (move vehicle0 waypoint118 waypoint117)  [16.184]
170.426: (harvest-energy vehicle0)  [10.000]
180.427: (harvest-energy vehicle0)  [10.000]
190.428: (move vehicle0 waypoint117 waypoint150)  [72.476]
262.905: (harvest-energy vehicle0)  [10.000]
272.906: (harvest-energy vehicle0)  [10.000]
282.907: (harvest-energy vehicle0)  [10.000]
292.908: (harvest-energy vehicle0)  [10.000]
302.909: (harvest-energy vehicle0)  [10.000]
312.910: (harvest-energy vehicle0)  [10.000]
322.911: (harvest-energy vehicle0)  [10.000]
332.912: (harvest-energy vehicle0)  [10.000]
342.913: (harvest-energy vehicle0)  [10.000]
352.914: (move vehicle0 waypoint150 waypoint145)  [62.492]
415.407: (harvest-energy vehicle0)  [10.000]
425.408: (harvest-energy vehicle0)  [10.000]
435.409: (harvest-energy vehicle0)  [10.000]
445.410: (harvest-energy vehicle0)  [10.000]
455.411: (harvest-energy vehicle0)  [10.000]
465.412: (harvest-energy vehicle0)  [10.000]
475.413: (harvest-energy vehicle0)  [10.000]
485.414: (harvest-energy vehicle0)  [10.000]
495.415: (localize-cable vehicle0 waypoint145 turbine28)  [15.000]
1136.329: (harvest-energy vehicle0)  [10.000]
1146.330: (retrieve-data vehicle0 data28 waypoint145 currenttide currentwaves turbine28)  [55.000]
1201.331: (surface vehicle0)  [40.000]
1241.332: (harvest-energy vehicle0)  [10.000]
1251.333: (harvest-energy vehicle0)  [10.000]
1261.334: (harvest-energy vehicle0)  [10.000]
1271.335: (harvest-energy vehicle0)  [10.000]
1281.336: (harvest-energy vehicle0)  [10.000]
1291.337: (harvest-energy vehicle0)  [10.000]
1301.338: (harvest-energy vehicle0)  [10.000]
1311.339: (upload-data-histograms vehicle0 data28)  [2.000]

 * All goal deadlines now no later than 1313.339
b (0.000 | 1313.339)