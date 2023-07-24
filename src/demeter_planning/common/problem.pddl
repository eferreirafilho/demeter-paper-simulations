(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint46 waypoint50 - waypoint
    data12 - data
    currenttide - tide
    turbine12 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint46)
    (can-move waypoint46 waypoint50)

    (is-in data12 turbine12)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (not (tide-low currenttide))

    (at 357.68 (tide-low currenttide))
    (at 477.775 (not (tide-low currenttide)))
    (at 717.8 (tide-low currenttide))
    (at 837.97 (not (tide-low currenttide)))
    (at 1078.07 (tide-low currenttide))
    (at 1198.16 (not (tide-low currenttide)))
    (at 1438.24 (tide-low currenttide))
    (at 1558.31 (not (tide-low currenttide)))
    (at 1798.55 (tide-low currenttide))
    (at 1918.62 (not (tide-low currenttide)))


    (is-turbine-wp waypoint50 turbine12)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 1)

    (= (traverse-cost wp_init_auv0 waypoint46) 4.31)
    (= (traverse-cost waypoint46 waypoint50) 31)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data12)
))
    ; (:metric minimize (total-time))
)
