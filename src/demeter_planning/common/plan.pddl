Number of literals: 33
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%] [130%] [140%] [150%] [160%] [170%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%] [130%] [140%] [150%] [160%] [170%]
Seeing if metric is defined in terms of task vars or a minimal value of makespan
- Yes it is
Recognised a monotonic-change-induced limit on -1.000*<special>
- Must be >=  the metric
[01;31mLooking for achievers for goal index 0, fact (data-sent data1) with fID 21[00m
 (transmit_data vehicle1 data1 wp1)
[01;34mFor limits: literal goal index 0, fact (data-sent data1), could be achieved by operator (transmit_data vehicle1 data1 wp1), which has other interesting effects (including one on (empty vehicle1) )[00m
[01;34mFor limits: literal goal index 1, fact (at vehicle1 wp0), is static or a precondition[00m
Action 12 - (find vehicle1 wp0 wp1) is uninteresting once we have fact (can-move wp0 wp1)
Action 13 - (find vehicle1 wp2 wp3) is uninteresting once we have fact (can-move wp2 wp3)
Action 14 - (find vehicle1 wp5 wp6) is uninteresting once we have fact (can-move wp5 wp6)
(G)88% of the ground temporal actions in this problem are compression-safe
(G)
; Adding 1.000 x makespan to the metric, i.e. adding 0.000

; Plan found with metric 0.000
; Theoretical reachable cost 0.000
; States evaluated so far: 1
; States pruned based on pre-heuristic cost lower bound: 0
; Time 0.00

 * All goal deadlines now no later than -0.000
; No plan can possibly improve on no plan at all
;;;; Solution Found
; States evaluated: 1
; Cost: 0.000
; Time 0.00
