(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint26 waypoint27 waypoint32 - waypoint
    data6 - data
    currenttide - tide
    turbine6 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint26)
    (can-move waypoint26 waypoint27)
    (can-move waypoint27 waypoint32)

    (is-in data6 turbine6)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (tide-low currenttide)

    (at 118.625 (not (tide-low currenttide)))
    (at 358.645 (tide-low currenttide))
    (at 478.66 (not (tide-low currenttide)))
    (at 718.72 (tide-low currenttide))
    (at 838.77 (not (tide-low currenttide)))
    (at 1078.78 (tide-low currenttide))
    (at 1198.8 (not (tide-low currenttide)))
    (at 1438.83 (tide-low currenttide))
    (at 1558.86 (not (tide-low currenttide)))
    (at 1798.88 (tide-low currenttide))
    (at 1918.9 (not (tide-low currenttide)))


    (is-turbine-wp waypoint32 turbine6)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint26) 8.68)
    (= (traverse-cost waypoint26 waypoint27) 18.53)
    (= (traverse-cost waypoint27 waypoint32) 31.78)

    (= (speed vehicle2) 0.35)

)
(:goal (and
    (data-sent data6)
))
)
