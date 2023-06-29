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

    (at 65.4787 (not (tide-low currenttide)))
    (at 198.822 (tide-low currenttide))
    (at 265.498 (not (tide-low currenttide)))
    (at 398.84 (tide-low currenttide))
    (at 465.518 (not (tide-low currenttide)))
    (at 598.862 (tide-low currenttide))
    (at 665.539 (not (tide-low currenttide)))
    (at 798.881 (tide-low currenttide))
    (at 865.558 (not (tide-low currenttide)))
    (at 998.9 (tide-low currenttide))
    (at 1065.58 (not (tide-low currenttide)))


    (is-turbine-wp waypoint2 turbine0)

    (not-recharging vehicle0)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint10) 2.535)
    (= (traverse-cost waypoint10 waypoint2) 20.995)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data0)
))
)
