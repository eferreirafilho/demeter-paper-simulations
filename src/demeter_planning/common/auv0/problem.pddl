(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint4 waypoint22 waypoint26 waypoint29 waypoint62 - waypoint
    data12 - data
    currenttide - tide
    turbine12 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint4)
    (can-move waypoint4 waypoint22)
    (can-move waypoint22 waypoint26)
    (can-move waypoint26 waypoint29)
    (can-move waypoint29 waypoint62)

    (is-in data12 turbine12)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 118.715 (not (tide-low currenttide)))
    (at 358.73 (tide-low currenttide))
    (at 478.755 (not (tide-low currenttide)))
    (at 718.775 (tide-low currenttide))
    (at 838.785 (not (tide-low currenttide)))
    (at 1078.82 (tide-low currenttide))
    (at 1198.84 (not (tide-low currenttide)))
    (at 1438.85 (tide-low currenttide))
    (at 1558.87 (not (tide-low currenttide)))
    (at 1798.88 (tide-low currenttide))
    (at 1918.89 (not (tide-low currenttide)))


    (is-turbine-wp waypoint62 turbine12)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint4) 6.83)
    (= (traverse-cost waypoint4 waypoint22) 34.74)
    (= (traverse-cost waypoint22 waypoint26) 13.47)
    (= (traverse-cost waypoint26 waypoint29) 38.43)
    (= (traverse-cost waypoint29 waypoint62) 32.88)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data12)
))
)
