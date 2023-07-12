(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint14 waypoint13 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint14)
    (can-move waypoint14 waypoint13)
    (can-move waypoint13 waypoint12)

    (is-in data2 turbine2)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 118.1 (not (tide-low currenttide)))
    (at 358.1 (tide-low currenttide))
    (at 478.27 (not (tide-low currenttide)))
    (at 718.305 (tide-low currenttide))
    (at 838.345 (not (tide-low currenttide)))
    (at 1078.4 (tide-low currenttide))
    (at 1198.44 (not (tide-low currenttide)))
    (at 1438.51 (tide-low currenttide))
    (at 1558.56 (not (tide-low currenttide)))
    (at 1798.62 (tide-low currenttide))
    (at 1918.73 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle1)


    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint14) 6.18)
    (= (traverse-cost waypoint14 waypoint13) 19.79)
    (= (traverse-cost waypoint13 waypoint12) 13.47)

    (= (speed vehicle1) 0.35)

)
(:goal (and
    (data-sent data2)
))
)
