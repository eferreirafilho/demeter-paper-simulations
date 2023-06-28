(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint10 waypoint2 - waypoint
    data0 - data
    currenttide - tide
    turbine0 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint10)
    (can-move waypoint10 waypoint2)

    (is-in data0 turbine0)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)

    (at 64.8717 (not (tide-low currenttide)))
    (at 198.255 (tide-low currenttide))
    (at 264.987 (not (tide-low currenttide)))
    (at 398.38 (tide-low currenttide))
    (at 465.097 (not (tide-low currenttide)))
    (at 598.475 (tide-low currenttide))
    (at 665.192 (not (tide-low currenttide)))
    (at 798.595 (tide-low currenttide))
    (at 865.342 (not (tide-low currenttide)))
    (at 998.73 (tide-low currenttide))
    (at 1065.45 (not (tide-low currenttide)))


    (is-turbine-wp waypoint2 turbine0)

    (not-recharging vehicle0)

    (idle vehicle0)


    (= (battery-level vehicle0) 77.5276)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint10) 2.33)
    (= (traverse-cost waypoint10 waypoint2) 20.995)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data0)
))
)
