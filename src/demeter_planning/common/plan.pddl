Number of literals: 35
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%]
Seeing if metric is defined in terms of task vars or a minimal value of makespan
- Yes it is
Recognised a monotonic-change-induced limit on -1.000*<special>
- Must be >=  the metric
[01;31mLooking for achievers for goal index 0, fact (data-sent data1) with fID 32[00m
 (transmit_data vehicle1 data1 wp0) (transmit_data vehicle1 data1 wp1)
[01;34mFor limits: literal goal index 0, fact (data-sent data1), could be achieved by operator (transmit_data vehicle1 data1 wp0), which has other interesting effects (including one on (empty vehicle1) )[00m
Action 12 - (find vehicle1 wp0 wp1) is uninteresting once we have fact (can-move wp0 wp1)
Action 13 - (find vehicle1 wp2 wp3) is uninteresting once we have fact (can-move wp2 wp3)
Action 14 - (find vehicle1 wp5 wp6) is uninteresting once we have fact (can-move wp5 wp6)
75% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 10.000, admissible cost estimate 360.008
b (9.000 | 110.001)b (8.000 | 165.002)b (7.000 | 220.003)b (6.000 | 275.004)b (5.000 | 330.005)b (4.000 | 350.006)b (3.000 | 350.006)b (2.000 | 405.006)b (1.000 | 415.006)(G)
; LP calculated the cost

; Plan found with metric 415.006
; Theoretical reachable cost 415.008
; States evaluated so far: 12
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.01
0.000: (move vehicle1 wp0 wp1)  [55.000]
55.001: (move vehicle1 wp1 wp2)  [55.000]
110.002: (move vehicle1 wp2 wp3)  [55.000]
165.003: (move vehicle1 wp3 wp4)  [55.000]
220.004: (move vehicle1 wp4 wp5)  [55.000]
275.005: (move vehicle1 wp5 wp6)  [55.000]
330.006: (get_data vehicle1 data1 wp6)  [20.000]
350.006: (move vehicle1 wp6 wp0)  [55.000]
405.006: (transmit_data vehicle1 data1 wp0)  [10.000]

 * All goal deadlines now no later than 415.006

Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (9.000 | 110.001)b (8.000 | 165.002)b (7.000 | 220.003)b (6.000 | 275.004)b (5.000 | 330.005)b (4.000 | 350.006)b (3.000 | 350.006)