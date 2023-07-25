Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 32.186)b (6.000 | 82.913)b (5.000 | 189.658)b (4.000 | 214.660)b (3.000 | 759.721)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 32.186)b (6.000 | 82.913)b (5.000 | 189.658)b (4.000 | 214.660)b (2.000 | 628.987)b (1.000 | 630.988)(G)
; No metric specified - using makespan

; Plan found with metric 630.988
; States evaluated so far: 4686
; States pruned based on pre-heuristic cost lower bound: 0
; Time 4.54
0.000: (move vehicle0 wp_init_auv0 waypoint2)  [12.184]
12.185: (harvest-energy vehicle0)  [10.000]
22.186: (harvest-energy vehicle0)  [10.000]
32.187: (move vehicle0 waypoint2 waypoint3)  [20.723]
52.911: (harvest-energy vehicle0)  [10.000]
62.912: (harvest-energy vehicle0)  [10.000]
72.913: (harvest-energy vehicle0)  [10.000]
82.914: (move vehicle0 waypoint3 waypoint17)  [46.738]
129.653: (harvest-energy vehicle0)  [10.000]
139.654: (harvest-energy vehicle0)  [10.000]
149.655: (harvest-energy vehicle0)  [10.000]
159.656: (harvest-energy vehicle0)  [10.000]
169.657: (harvest-energy vehicle0)  [10.000]
179.658: (harvest-energy vehicle0)  [10.000]
189.659: (localize-cable vehicle0 waypoint17 turbine3)  [15.000]
463.979: (harvest-energy vehicle0)  [10.000]
473.980: (retrieve-data vehicle0 data3 waypoint17 currenttide currentwaves turbine3)  [55.000]
528.981: (surface vehicle0)  [40.000]
568.982: (harvest-energy vehicle0)  [10.000]
578.983: (harvest-energy vehicle0)  [10.000]
588.984: (harvest-energy vehicle0)  [10.000]
598.985: (harvest-energy vehicle0)  [10.000]
608.986: (harvest-energy vehicle0)  [10.000]
618.987: (harvest-energy vehicle0)  [10.000]
628.988: (upload-data-histograms vehicle0 data3)  [2.000]

 * All goal deadlines now no later than 630.988
b (0.000 | 630.988)