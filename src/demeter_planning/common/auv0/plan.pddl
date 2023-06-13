Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle0) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 3.200)b (10.000 | 3.200)b (9.000 | 72.634)b (8.000 | 72.634)b (6.000 | 76.973)b (5.000 | 86.974)b (4.000 | 86.975)b (2.000 | 301.453)(G)
; No metric specified - using makespan

; Plan found with metric 303.454
; States evaluated so far: 21
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle0 wp_init_auv0 waypoint46)  [3.200]
3.201: (move vehicle0 waypoint46 waypoint70)  [69.433]
72.635: (harvest-energy vehicle0)  [4.338]
76.974: (localize-cable vehicle0 waypoint70 turbine17)  [5.000]
81.975: (surface vehicle0)  [5.000]
86.976: (inspect-turbine vehicle0 data17 waypoint70 currenttide turbine17)  [200.000]
286.977: (surface vehicle0)  [5.000]
291.978: (harvest-energy vehicle0)  [9.475]
301.454: (upload-data-histograms vehicle0 data17)  [2.000]

 * All goal deadlines now no later than 303.454

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 3.200)b (10.000 | 3.200)b (9.000 | 72.634)b (8.000 | 72.634)b (6.000 | 76.973)b (5.000 | 86.974)b (4.000 | 86.975)b (2.000 | 295.952)(G)
; No metric specified - using makespan

; Plan found with metric 297.953
; States evaluated so far: 58
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.06
0.000: (move vehicle0 wp_init_auv0 waypoint46)  [3.200]
3.201: (move vehicle0 waypoint46 waypoint70)  [69.433]
72.635: (harvest-energy vehicle0)  [4.338]
76.974: (localize-cable vehicle0 waypoint70 turbine17)  [5.000]
81.975: (inspect-turbine vehicle0 data17 waypoint70 currenttide turbine17)  [200.000]
281.976: (surface vehicle0)  [5.000]
286.977: (harvest-energy vehicle0)  [8.975]
295.953: (upload-data-histograms vehicle0 data17)  [2.000]

 * All goal deadlines now no later than 297.953
b (0.000 | 297.953)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 168
; Cost: 297.953
; Time 0.20
0.000: (move vehicle0 wp_init_auv0 waypoint46)  [3.200]
3.201: (move vehicle0 waypoint46 waypoint70)  [69.433]
72.635: (harvest-energy vehicle0)  [4.338]
76.974: (localize-cable vehicle0 waypoint70 turbine17)  [5.000]
81.975: (inspect-turbine vehicle0 data17 waypoint70 currenttide turbine17)  [200.000]
281.976: (surface vehicle0)  [5.000]
286.977: (harvest-energy vehicle0)  [8.975]
295.953: (upload-data-histograms vehicle0 data17)  [2.000]
