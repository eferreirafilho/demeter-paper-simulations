(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint9 waypoint4 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    currentwaves - waves
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint9)
    (can-move waypoint9 waypoint4)
    (can-move waypoint4 waypoint12)

    (is-in data2 turbine2)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 63.5 (not (tide-low currenttide)))
    (at 463.53 (tide-low currenttide))
    (at 663.635 (not (tide-low currenttide)))
    (at 1063.66 (tide-low currenttide))
    (at 1263.72 (not (tide-low currenttide)))
    (at 1663.74 (tide-low currenttide))
    (at 1863.8 (not (tide-low currenttide)))
    (at 2263.86 (tide-low currenttide))
    (at 2463.91 (not (tide-low currenttide)))
    (at 2863.95 (tide-low currenttide))
    (at 3064.01 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 1663.52 (not (not-high-waves currentwaves)))
    (at 2263.59 (not-high-waves currentwaves))
    (at 5263.61 (not (not-high-waves currentwaves)))
    (at 5863.64 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint9) 7.65)
    (= (traverse-cost waypoint9 waypoint4) 31.65)
    (= (traverse-cost waypoint4 waypoint12) 30.31)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data2)
))
)
