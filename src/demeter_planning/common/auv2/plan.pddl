Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
50% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 6.000, admissible cost estimate 0.000
b (5.000 | 36.144)b (4.000 | 61.146)b (2.000 | 216.154)b (1.000 | 218.155)(G)
; No metric specified - using makespan

; Plan found with metric 218.155
; States evaluated so far: 44
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.04
0.000: (move vehicle2 wp_init_auv2 waypoint22)  [16.142]
16.143: (harvest-energy vehicle2)  [10.000]
26.144: (harvest-energy vehicle2)  [10.000]
36.145: (localize-cable vehicle2 waypoint22 turbine4)  [15.000]
51.146: (harvest-energy vehicle2)  [10.000]
61.147: (retrieve-data vehicle2 data4 waypoint22 currenttide turbine4)  [55.000]
116.148: (surface vehicle2)  [40.000]
156.149: (harvest-energy vehicle2)  [10.000]
166.150: (harvest-energy vehicle2)  [10.000]
176.151: (harvest-energy vehicle2)  [10.000]
186.152: (harvest-energy vehicle2)  [10.000]
196.153: (harvest-energy vehicle2)  [10.000]
206.154: (harvest-energy vehicle2)  [10.000]
216.155: (upload-data-histograms vehicle2 data4)  [2.000]

 * All goal deadlines now no later than 218.155

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (5.000 | 36.144)b (4.000 | 61.146)b (2.000 | 216.154)b (1.000 | 218.155)(G)b (0.000 | 218.155)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)