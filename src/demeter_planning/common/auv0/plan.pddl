Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 30.171)b (5.000 | 277.139)b (4.000 | 302.141)b (3.000 | 847.200)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 30.171)b (5.000 | 277.139)b (4.000 | 302.141)b (2.000 | 1001.147)b (1.000 | 1003.147)(G)
; No metric specified - using makespan

; Plan found with metric 1003.148
; States evaluated so far: 3464
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.23
0.000: (move vehicle0 wp_init_auv0 waypoint4)  [10.169]
10.170: (harvest-energy vehicle0)  [10.000]
20.171: (harvest-energy vehicle0)  [10.000]
30.172: (move vehicle0 waypoint4 waypoint52)  [106.953]
137.126: (harvest-energy vehicle0)  [10.000]
147.127: (harvest-energy vehicle0)  [10.000]
157.128: (harvest-energy vehicle0)  [10.000]
167.129: (harvest-energy vehicle0)  [10.000]
177.130: (harvest-energy vehicle0)  [10.000]
187.131: (harvest-energy vehicle0)  [10.000]
197.132: (harvest-energy vehicle0)  [10.000]
207.133: (harvest-energy vehicle0)  [10.000]
217.134: (harvest-energy vehicle0)  [10.000]
227.135: (harvest-energy vehicle0)  [10.000]
237.136: (harvest-energy vehicle0)  [10.000]
247.137: (harvest-energy vehicle0)  [10.000]
257.138: (harvest-energy vehicle0)  [10.000]
267.139: (harvest-energy vehicle0)  [10.000]
277.140: (localize-cable vehicle0 waypoint52 turbine10)  [15.000]
836.139: (harvest-energy vehicle0)  [10.000]
846.140: (retrieve-data vehicle0 data10 waypoint52 currenttide currentwaves turbine10)  [55.000]
901.141: (surface vehicle0)  [40.000]
941.142: (harvest-energy vehicle0)  [10.000]
951.143: (harvest-energy vehicle0)  [10.000]
961.144: (harvest-energy vehicle0)  [10.000]
971.145: (harvest-energy vehicle0)  [10.000]
981.146: (harvest-energy vehicle0)  [10.000]
991.147: (harvest-energy vehicle0)  [10.000]
1001.148: (upload-data-histograms vehicle0 data10)  [2.000]

 * All goal deadlines now no later than 1003.148
b (0.000 | 1003.148)