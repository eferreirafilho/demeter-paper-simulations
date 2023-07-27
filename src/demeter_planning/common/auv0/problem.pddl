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

    (at 134.965 (not (tide-low currenttide)))
    (at 535.01 (tide-low currenttide))
    (at 735.03 (not (tide-low currenttide)))
    (at 1135.09 (tide-low currenttide))
    (at 1335.12 (not (tide-low currenttide)))
    (at 1735.14 (tide-low currenttide))
    (at 1935.16 (not (tide-low currenttide)))
    (at 2335.18 (tide-low currenttide))
    (at 2535.21 (not (tide-low currenttide)))
    (at 2935.23 (tide-low currenttide))
    (at 3135.25 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 2934.95 (not (not-high-waves currentwaves)))
    (at 3534.97 (not-high-waves currentwaves))
    (at 6534.99 (not (not-high-waves currentwaves)))
    (at 7135.02 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint19) 6.43)
    (= (traverse-cost waypoint19 waypoint16) 39.21)
    (= (traverse-cost waypoint16 waypoint12) 13.47)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data2)
))
)
