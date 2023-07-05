(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint30 waypoint34 waypoint16 waypoint18 - waypoint
    data4 - data
    currenttide - tide
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint30)
    (can-move waypoint30 waypoint34)
    (can-move waypoint34 waypoint16)
    (can-move waypoint16 waypoint18)

    (is-in data4 turbine4)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 117.89 (not (tide-low currenttide)))
    (at 357.975 (tide-low currenttide))
    (at 478.02 (not (tide-low currenttide)))
    (at 718.185 (tide-low currenttide))
    (at 838.245 (not (tide-low currenttide)))
    (at 1078.31 (tide-low currenttide))
    (at 1198.38 (not (tide-low currenttide)))
    (at 1438.48 (tide-low currenttide))
    (at 1558.56 (not (tide-low currenttide)))
    (at 1798.64 (tide-low currenttide))
    (at 1918.72 (not (tide-low currenttide)))


    (is-turbine-wp waypoint18 turbine4)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint30) 10.71)
    (= (traverse-cost waypoint30 waypoint34) 31.54)
    (= (traverse-cost waypoint34 waypoint16) 33.98)
    (= (traverse-cost waypoint16 waypoint18) 28.2)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data4)
))
)
