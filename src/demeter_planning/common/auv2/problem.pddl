(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint29 waypoint24 waypoint19 waypoint42 - waypoint
    data8 - data
    currenttide - tide
    turbine8 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint29)
    (can-move waypoint29 waypoint24)
    (can-move waypoint24 waypoint19)
    (can-move waypoint19 waypoint42)

    (is-in data8 turbine8)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (not (tide-low currenttide))

    (at 358.65 (tide-low currenttide))
    (at 478.675 (not (tide-low currenttide)))
    (at 718.695 (tide-low currenttide))
    (at 838.72 (not (tide-low currenttide)))
    (at 1078.74 (tide-low currenttide))
    (at 1198.77 (not (tide-low currenttide)))
    (at 1438.79 (tide-low currenttide))
    (at 1558.8 (not (tide-low currenttide)))
    (at 1798.87 (tide-low currenttide))
    (at 1918.88 (not (tide-low currenttide)))


    (is-turbine-wp waypoint42 turbine8)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint29) 6.67)
    (= (traverse-cost waypoint29 waypoint24) 28.76)
    (= (traverse-cost waypoint24 waypoint19) 31.64)
    (= (traverse-cost waypoint19 waypoint42) 31.11)

    (= (speed vehicle2) 0.35)

)
(:goal (and
    (data-sent data8)
))
)
