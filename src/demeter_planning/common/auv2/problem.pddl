(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint22 - waypoint
    data4 - data
    currenttide - tide
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint22)

    (is-in data4 turbine4)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (tide-low currenttide)

    (at 118.715 (not (tide-low currenttide)))
    (at 358.72 (tide-low currenttide))
    (at 478.735 (not (tide-low currenttide)))
    (at 718.755 (tide-low currenttide))
    (at 838.79 (not (tide-low currenttide)))
    (at 1078.81 (tide-low currenttide))
    (at 1198.82 (not (tide-low currenttide)))
    (at 1438.85 (tide-low currenttide))
    (at 1558.86 (not (tide-low currenttide)))
    (at 1798.88 (tide-low currenttide))
    (at 1918.9 (not (tide-low currenttide)))


    (is-turbine-wp waypoint22 turbine4)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint22) 5.65)

    (= (speed vehicle2) 0.35)

)
(:goal (and
    (data-sent data4)
))
)
