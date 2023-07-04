(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint12 waypoint34 waypoint58 - waypoint
    data14 - data
    currenttide - tide
    turbine14 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint12)
    (can-move waypoint12 waypoint34)
    (can-move waypoint34 waypoint58)

    (is-in data14 turbine14)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (not (tide-low currenttide))

    (at 357.69 (tide-low currenttide))
    (at 477.81 (not (tide-low currenttide)))
    (at 717.905 (tide-low currenttide))
    (at 837.99 (not (tide-low currenttide)))
    (at 1078.11 (tide-low currenttide))
    (at 1198.21 (not (tide-low currenttide)))
    (at 1438.38 (tide-low currenttide))
    (at 1558.38 (not (tide-low currenttide)))
    (at 1798.51 (tide-low currenttide))
    (at 1918.71 (not (tide-low currenttide)))


    (is-turbine-wp waypoint58 turbine14)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint12) 10.81)
    (= (traverse-cost waypoint12 waypoint34) 21.4)
    (= (traverse-cost waypoint34 waypoint58) 43.41)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data14)
))
)
