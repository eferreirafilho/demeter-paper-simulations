(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint19 waypoint20 waypoint22 - waypoint
    data4 - data
    currenttide - tide
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint19)
    (can-move waypoint19 waypoint20)
    (can-move waypoint20 waypoint22)

    (is-in data4 turbine4)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 117.57 (not (tide-low currenttide)))
    (at 357.57 (tide-low currenttide))
    (at 477.715 (not (tide-low currenttide)))
    (at 717.75 (tide-low currenttide))
    (at 837.845 (not (tide-low currenttide)))
    (at 1077.99 (tide-low currenttide))
    (at 1198.03 (not (tide-low currenttide)))
    (at 1438.19 (tide-low currenttide))
    (at 1558.33 (not (tide-low currenttide)))
    (at 1798.47 (tide-low currenttide))
    (at 1918.52 (not (tide-low currenttide)))


    (is-turbine-wp waypoint22 turbine4)

    (idle vehicle0)


    (= (battery-level vehicle0) 71.7706)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint19) 6.41)
    (= (traverse-cost waypoint19 waypoint20) 7.18)
    (= (traverse-cost waypoint20 waypoint22) 26.07)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data4)
))
)
