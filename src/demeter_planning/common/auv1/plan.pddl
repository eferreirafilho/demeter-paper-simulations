Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 104.913)b (6.000 | 242.675)b (5.000 | 335.819)b (4.000 | 360.821)b (3.000 | 905.881)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 104.913)b (6.000 | 242.675)b (5.000 | 335.819)b (4.000 | 360.821)b (2.000 | 714.777)b (1.000 | 716.777)(G)
; No metric specified - using makespan

; Plan found with metric 716.778
; States evaluated so far: 4169
; States pruned based on pre-heuristic cost lower bound: 0
; Time 3.84
0.000: (move vehicle1 wp_init_auv1 waypoint4)  [44.907]
44.908: (harvest-energy vehicle1)  [10.000]
54.909: (harvest-energy vehicle1)  [10.000]
64.910: (harvest-energy vehicle1)  [10.000]
74.911: (harvest-energy vehicle1)  [10.000]
84.912: (harvest-energy vehicle1)  [10.000]
94.913: (harvest-energy vehicle1)  [10.000]
104.914: (move vehicle1 waypoint4 waypoint5)  [57.753]
162.668: (harvest-energy vehicle1)  [10.000]
172.669: (harvest-energy vehicle1)  [10.000]
182.670: (harvest-energy vehicle1)  [10.000]
192.671: (harvest-energy vehicle1)  [10.000]
202.672: (harvest-energy vehicle1)  [10.000]
212.673: (harvest-energy vehicle1)  [10.000]
222.674: (harvest-energy vehicle1)  [10.000]
232.675: (harvest-energy vehicle1)  [10.000]
242.676: (move vehicle1 waypoint5 waypoint1)  [43.138]
285.815: (harvest-energy vehicle1)  [10.000]
295.816: (harvest-energy vehicle1)  [10.000]
305.817: (harvest-energy vehicle1)  [10.000]
315.818: (harvest-energy vehicle1)  [10.000]
325.819: (harvest-energy vehicle1)  [10.000]
335.820: (localize-cable vehicle1 waypoint1 turbine0)  [15.000]
549.769: (harvest-energy vehicle1)  [10.000]
559.770: (retrieve-data vehicle1 data0 waypoint1 currenttide currentwaves turbine0)  [55.000]
614.771: (surface vehicle1)  [40.000]
654.772: (harvest-energy vehicle1)  [10.000]
664.773: (harvest-energy vehicle1)  [10.000]
674.774: (harvest-energy vehicle1)  [10.000]
684.775: (harvest-energy vehicle1)  [10.000]
694.776: (harvest-energy vehicle1)  [10.000]
704.777: (harvest-energy vehicle1)  [10.000]
714.778: (upload-data-histograms vehicle1 data0)  [2.000]

 * All goal deadlines now no later than 716.778
b (0.000 | 716.778)