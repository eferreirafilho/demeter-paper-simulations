Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
62% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 189.735)b (7.000 | 189.735)b (6.000 | 189.735)b (5.000 | 189.735)b (4.000 | 189.735)b (2.000 | 344.743)b (1.000 | 346.744)(G)
; No metric specified - using makespan

; Plan found with metric 346.744
; States evaluated so far: 76
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.11
0.000: (move vehicle0 wp_init_auv0 waypoint19)  [9.876]
9.877: (harvest-energy vehicle0)  [10.000]
19.878: (harvest-energy vehicle0)  [10.000]
29.879: (move vehicle0 waypoint19 waypoint20)  [11.046]
40.926: (harvest-energy vehicle0)  [10.000]
50.927: (move vehicle0 waypoint20 waypoint22)  [40.107]
91.035: (harvest-energy vehicle0)  [10.000]
101.036: (harvest-energy vehicle0)  [10.000]
111.037: (harvest-energy vehicle0)  [10.000]
121.038: (harvest-energy vehicle0)  [10.000]
131.039: (harvest-energy vehicle0)  [10.000]
141.040: (localize-cable vehicle0 waypoint22 turbine4)  [15.000]
179.735: (harvest-energy vehicle0)  [10.000]
189.736: (retrieve-data vehicle0 data4 waypoint22 currenttide currentwaves turbine4)  [55.000]
244.737: (surface vehicle0)  [40.000]
284.738: (harvest-energy vehicle0)  [10.000]
294.739: (harvest-energy vehicle0)  [10.000]
304.740: (harvest-energy vehicle0)  [10.000]
314.741: (harvest-energy vehicle0)  [10.000]
324.742: (harvest-energy vehicle0)  [10.000]
334.743: (harvest-energy vehicle0)  [10.000]
344.744: (upload-data-histograms vehicle0 data4)  [2.000]

 * All goal deadlines now no later than 346.744

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 189.735)b (7.000 | 189.735)b (6.000 | 189.735)b (5.000 | 189.735)b (4.000 | 189.735)b (2.000 | 344.743)b (1.000 | 346.744)