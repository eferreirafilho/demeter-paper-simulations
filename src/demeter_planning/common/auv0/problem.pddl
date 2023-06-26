(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint22 waypoint18 waypoint14 waypoint10 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint22)
    (can-move waypoint22 waypoint18)
    (can-move waypoint18 waypoint14)
    (can-move waypoint14 waypoint10)

    (is-in data2 turbine2)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (not (tide-low currenttide))

    (at 1416.91 (tide-low currenttide))
    (at 1431.21 (not (tide-low currenttide)))
    (at 1497.88 (tide-low currenttide))
    (at 1531.24 (not (tide-low currenttide)))
    (at 1597.92 (tide-low currenttide))
    (at 1631.26 (not (tide-low currenttide)))
    (at 1697.93 (tide-low currenttide))
    (at 1731.27 (not (tide-low currenttide)))
    (at 1797.95 (tide-low currenttide))
    (at 1831.3 (not (tide-low currenttide)))


    (is-turbine-wp waypoint10 turbine2)

    (not-recharging vehicle0)

    (idle vehicle0)


    (= (battery-level vehicle0) 98.5307)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint22) 1.145)
    (= (traverse-cost waypoint22 waypoint18) 14.485)
    (= (traverse-cost waypoint18 waypoint14) 15.93)
    (= (traverse-cost waypoint14 waypoint10) 14.525)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data2)
))
)
