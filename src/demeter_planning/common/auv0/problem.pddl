(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint27 waypoint28 waypoint57 - waypoint
    data11 - data
    currenttide - tide
    turbine11 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint27)
    (can-move waypoint27 waypoint28)
    (can-move waypoint28 waypoint57)

    (is-in data11 turbine11)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 118.45 (not (tide-low currenttide)))
    (at 358.505 (tide-low currenttide))
    (at 478.64 (not (tide-low currenttide)))
    (at 718.67 (tide-low currenttide))
    (at 838.705 (not (tide-low currenttide)))
    (at 1078.72 (tide-low currenttide))
    (at 1198.73 (not (tide-low currenttide)))
    (at 1438.76 (tide-low currenttide))
    (at 1558.78 (not (tide-low currenttide)))
    (at 1798.82 (tide-low currenttide))
    (at 1918.85 (not (tide-low currenttide)))


    (is-turbine-wp waypoint57 turbine11)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint27) 8.46)
    (= (traverse-cost waypoint27 waypoint28) 13.47)
    (= (traverse-cost waypoint28 waypoint57) 28.84)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data11)
))
)
