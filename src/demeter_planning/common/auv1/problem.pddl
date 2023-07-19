(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint29 waypoint62 - waypoint
    data12 - data
    currenttide - tide
    turbine12 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint29)
    (can-move waypoint29 waypoint62)

    (is-in data12 turbine12)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 118.73 (not (tide-low currenttide)))
    (at 358.74 (tide-low currenttide))
    (at 478.755 (not (tide-low currenttide)))
    (at 718.77 (tide-low currenttide))
    (at 838.78 (not (tide-low currenttide)))
    (at 1078.81 (tide-low currenttide))
    (at 1198.83 (not (tide-low currenttide)))
    (at 1438.86 (tide-low currenttide))
    (at 1558.88 (not (tide-low currenttide)))
    (at 1798.89 (tide-low currenttide))
    (at 1918.9 (not (tide-low currenttide)))


    (is-turbine-wp waypoint62 turbine12)

    (idle vehicle1)


    (= (battery-level vehicle1) 98.4649)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint29) 7.07)
    (= (traverse-cost waypoint29 waypoint62) 32.88)

    (= (speed vehicle1) 0.35)

)
(:goal (and
    (data-sent data12)
))
)
