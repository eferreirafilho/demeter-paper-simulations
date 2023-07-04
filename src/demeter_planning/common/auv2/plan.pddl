Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
44% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 16.000, admissible cost estimate 0.000
b (15.000 | 1.000)b (14.000 | 1.000)b (13.000 | 12.761)b (11.000 | 13.762)b (9.000 | 14.763)b (8.000 | 36.405)b (7.000 | 128.131)b (6.000 | 149.773)b (5.000 | 174.775)b (4.000 | 174.775)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (15.000 | 11.760)b (15.000 | 1.000)b (14.000 | 1.000)b (13.000 | 12.761)b (11.000 | 13.762)b (9.000 | 14.763)b (8.000 | 36.405)b (7.000 | 128.131)b (6.000 | 149.773)b (5.000 | 174.775)b (4.000 | 174.775)b (2.000 | 206.419)b (1.000 | 208.420)(G)
; No metric specified - using makespan

; Plan found with metric 208.420
; States evaluated so far: 5336
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.65
0.000: (harvest-energy vehicle2)  [1.000]
1.001: (move vehicle2 wp_init_auv2 waypoint20)  [11.760]
12.762: (harvest-energy vehicle2)  [1.000]
13.763: (harvest-energy vehicle2)  [1.000]
14.764: (move vehicle2 waypoint20 waypoint21)  [20.640]
35.405: (harvest-energy vehicle2)  [1.000]
36.406: (move vehicle2 waypoint21 waypoint7)  [86.720]
123.127: (harvest-energy vehicle2)  [1.000]
124.128: (harvest-energy vehicle2)  [1.000]
125.129: (harvest-energy vehicle2)  [1.000]
126.130: (harvest-energy vehicle2)  [1.000]
127.131: (harvest-energy vehicle2)  [1.000]
128.132: (move vehicle2 waypoint7 waypoint6)  [20.640]
148.773: (harvest-energy vehicle2)  [1.000]
149.774: (localize-cable vehicle2 waypoint6 turbine1)  [10.000]
163.414: (surface vehicle2)  [15.000]
178.415: (retrieve-data vehicle2 data1 waypoint6 currenttide turbine1)  [10.000]
188.416: (surface vehicle2)  [15.000]
203.417: (harvest-energy vehicle2)  [1.000]
204.418: (harvest-energy vehicle2)  [1.000]
205.419: (harvest-energy vehicle2)  [1.000]
206.420: (upload-data-histograms vehicle2 data1)  [2.000]

 * All goal deadlines now no later than 208.420
b (0.000 | 208.420)