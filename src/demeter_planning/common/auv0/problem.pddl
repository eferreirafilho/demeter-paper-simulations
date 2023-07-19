(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint27 waypoint22 - waypoint
    data4 - data
    currenttide - tide
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint27)
    (can-move waypoint27 waypoint22)

    (is-in data4 turbine4)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 118.65 (not (tide-low currenttide)))
    (at 358.67 (tide-low currenttide))
    (at 478.69 (not (tide-low currenttide)))
    (at 718.705 (tide-low currenttide))
    (at 838.73 (not (tide-low currenttide)))
    (at 1078.76 (tide-low currenttide))
    (at 1198.78 (not (tide-low currenttide)))
    (at 1438.82 (tide-low currenttide))
    (at 1558.83 (not (tide-low currenttide)))
    (at 1798.86 (tide-low currenttide))
    (at 1918.88 (not (tide-low currenttide)))


    (is-turbine-wp waypoint22 turbine4)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint27) 7.77)
    (= (traverse-cost waypoint27 waypoint22) 28.76)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data4)
))
)
