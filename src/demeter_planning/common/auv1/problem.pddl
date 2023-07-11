(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint22 waypoint17 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint22)
    (can-move waypoint22 waypoint17)
    (can-move waypoint17 waypoint12)

    (is-in data2 turbine2)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 118.675 (not (tide-low currenttide)))
    (at 358.695 (tide-low currenttide))
    (at 478.72 (not (tide-low currenttide)))
    (at 718.735 (tide-low currenttide))
    (at 838.755 (not (tide-low currenttide)))
    (at 1078.78 (tide-low currenttide))
    (at 1198.83 (not (tide-low currenttide)))
    (at 1438.85 (tide-low currenttide))
    (at 1558.87 (not (tide-low currenttide)))
    (at 1798.88 (tide-low currenttide))
    (at 1918.91 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle1)


    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint22) 0.04)
    (= (traverse-cost waypoint22 waypoint17) 31.64)
    (= (traverse-cost waypoint17 waypoint12) 28.86)

    (= (speed vehicle1) 0.35)

)
(:goal (and
    (data-sent data2)
))
)
