Number of literals: 14
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 15.000, admissible cost estimate 0.000
b (14.000 | 3.816)b (13.000 | 1416.910)b (12.000 | 1416.910)b (11.000 | 1416.910)b (10.000 | 1416.910)b (9.000 | 1416.910)b (8.000 | 1416.910)b (6.000 | 1416.910)b (5.000 | 1416.910)b (4.000 | 1416.910)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (14.000 | 3.816)b (13.000 | 1416.910)b (12.000 | 1416.910)b (11.000 | 1465.192)b (10.000 | 1465.192)b (9.000 | 1566.710)b (8.000 | 1566.710)b (6.000 | 1570.698)b (5.000 | 1580.700)b (4.000 | 1580.700)b (2.000 | 1631.397)(G)
; No metric specified - using makespan

; Plan found with metric 1633.398
; States evaluated so far: 644
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.72
1413.092: (move vehicle0 wp_init_auv0 waypoint22)  [3.816]
1416.909: (move vehicle0 waypoint22 waypoint18)  [48.283]
1465.193: (move vehicle0 waypoint18 waypoint14)  [53.100]
1518.294: (move vehicle0 waypoint14 waypoint10)  [48.416]
1566.711: (harvest-energy vehicle0)  [3.987]
1592.919: (localize-cable vehicle0 waypoint10 turbine2)  [5.000]
1597.920: (retrieve-data vehicle0 data2 waypoint10 currenttide turbine2)  [20.000]
1617.921: (surface vehicle0)  [5.000]
1622.922: (harvest-energy vehicle0)  [8.475]
1631.398: (upload-data-histograms vehicle0 data2)  [2.000]

 * All goal deadlines now no later than 1633.398
b (0.000 | 1633.398)