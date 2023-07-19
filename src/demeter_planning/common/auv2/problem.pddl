(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint32 waypoint27 waypoint22 waypoint17 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint32)
    (can-move waypoint32 waypoint27)
    (can-move waypoint27 waypoint22)
    (can-move waypoint22 waypoint17)
    (can-move waypoint17 waypoint12)

    (is-in data2 turbine2)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (not (tide-low currenttide))

    (at 358.685 (tide-low currenttide))
    (at 478.705 (not (tide-low currenttide)))
    (at 718.725 (tide-low currenttide))
    (at 838.73 (not (tide-low currenttide)))
    (at 1078.76 (tide-low currenttide))
    (at 1198.77 (not (tide-low currenttide)))
    (at 1438.79 (tide-low currenttide))
    (at 1558.81 (not (tide-low currenttide)))
    (at 1798.87 (tide-low currenttide))
    (at 1918.89 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint32) 7.71)
    (= (traverse-cost waypoint32 waypoint27) 31.78)
    (= (traverse-cost waypoint27 waypoint22) 28.76)
    (= (traverse-cost waypoint22 waypoint17) 31.64)
    (= (traverse-cost waypoint17 waypoint12) 28.86)

    (= (speed vehicle2) 0.35)

)
(:goal (and
    (data-sent data2)
))
)
