(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint29 waypoint26 waypoint6 waypoint2 - waypoint
    data0 - data
    currenttide - tide
    currentwaves - waves
    turbine0 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint29)
    (can-move waypoint29 waypoint26)
    (can-move waypoint26 waypoint6)
    (can-move waypoint6 waypoint2)

    (is-in data0 turbine0)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 48.14 (not (tide-low currenttide)))
    (at 448.17 (tide-low currenttide))
    (at 648.23 (not (tide-low currenttide)))
    (at 1048.28 (tide-low currenttide))
    (at 1248.33 (not (tide-low currenttide)))
    (at 1648.36 (tide-low currenttide))
    (at 1848.4 (not (tide-low currenttide)))
    (at 2248.45 (tide-low currenttide))
    (at 2448.52 (not (tide-low currenttide)))
    (at 2848.57 (tide-low currenttide))
    (at 3048.63 (not (tide-low currenttide)))


    (is-turbine-wp waypoint2 turbine0)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 2848.09 (not (not-high-waves currentwaves)))
    (at 3448.13 (not-high-waves currentwaves))
    (at 6448.19 (not (not-high-waves currentwaves)))
    (at 7048.23 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 97.0116)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint29) 7.11)
    (= (traverse-cost waypoint29 waypoint26) 38.43)
    (= (traverse-cost waypoint26 waypoint6) 62.59)
    (= (traverse-cost waypoint6 waypoint2) 13.47)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data0)
))
)
