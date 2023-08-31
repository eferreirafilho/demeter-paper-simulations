(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint19 waypoint16 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    currentwaves - waves
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint19)
    (can-move waypoint19 waypoint16)
    (can-move waypoint16 waypoint12)

    (is-in data2 turbine2)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 48.215 (not (tide-low currenttide)))
    (at 448.285 (tide-low currenttide))
    (at 648.345 (not (tide-low currenttide)))
    (at 1048.39 (tide-low currenttide))
    (at 1248.44 (not (tide-low currenttide)))
    (at 1648.47 (tide-low currenttide))
    (at 1848.56 (not (tide-low currenttide)))
    (at 2248.63 (tide-low currenttide))
    (at 2448.68 (not (tide-low currenttide)))
    (at 2848.75 (tide-low currenttide))
    (at 3048.83 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 2848.18 (not (not-high-waves currentwaves)))
    (at 3448.23 (not-high-waves currentwaves))
    (at 6448.28 (not (not-high-waves currentwaves)))
    (at 7048.35 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 48.3318)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint19) 6.42)
    (= (traverse-cost waypoint19 waypoint16) 39.21)
    (= (traverse-cost waypoint16 waypoint12) 13.47)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data2)
))
)
