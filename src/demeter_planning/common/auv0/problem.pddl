(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 waypoint6 waypoint7 waypoint8 waypoint9 waypoint10 waypoint11 waypoint12 waypoint13 waypoint14 waypoint15 waypoint16 waypoint17 waypoint18 waypoint19 waypoint20 - waypoint
    data0 - data
    currenttide - tide
    currentwaves - waves
    turbine0 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint2)
    (can-move waypoint2 waypoint1)

    (is-in data0 turbine0)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 159.905 (not (tide-low currenttide)))
    (at 559.945 (tide-low currenttide))
    (at 760.015 (not (tide-low currenttide)))
    (at 1160.05 (tide-low currenttide))
    (at 1360.13 (not (tide-low currenttide)))
    (at 1760.17 (tide-low currenttide))
    (at 1960.2 (not (tide-low currenttide)))
    (at 2360.24 (tide-low currenttide))
    (at 2560.28 (not (tide-low currenttide)))
    (at 2960.3 (tide-low currenttide))
    (at 3160.32 (not (tide-low currenttide)))


    (is-turbine-wp waypoint1 turbine0)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 2959.9 (not (not-high-waves currentwaves)))
    (at 3559.91 (not-high-waves currentwaves))
    (at 6559.94 (not (not-high-waves currentwaves)))
    (at 7159.99 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint2) 18.84)
    (= (traverse-cost waypoint2 waypoint1) 28.04)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data0)
))
)
