(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint17 - waypoint
    data3 - data
    currenttide - tide
    turbine3 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint17)

    (is-in data3 turbine3)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 118.695 (not (tide-low currenttide)))
    (at 358.71 (tide-low currenttide))
    (at 478.745 (not (tide-low currenttide)))
    (at 718.765 (tide-low currenttide))
    (at 838.78 (not (tide-low currenttide)))
    (at 1078.82 (tide-low currenttide))
    (at 1198.83 (not (tide-low currenttide)))
    (at 1438.86 (tide-low currenttide))
    (at 1558.88 (not (tide-low currenttide)))
    (at 1798.89 (tide-low currenttide))
    (at 1918.91 (not (tide-low currenttide)))


    (is-turbine-wp waypoint17 turbine3)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint17) 0.02)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data3)
))
)
