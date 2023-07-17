(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint29 waypoint26 waypoint22 - waypoint
    data4 - data
    currenttide - tide
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint29)
    (can-move waypoint29 waypoint26)
    (can-move waypoint26 waypoint22)

    (is-in data4 turbine4)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 118.65 (not (tide-low currenttide)))
    (at 358.66 (tide-low currenttide))
    (at 478.68 (not (tide-low currenttide)))
    (at 718.69 (tide-low currenttide))
    (at 838.725 (not (tide-low currenttide)))
    (at 1078.74 (tide-low currenttide))
    (at 1198.76 (not (tide-low currenttide)))
    (at 1438.78 (tide-low currenttide))
    (at 1558.8 (not (tide-low currenttide)))
    (at 1798.83 (tide-low currenttide))
    (at 1918.85 (not (tide-low currenttide)))


    (is-turbine-wp waypoint22 turbine4)

    (idle vehicle1)


    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint29) 7.07)
    (= (traverse-cost waypoint29 waypoint26) 38.43)
    (= (traverse-cost waypoint26 waypoint22) 13.47)

    (= (speed vehicle1) 0.35)

)
(:goal (and
    (data-sent data4)
))
)
