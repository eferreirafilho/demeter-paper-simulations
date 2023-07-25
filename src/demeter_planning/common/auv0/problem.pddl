(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint2 waypoint3 waypoint17 - waypoint
    data3 - data
    currenttide - tide
    currentwaves - waves
    turbine3 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint2)
    (can-move waypoint2 waypoint3)
    (can-move waypoint3 waypoint17)

    (is-in data3 turbine3)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 73.97 (not (tide-low currenttide)))
    (at 473.98 (tide-low currenttide))
    (at 674.115 (not (tide-low currenttide)))
    (at 1074.26 (tide-low currenttide))
    (at 1274.36 (not (tide-low currenttide)))
    (at 1674.42 (tide-low currenttide))
    (at 1874.48 (not (tide-low currenttide)))
    (at 2274.61 (tide-low currenttide))
    (at 2474.68 (not (tide-low currenttide)))
    (at 2874.93 (tide-low currenttide))
    (at 3074.93 (not (tide-low currenttide)))


    (is-turbine-wp waypoint17 turbine3)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 2273.7 (not (not-high-waves currentwaves)))
    (at 2873.85 (not-high-waves currentwaves))
    (at 5873.98 (not (not-high-waves currentwaves)))
    (at 6474.1 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint2) 7.92)
    (= (traverse-cost waypoint2 waypoint3) 13.47)
    (= (traverse-cost waypoint3 waypoint17) 30.38)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data3)
))
)
