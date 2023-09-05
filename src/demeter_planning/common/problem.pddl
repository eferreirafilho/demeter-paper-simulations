(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 waypoint6 waypoint7 waypoint8 waypoint9 waypoint10 waypoint11 waypoint12 waypoint13 waypoint14 waypoint15 waypoint16 waypoint17 waypoint18 waypoint19 waypoint20 - waypoint
    data0 data1 - data
    currenttide - tide
    currentwaves - waves
    turbine0 turbine1 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint2)
    (can-move waypoint2 waypoint1)
    (can-move waypoint1 waypoint6)
    (can-move waypoint6 waypoint1)

    (is-in data0 turbine0)
    (is-in data1 turbine1)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (not (tide-low currenttide))

    (at 297.305 (tide-low currenttide))
    (at 497.32 (not (tide-low currenttide)))
    (at 897.365 (tide-low currenttide))
    (at 1097.38 (not (tide-low currenttide)))
    (at 1497.4 (tide-low currenttide))
    (at 1697.42 (not (tide-low currenttide)))
    (at 2097.46 (tide-low currenttide))
    (at 2297.52 (not (tide-low currenttide)))
    (at 2697.56 (tide-low currenttide))
    (at 2897.59 (not (tide-low currenttide)))


    (is-turbine-wp waypoint1 turbine0)
    (is-turbine-wp waypoint6 turbine1)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 2697.14 (not (not-high-waves currentwaves)))
    (at 3297.18 (not-high-waves currentwaves))
    (at 6297.2 (not (not-high-waves currentwaves)))
    (at 6897.28 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint2) 18.86)
    (= (traverse-cost waypoint2 waypoint1) 28.04)
    (= (traverse-cost waypoint1 waypoint6) 80.88)
    (= (traverse-cost waypoint6 waypoint1) 80.88)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data0)
    (data-sent data1)
))
)
