(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint7 waypoint8 waypoint23 waypoint52 - waypoint
    data10 - data
    currenttide - tide
    turbine10 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint7)
    (can-move waypoint7 waypoint8)
    (can-move waypoint8 waypoint23)
    (can-move waypoint23 waypoint52)

    (is-in data10 turbine10)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (tide-low currenttide)

    (at 118.31 (not (tide-low currenttide)))
    (at 358.36 (tide-low currenttide))
    (at 478.38 (not (tide-low currenttide)))
    (at 718.44 (tide-low currenttide))
    (at 838.52 (not (tide-low currenttide)))
    (at 1078.55 (tide-low currenttide))
    (at 1198.64 (not (tide-low currenttide)))
    (at 1438.66 (tide-low currenttide))
    (at 1558.75 (not (tide-low currenttide)))
    (at 1798.79 (tide-low currenttide))
    (at 1918.88 (not (tide-low currenttide)))


    (is-turbine-wp waypoint52 turbine10)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint7) 8.02)
    (= (traverse-cost waypoint7 waypoint8) 13.47)
    (= (traverse-cost waypoint8 waypoint23) 44.63)
    (= (traverse-cost waypoint23 waypoint52) 28.19)

    (= (speed vehicle2) 0.35)

)
(:goal (and
    (data-sent data10)
))
)
