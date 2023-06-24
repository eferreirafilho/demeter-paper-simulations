Number of literals: 13
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
- Duration of (harvest-energy vehicle0) is not constant-bounded
Non-constant-bounded duration-dependent effect ((battery-level vehicle0) +=10.000*?duration) makes effects on 0 be order-dependent
[i] Not abstracting out TIL (is-in data5 turbine5)
[i] Not abstracting out TIL (is-turbine-wp waypoint22 turbine5)
None of the ground temporal actions in this problem have been recognised as compression-safe
Initial heuristic = 15.000, admissible cost estimate 0.000
b (14.000 | 8.650)b (13.000 | 4596.450)b (12.000 | 4596.520)b (11.000 | 4598.350)b (10.000 | 4598.350)b (9.000 | 4598.350)b (8.000 | 4598.350)b (6.000 | 4598.350)b (5.000 | 4601.521)b (4.000 | 4606.522)b (2.000 | 4641.000)b (1.000 | 4643.000)(G)
; No metric specified - using makespan

; Plan found with metric 4643.001
; States evaluated so far: 25
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.05
0.000: (move vehicle0 wp_init_auv0 waypoint20)  [8.650]
8.651: (move vehicle0 waypoint20 waypoint22)  [40.883]
49.535: (harvest-energy vehicle0)  [4.127]
4596.521: (localize-cable vehicle0 waypoint22 turbine5)  [5.000]
4601.522: (surface vehicle0)  [5.000]
4606.523: (retrieve-data vehicle0 data5 waypoint22 currenttide turbine5)  [20.000]
4626.524: (surface vehicle0)  [5.000]
4631.525: (harvest-energy vehicle0)  [9.475]
4641.001: (upload-data-histograms vehicle0 data5)  [2.000]

 * All goal deadlines now no later than 4643.001

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (14.000 | 8.650)b (13.000 | 4596.450)b (12.000 | 4596.520)b (11.000 | 4598.350)b (10.000 | 4598.350)b (9.000 | 4598.350)b (8.000 | 4598.350)b (6.000 | 4598.350)b (5.000 | 4601.521)b (4.000 | 4606.522)b (2.000 | 4635.499)(G)
; No metric specified - using makespan

; Plan found with metric 4637.500
; States evaluated so far: 100
; States pruned based on pre-heuristic cost lower bound: 8
; Time 0.12
0.000: (move vehicle0 wp_init_auv0 waypoint20)  [8.650]
8.651: (move vehicle0 waypoint20 waypoint22)  [40.883]
49.535: (harvest-energy vehicle0)  [4.127]
4596.521: (localize-cable vehicle0 waypoint22 turbine5)  [5.000]
4601.522: (retrieve-data vehicle0 data5 waypoint22 currenttide turbine5)  [20.000]
4621.523: (surface vehicle0)  [5.000]
4626.524: (harvest-energy vehicle0)  [8.975]
4635.500: (upload-data-histograms vehicle0 data5)  [2.000]

 * All goal deadlines now no later than 4637.500
b (0.000 | 4637.500)(G)(G)