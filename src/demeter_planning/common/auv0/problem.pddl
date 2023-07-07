(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint2 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint2)
    (can-move waypoint2 waypoint12)

    (is-in data2 turbine2)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 118.67 (not (tide-low currenttide)))
    (at 358.695 (tide-low currenttide))
    (at 478.715 (not (tide-low currenttide)))
    (at 718.745 (tide-low currenttide))
    (at 838.765 (not (tide-low currenttide)))
    (at 1078.79 (tide-low currenttide))
    (at 1198.81 (not (tide-low currenttide)))
    (at 1438.83 (tide-low currenttide))
    (at 1558.86 (not (tide-low currenttide)))
    (at 1798.88 (tide-low currenttide))
    (at 1918.9 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint2) 6.32)
    (= (traverse-cost waypoint2 waypoint12) 41.72)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data2)
))
)
