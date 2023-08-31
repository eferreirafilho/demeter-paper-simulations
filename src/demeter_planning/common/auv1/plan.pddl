Number of literals: 18
Constructing lookup tables: [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
Post filtering unreachable actions:  [10%] [20%] [30%] [40%] [50%] [60%] [70%] [80%] [90%] [100%] [110%] [120%]
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
75% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 12.000, admissible cost estimate 0.000
b (11.000 | 31.909)b (10.000 | 105.221)b (9.000 | 136.270)b (8.000 | 240.523)b (7.000 | 349.206)b (6.000 | 457.074)b (5.000 | 565.511)b (4.000 | 590.513)b (3.000 | 1135.574)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (11.000 | 31.909)b (10.000 | 105.221)b (9.000 | 136.270)b (8.000 | 240.523)b (7.000 | 349.206)b (6.000 | 457.074)b (5.000 | 565.511)b (4.000 | 590.513)b (2.000 | 834.482)b (1.000 | 836.483)(G)
; No metric specified - using makespan

; Plan found with metric 836.483
; States evaluated so far: 8377
; States pruned based on pre-heuristic cost lower bound: 0
; Time 8.43
0.000: (move vehicle1 wp_init_auv1 waypoint32)  [11.907]
11.908: (harvest-energy vehicle1)  [10.000]
21.909: (harvest-energy vehicle1)  [10.000]
31.910: (move vehicle1 waypoint32 waypoint30)  [33.307]
65.218: (harvest-energy vehicle1)  [10.000]
75.219: (harvest-energy vehicle1)  [10.000]
85.220: (harvest-energy vehicle1)  [10.000]
95.221: (harvest-energy vehicle1)  [10.000]
105.222: (move vehicle1 waypoint30 waypoint29)  [11.046]
116.269: (harvest-energy vehicle1)  [10.000]
126.270: (harvest-energy vehicle1)  [10.000]
136.271: (move vehicle1 waypoint29 waypoint24)  [44.246]
180.518: (harvest-energy vehicle1)  [10.000]
190.519: (harvest-energy vehicle1)  [10.000]
200.520: (harvest-energy vehicle1)  [10.000]
210.521: (harvest-energy vehicle1)  [10.000]
220.522: (harvest-energy vehicle1)  [10.000]
230.523: (harvest-energy vehicle1)  [10.000]
240.524: (move vehicle1 waypoint24 waypoint19)  [48.676]
289.201: (harvest-energy vehicle1)  [10.000]
299.202: (harvest-energy vehicle1)  [10.000]
309.203: (harvest-energy vehicle1)  [10.000]
319.204: (harvest-energy vehicle1)  [10.000]
329.205: (harvest-energy vehicle1)  [10.000]
339.206: (harvest-energy vehicle1)  [10.000]
349.207: (move vehicle1 waypoint19 waypoint42)  [47.861]
397.069: (harvest-energy vehicle1)  [10.000]
407.070: (harvest-energy vehicle1)  [10.000]
417.071: (harvest-energy vehicle1)  [10.000]
427.072: (harvest-energy vehicle1)  [10.000]
437.073: (harvest-energy vehicle1)  [10.000]
447.074: (harvest-energy vehicle1)  [10.000]
457.075: (move vehicle1 waypoint42 waypoint37)  [48.430]
505.506: (harvest-energy vehicle1)  [10.000]
515.507: (harvest-energy vehicle1)  [10.000]
525.508: (harvest-energy vehicle1)  [10.000]
535.509: (harvest-energy vehicle1)  [10.000]
545.510: (harvest-energy vehicle1)  [10.000]
555.511: (harvest-energy vehicle1)  [10.000]
565.512: (localize-cable vehicle1 waypoint37 turbine7)  [15.000]
669.474: (harvest-energy vehicle1)  [10.000]
679.475: (retrieve-data vehicle1 data7 waypoint37 currenttide currentwaves turbine7)  [55.000]
734.476: (surface vehicle1)  [40.000]
774.477: (harvest-energy vehicle1)  [10.000]
784.478: (harvest-energy vehicle1)  [10.000]
794.479: (harvest-energy vehicle1)  [10.000]
804.480: (harvest-energy vehicle1)  [10.000]
814.481: (harvest-energy vehicle1)  [10.000]
824.482: (harvest-energy vehicle1)  [10.000]
834.483: (upload-data-histograms vehicle1 data7)  [2.000]

 * All goal deadlines now no later than 836.483
b (0.000 | 836.483)