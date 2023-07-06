(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint26 waypoint29 waypoint62 - waypoint
    data12 - data
    currenttide - tide
    turbine12 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint26)
    (can-move waypoint26 waypoint29)
    (can-move waypoint29 waypoint62)

    (is-in data12 turbine12)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (tide-low currenttide)

    (at 118.64 (not (tide-low currenttide)))
    (at 358.655 (tide-low currenttide))
    (at 478.67 (not (tide-low currenttide)))
    (at 718.695 (tide-low currenttide))
    (at 838.71 (not (tide-low currenttide)))
    (at 1078.76 (tide-low currenttide))
    (at 1198.79 (not (tide-low currenttide)))
    (at 1438.8 (tide-low currenttide))
    (at 1558.84 (not (tide-low currenttide)))
    (at 1798.87 (tide-low currenttide))
    (at 1918.89 (not (tide-low currenttide)))


    (is-turbine-wp waypoint62 turbine12)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint26) 8.69)
    (= (traverse-cost waypoint26 waypoint29) 38.43)
    (= (traverse-cost waypoint29 waypoint62) 32.88)

    (= (speed vehicle2) 0.35)

)
(:goal (and
    (data-sent data12)
))
)
