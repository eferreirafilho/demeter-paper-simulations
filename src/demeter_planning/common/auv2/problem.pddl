(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint19 waypoint52 - waypoint
    data10 - data
    currenttide - tide
    turbine10 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint19)
    (can-move waypoint19 waypoint52)

    (is-in data10 turbine10)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (tide-low currenttide)

    (at 118.685 (not (tide-low currenttide)))
    (at 358.72 (tide-low currenttide))
    (at 478.735 (not (tide-low currenttide)))
    (at 718.75 (tide-low currenttide))
    (at 838.77 (not (tide-low currenttide)))
    (at 1078.79 (tide-low currenttide))
    (at 1198.8 (not (tide-low currenttide)))
    (at 1438.81 (tide-low currenttide))
    (at 1558.83 (not (tide-low currenttide)))
    (at 1798.85 (tide-low currenttide))
    (at 1918.87 (not (tide-low currenttide)))


    (is-turbine-wp waypoint52 turbine10)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint19) 5.88)
    (= (traverse-cost waypoint19 waypoint52) 33.16)

    (= (speed vehicle2) 0.35)

)
(:goal (and
    (data-sent data10)
))
)
