(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint32 waypoint30 waypoint29 waypoint24 waypoint47 - waypoint
    data9 - data
    currenttide - tide
    turbine9 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint32)
    (can-move waypoint32 waypoint30)
    (can-move waypoint30 waypoint29)
    (can-move waypoint29 waypoint24)
    (can-move waypoint24 waypoint47)

    (is-in data9 turbine9)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 118.53 (not (tide-low currenttide)))
    (at 358.555 (tide-low currenttide))
    (at 478.585 (not (tide-low currenttide)))
    (at 718.61 (tide-low currenttide))
    (at 838.65 (not (tide-low currenttide)))
    (at 1078.67 (tide-low currenttide))
    (at 1198.72 (not (tide-low currenttide)))
    (at 1438.8 (tide-low currenttide))
    (at 1558.82 (not (tide-low currenttide)))
    (at 1798.85 (tide-low currenttide))
    (at 1918.87 (not (tide-low currenttide)))


    (is-turbine-wp waypoint47 turbine9)

    (idle vehicle1)


    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint32) 8.16)
    (= (traverse-cost waypoint32 waypoint30) 21.65)
    (= (traverse-cost waypoint30 waypoint29) 7.18)
    (= (traverse-cost waypoint29 waypoint24) 28.76)
    (= (traverse-cost waypoint24 waypoint47) 33.66)

    (= (speed vehicle1) 0.35)

)
(:goal (and
    (data-sent data9)
))
)
