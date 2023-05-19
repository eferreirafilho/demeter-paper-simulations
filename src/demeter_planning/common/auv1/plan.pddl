Number of literals: 10
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
(total-missions-completed vehicle1) has a finite lower bound: [0.000,inf]
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle1) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle1) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 8.000, admissible cost estimate 0.000
b (7.000 | 5.516)b (6.000 | 5.516)b (5.000 | 10.517)b (4.000 | 15.518)b (2.000 | 230.134)(G)
; No metric specified - using makespan

; Plan found with metric 232.135
; States evaluated so far: 16
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.00
0.000: (move vehicle1 wp_init_auv1 waypoint2)  [5.516]
5.517: (localize-cable vehicle1 waypoint2 turbine0)  [5.000]
10.518: (surface vehicle1)  [5.000]
15.519: (inspect-turbine vehicle1 data0 waypoint2 currenttide turbine0)  [200.000]
215.520: (surface vehicle1)  [5.000]
220.521: (harvest-energy vehicle1)  [9.613]
230.135: (upload-data-histograms vehicle1 data0)  [2.000]

 * All goal deadlines now no later than 232.135

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (7.000 | 5.516)b (6.000 | 5.516)b (5.000 | 10.517)b (4.000 | 15.518)b (2.000 | 224.633)(G)
; No metric specified - using makespan

; Plan found with metric 226.634
; States evaluated so far: 44
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.02
0.000: (move vehicle1 wp_init_auv1 waypoint2)  [5.516]
5.517: (localize-cable vehicle1 waypoint2 turbine0)  [5.000]
10.518: (inspect-turbine vehicle1 data0 waypoint2 currenttide turbine0)  [200.000]
210.519: (surface vehicle1)  [5.000]
215.520: (harvest-energy vehicle1)  [9.113]
224.634: (upload-data-histograms vehicle1 data0)  [2.000]

 * All goal deadlines now no later than 226.634
b (0.000 | 226.634)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 98
; Cost: 226.634
; Time 0.07
0.000: (move vehicle1 wp_init_auv1 waypoint2)  [5.516]
5.517: (localize-cable vehicle1 waypoint2 turbine0)  [5.000]
10.518: (inspect-turbine vehicle1 data0 waypoint2 currenttide turbine0)  [200.000]
210.519: (surface vehicle1)  [5.000]
215.520: (harvest-energy vehicle1)  [9.113]
224.634: (upload-data-histograms vehicle1 data0)  [2.000]
