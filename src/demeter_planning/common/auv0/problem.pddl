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

    (at 284.045 (not (tide-low currenttide)))
    (at 884.07 (tide-low currenttide))
    (at 1184.09 (not (tide-low currenttide)))
    (at 1784.11 (tide-low currenttide))
    (at 2084.13 (not (tide-low currenttide)))
    (at 2684.16 (tide-low currenttide))
    (at 2984.2 (not (tide-low currenttide)))
    (at 3584.22 (tide-low currenttide))
    (at 3884.24 (not (tide-low currenttide)))
    (at 4484.29 (tide-low currenttide))
    (at 4784.32 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 4484.02 (not (not-high-waves currentwaves)))
    (at 5384.04 (not-high-waves currentwaves))
    (at 9884.08 (not (not-high-waves currentwaves)))
    (at 10784.1 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint19) 6.38)
    (= (traverse-cost waypoint19 waypoint16) 39.21)
    (= (traverse-cost waypoint16 waypoint12) 13.47)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data2)
))
)
