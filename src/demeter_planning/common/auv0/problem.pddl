(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint24 waypoint23 waypoint22 - waypoint
    data4 - data
    currenttide - tide
    currentwaves - waves
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint24)
    (can-move waypoint24 waypoint23)
    (can-move waypoint23 waypoint22)

    (is-in data4 turbine4)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 94.49 (not (tide-low currenttide)))
    (at 494.555 (tide-low currenttide))
    (at 694.605 (not (tide-low currenttide)))
    (at 1094.68 (tide-low currenttide))
    (at 1294.73 (not (tide-low currenttide)))
    (at 1694.78 (tide-low currenttide))
    (at 1894.83 (not (tide-low currenttide)))
    (at 2294.9 (tide-low currenttide))
    (at 2495 (not (tide-low currenttide)))
    (at 2895.08 (tide-low currenttide))
    (at 3095.15 (not (tide-low currenttide)))


    (is-turbine-wp waypoint22 turbine4)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 494.425 (not (not-high-waves currentwaves)))
    (at 1094.49 (not-high-waves currentwaves))
    (at 4094.54 (not (not-high-waves currentwaves)))
    (at 4694.59 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint24) 5.95)
    (= (traverse-cost waypoint24 waypoint23) 19.79)
    (= (traverse-cost waypoint23 waypoint22) 13.47)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data4)
))
)
