(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint26 waypoint6 waypoint2 - waypoint
    data0 - data
    currenttide - tide
    turbine0 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint26)
    (can-move waypoint26 waypoint6)
    (can-move waypoint6 waypoint2)

    (is-in data0 turbine0)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (not (tide-low currenttide))

    (at 358.33 (tide-low currenttide))
    (at 478.4 (not (tide-low currenttide)))
    (at 718.43 (tide-low currenttide))
    (at 838.46 (not (tide-low currenttide)))
    (at 1078.49 (tide-low currenttide))
    (at 1198.53 (not (tide-low currenttide)))
    (at 1438.63 (tide-low currenttide))
    (at 1558.66 (not (tide-low currenttide)))
    (at 1798.69 (tide-low currenttide))
    (at 1918.74 (not (tide-low currenttide)))


    (is-turbine-wp waypoint2 turbine0)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint26) 8.64)
    (= (traverse-cost waypoint26 waypoint6) 62.59)
    (= (traverse-cost waypoint6 waypoint2) 13.47)

    (= (speed vehicle2) 0.35)

)
(:goal (and
    (data-sent data0)
))
)
