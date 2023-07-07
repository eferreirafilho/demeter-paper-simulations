(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint27 waypoint25 waypoint52 - waypoint
    data10 - data
    currenttide - tide
    turbine10 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint27)
    (can-move waypoint27 waypoint25)
    (can-move waypoint25 waypoint52)

    (is-in data10 turbine10)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (tide-low currenttide)

    (at 118.615 (not (tide-low currenttide)))
    (at 358.635 (tide-low currenttide))
    (at 478.655 (not (tide-low currenttide)))
    (at 718.69 (tide-low currenttide))
    (at 838.71 (not (tide-low currenttide)))
    (at 1078.74 (tide-low currenttide))
    (at 1198.78 (not (tide-low currenttide)))
    (at 1438.81 (tide-low currenttide))
    (at 1558.83 (not (tide-low currenttide)))
    (at 1798.85 (tide-low currenttide))
    (at 1918.88 (not (tide-low currenttide)))


    (is-turbine-wp waypoint52 turbine10)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint27) 8.08)
    (= (traverse-cost waypoint27 waypoint25) 25.86)
    (= (traverse-cost waypoint25 waypoint52) 15.52)

    (= (speed vehicle2) 0.35)

)
(:goal (and
    (data-sent data10)
))
)
