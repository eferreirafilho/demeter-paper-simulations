Number of literals: 11
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
50% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 6.000, admissible cost estimate 0.000
b (5.000 | 10.058)b (4.000 | 35.060)b (2.000 | 190.068)b (1.000 | 192.069)(G)
; No metric specified - using makespan

; Plan found with metric 192.069
; States evaluated so far: 40
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.04
0.000: (move vehicle0 wp_init_auv0 waypoint17)  [0.057]
0.058: (harvest-energy vehicle0)  [10.000]
10.059: (localize-cable vehicle0 waypoint17 turbine3)  [15.000]
25.060: (harvest-energy vehicle0)  [10.000]
35.061: (retrieve-data vehicle0 data3 waypoint17 currenttide turbine3)  [55.000]
90.062: (surface vehicle0)  [40.000]
130.063: (harvest-energy vehicle0)  [10.000]
140.064: (harvest-energy vehicle0)  [10.000]
150.065: (harvest-energy vehicle0)  [10.000]
160.066: (harvest-energy vehicle0)  [10.000]
170.067: (harvest-energy vehicle0)  [10.000]
180.068: (harvest-energy vehicle0)  [10.000]
190.069: (upload-data-histograms vehicle0 data3)  [2.000]

 * All goal deadlines now no later than 192.069

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (5.000 | 10.058)b (4.000 | 35.060)b (2.000 | 190.068)b (1.000 | 192.069)(G)b (0.000 | 192.069)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)(G)
Problem Unsolvable
;;;; Solution Found
; States evaluated: 9885
; Cost: 192.069
; Time 9.72
0.000: (move vehicle0 wp_init_auv0 waypoint17)  [0.057]
0.058: (harvest-energy vehicle0)  [10.000]
10.059: (localize-cable vehicle0 waypoint17 turbine3)  [15.000]
25.060: (harvest-energy vehicle0)  [10.000]
35.061: (retrieve-data vehicle0 data3 waypoint17 currenttide turbine3)  [55.000]
90.062: (surface vehicle0)  [40.000]
130.063: (harvest-energy vehicle0)  [10.000]
140.064: (harvest-energy vehicle0)  [10.000]
150.065: (harvest-energy vehicle0)  [10.000]
160.066: (harvest-energy vehicle0)  [10.000]
170.067: (harvest-energy vehicle0)  [10.000]
180.068: (harvest-energy vehicle0)  [10.000]
190.069: (upload-data-histograms vehicle0 data3)  [2.000]
