Number of literals: 15
Constructing lookup tables:
Post filtering unreachable actions: 
No semaphore facts found, returning
[01;34mNo analytic limits found, not considering limit effects of goal-only operators[00m
[i] Not abstracting out TIL (not-high-waves currentwaves)
66% of the ground temporal actions in this problem are compression-safe
Initial heuristic = 9.000, admissible cost estimate 0.000
b (8.000 | 28.955)b (7.000 | 136.823)b (6.000 | 227.321)b (5.000 | 293.110)b (4.000 | 318.112)b (3.000 | 863.171)
Resorting to best-first search
Running WA* with W = 5.000, not restarting with goal states
b (8.000 | 28.955)b (7.000 | 136.823)b (6.000 | 227.321)b (5.000 | 293.110)b (4.000 | 318.112)b (2.000 | 934.642)b (1.000 | 936.642)(G)
; No metric specified - using makespan

; Plan found with metric 936.643
; States evaluated so far: 6691
; States pruned based on pre-heuristic cost lower bound: 0
; Time 5.76
0.000: (move vehicle1 wp_init_auv1 waypoint19)  [8.953]
8.954: (harvest-energy vehicle1)  [10.000]
18.955: (harvest-energy vehicle1)  [10.000]
28.956: (move vehicle1 waypoint19 waypoint42)  [47.861]
76.818: (harvest-energy vehicle1)  [10.000]
86.819: (harvest-energy vehicle1)  [10.000]
96.820: (harvest-energy vehicle1)  [10.000]
106.821: (harvest-energy vehicle1)  [10.000]
116.822: (harvest-energy vehicle1)  [10.000]
126.823: (harvest-energy vehicle1)  [10.000]
136.824: (move vehicle1 waypoint42 waypoint40)  [40.492]
177.317: (harvest-energy vehicle1)  [10.000]
187.318: (harvest-energy vehicle1)  [10.000]
197.319: (harvest-energy vehicle1)  [10.000]
207.320: (harvest-energy vehicle1)  [10.000]
217.321: (harvest-energy vehicle1)  [10.000]
227.322: (move vehicle1 waypoint40 waypoint72)  [25.784]
253.107: (harvest-energy vehicle1)  [10.000]
263.108: (harvest-energy vehicle1)  [10.000]
273.109: (harvest-energy vehicle1)  [10.000]
283.110: (harvest-energy vehicle1)  [10.000]
293.111: (localize-cable vehicle1 waypoint72 turbine14)  [15.000]
769.634: (harvest-energy vehicle1)  [10.000]
779.635: (retrieve-data vehicle1 data14 waypoint72 currenttide currentwaves turbine14)  [55.000]
834.636: (surface vehicle1)  [40.000]
874.637: (harvest-energy vehicle1)  [10.000]
884.638: (harvest-energy vehicle1)  [10.000]
894.639: (harvest-energy vehicle1)  [10.000]
904.640: (harvest-energy vehicle1)  [10.000]
914.641: (harvest-energy vehicle1)  [10.000]
924.642: (harvest-energy vehicle1)  [10.000]
934.643: (upload-data-histograms vehicle1 data14)  [2.000]

 * All goal deadlines now no later than 936.643
b (0.000 | 936.643)