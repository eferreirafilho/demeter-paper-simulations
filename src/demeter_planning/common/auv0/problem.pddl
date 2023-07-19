(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint19 waypoint16 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint19)
    (can-move waypoint19 waypoint16)
    (can-move waypoint16 waypoint12)

    (is-in data2 turbine2)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (not (tide-low currenttide))

    (at 358.72 (tide-low currenttide))
    (at 478.735 (not (tide-low currenttide)))
    (at 718.75 (tide-low currenttide))
    (at 838.775 (not (tide-low currenttide)))
    (at 1078.81 (tide-low currenttide))
    (at 1198.82 (not (tide-low currenttide)))
    (at 1438.85 (tide-low currenttide))
    (at 1558.86 (not (tide-low currenttide)))
    (at 1798.88 (tide-low currenttide))
    (at 1918.9 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint19) 6.42)
    (= (traverse-cost waypoint19 waypoint16) 39.21)
    (= (traverse-cost waypoint16 waypoint12) 13.47)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data2)
))
)
