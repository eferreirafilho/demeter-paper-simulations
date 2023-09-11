Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 16.139)b (6.000 | 80.944)b (5.000 | 276.663)b (4.000 | 301.665)b (3.000 | 846.724)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 16.139)b (6.000 | 80.944)b (5.000 | 276.663)b (4.000 | 301.665)b (2.000 | 1261.707)b (1.000 | 1263.707)(G)
; No metric specified - using makespan

; Plan found with metric 1263.708
; States evaluated so far: 4356
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.83
0.000: (move vehicle1 wp_init_auv1 waypoint50)  [6.138]
6.139: (harvest-energy vehicle1)  [10.000]
16.140: (move vehicle1 waypoint50 waypoint54)  [24.800]
40.941: (harvest-energy vehicle1)  [10.000]
50.942: (harvest-energy vehicle1)  [10.000]
60.943: (harvest-energy vehicle1)  [10.000]
70.944: (harvest-energy vehicle1)  [10.000]
80.945: (move vehicle1 waypoint54 waypoint90)  [85.707]
166.653: (harvest-energy vehicle1)  [10.000]
176.654: (harvest-energy vehicle1)  [10.000]
186.655: (harvest-energy vehicle1)  [10.000]
196.656: (harvest-energy vehicle1)  [10.000]
206.657: (harvest-energy vehicle1)  [10.000]
216.658: (harvest-energy vehicle1)  [10.000]
226.659: (harvest-energy vehicle1)  [10.000]
236.660: (harvest-energy vehicle1)  [10.000]
246.661: (harvest-energy vehicle1)  [10.000]
256.662: (harvest-energy vehicle1)  [10.000]
266.663: (harvest-energy vehicle1)  [10.000]
276.664: (localize-cable vehicle1 waypoint90 turbine17)  [15.000]
1096.699: (harvest-energy vehicle1)  [10.000]
1106.700: (retrieve-data vehicle1 data17 waypoint90 currenttide currentwaves turbine17)  [55.000]
1161.701: (surface vehicle1)  [40.000]
1201.702: (harvest-energy vehicle1)  [10.000]
1211.703: (harvest-energy vehicle1)  [10.000]
1221.704: (harvest-energy vehicle1)  [10.000]
1231.705: (harvest-energy vehicle1)  [10.000]
1241.706: (harvest-energy vehicle1)  [10.000]
1251.707: (harvest-energy vehicle1)  [10.000]
1261.708: (upload-data-histograms vehicle1 data17)  [2.000]

 * All goal deadlines now no later than 1263.708
b (0.000 | 1263.708)