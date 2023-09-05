Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
57% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 7.000, admissible cost estimate 0.000
b (6.000 | 68.988)b (5.000 | 172.133)b (4.000 | 197.135)b (3.000 | 742.198)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (6.000 | 68.988)b (5.000 | 172.133)b (4.000 | 197.135)b (2.000 | 714.952)b (1.000 | 716.953)(G)
; No metric specified - using makespan

; Plan found with metric 716.953
; States evaluated so far: 2831
; States pruned based on pre-heuristic cost lower bound: 0
; Time 2.27
0.000: (move vehicle0 wp_init_auv0 waypoint2)  [28.984]
28.985: (harvest-energy vehicle0)  [10.000]
38.986: (harvest-energy vehicle0)  [10.000]
48.987: (harvest-energy vehicle0)  [10.000]
58.988: (harvest-energy vehicle0)  [10.000]
68.989: (move vehicle0 waypoint2 waypoint1)  [43.138]
112.128: (harvest-energy vehicle0)  [10.000]
122.129: (harvest-energy vehicle0)  [10.000]
132.130: (harvest-energy vehicle0)  [10.000]
142.131: (harvest-energy vehicle0)  [10.000]
152.132: (harvest-energy vehicle0)  [10.000]
162.133: (harvest-energy vehicle0)  [10.000]
172.134: (localize-cable vehicle0 waypoint1 turbine0)  [15.000]
549.944: (harvest-energy vehicle0)  [10.000]
559.945: (retrieve-data vehicle0 data0 waypoint1 currenttide currentwaves turbine0)  [55.000]
614.946: (surface vehicle0)  [40.000]
654.947: (harvest-energy vehicle0)  [10.000]
664.948: (harvest-energy vehicle0)  [10.000]
674.949: (harvest-energy vehicle0)  [10.000]
684.950: (harvest-energy vehicle0)  [10.000]
694.951: (harvest-energy vehicle0)  [10.000]
704.952: (harvest-energy vehicle0)  [10.000]
714.953: (upload-data-histograms vehicle0 data0)  [2.000]

 * All goal deadlines now no later than 716.953
b (0.000 | 716.953)