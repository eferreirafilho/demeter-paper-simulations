(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint32 waypoint30 waypoint29 waypoint24 waypoint47 - waypoint
    data9 - data
    currenttide - tide
    turbine9 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint32)
    (can-move waypoint32 waypoint30)
    (can-move waypoint30 waypoint29)
    (can-move waypoint29 waypoint24)
    (can-move waypoint24 waypoint47)

    (is-in data9 turbine9)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (not (tide-low currenttide))

    (at 358.61 (tide-low currenttide))
    (at 478.63 (not (tide-low currenttide)))
    (at 718.66 (tide-low currenttide))
    (at 838.68 (not (tide-low currenttide)))
    (at 1078.72 (tide-low currenttide))
    (at 1198.74 (not (tide-low currenttide)))
    (at 1438.76 (tide-low currenttide))
    (at 1558.77 (not (tide-low currenttide)))
    (at 1798.82 (tide-low currenttide))
    (at 1918.86 (not (tide-low currenttide)))


    (is-turbine-wp waypoint47 turbine9)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint32) 6.9)
    (= (traverse-cost waypoint32 waypoint30) 21.65)
    (= (traverse-cost waypoint30 waypoint29) 7.18)
    (= (traverse-cost waypoint29 waypoint24) 28.76)
    (= (traverse-cost waypoint24 waypoint47) 33.66)

    (= (speed vehicle2) 0.35)

)
(:goal (and
    (data-sent data9)
))
)
