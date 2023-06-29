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


    (tide-low currenttide)

    (at 65.4737 (not (tide-low currenttide)))
    (at 198.824 (tide-low currenttide))
    (at 265.499 (not (tide-low currenttide)))
    (at 398.842 (tide-low currenttide))
    (at 465.518 (not (tide-low currenttide)))
    (at 598.862 (tide-low currenttide))
    (at 665.539 (not (tide-low currenttide)))
    (at 798.882 (tide-low currenttide))
    (at 865.559 (not (tide-low currenttide)))
    (at 998.903 (tide-low currenttide))
    (at 1065.58 (not (tide-low currenttide)))


    (is-turbine-wp waypoint10 turbine2)

    (not-recharging vehicle0)

    (idle vehicle0)


    (= (battery-level vehicle0) 94.3424)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint22) 2.445)
    (= (traverse-cost waypoint22 waypoint18) 14.485)
    (= (traverse-cost waypoint18 waypoint14) 15.93)
    (= (traverse-cost waypoint14 waypoint10) 14.525)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data2)
))
)
