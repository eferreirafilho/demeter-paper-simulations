(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint17 waypoint22 waypoint27 waypoint32 - waypoint
    data6 - data
    currenttide - tide
    turbine6 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint17)
    (can-move waypoint17 waypoint22)
    (can-move waypoint22 waypoint27)
    (can-move waypoint27 waypoint32)

    (is-in data6 turbine6)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (tide-low currenttide)

    (at 118.71 (not (tide-low currenttide)))
    (at 358.725 (tide-low currenttide))
    (at 478.74 (not (tide-low currenttide)))
    (at 718.75 (tide-low currenttide))
    (at 838.775 (not (tide-low currenttide)))
    (at 1078.8 (tide-low currenttide))
    (at 1198.82 (not (tide-low currenttide)))
    (at 1438.85 (tide-low currenttide))
    (at 1558.87 (not (tide-low currenttide)))
    (at 1798.88 (tide-low currenttide))
    (at 1918.9 (not (tide-low currenttide)))


    (is-turbine-wp waypoint32 turbine6)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint17) 6.22)
    (= (traverse-cost waypoint17 waypoint22) 31.64)
    (= (traverse-cost waypoint22 waypoint27) 28.76)
    (= (traverse-cost waypoint27 waypoint32) 31.78)

    (= (speed vehicle2) 0.35)

)
(:goal (and
    (data-sent data6)
))
)
