(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint57 waypoint62 - waypoint
    data12 - data
    currenttide - tide
    turbine12 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint57)
    (can-move waypoint57 waypoint62)

    (is-in data12 turbine12)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 118.585 (not (tide-low currenttide)))
    (at 358.625 (tide-low currenttide))
    (at 478.65 (not (tide-low currenttide)))
    (at 718.69 (tide-low currenttide))
    (at 838.745 (not (tide-low currenttide)))
    (at 1078.78 (tide-low currenttide))
    (at 1198.8 (not (tide-low currenttide)))
    (at 1438.81 (tide-low currenttide))
    (at 1558.84 (not (tide-low currenttide)))
    (at 1798.87 (tide-low currenttide))
    (at 1918.89 (not (tide-low currenttide)))


    (is-turbine-wp waypoint62 turbine12)

    (idle vehicle1)


    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint57) 6.21)
    (= (traverse-cost waypoint57 waypoint62) 30.81)

    (= (speed vehicle1) 0.35)

)
(:goal (and
    (data-sent data12)
))
)
