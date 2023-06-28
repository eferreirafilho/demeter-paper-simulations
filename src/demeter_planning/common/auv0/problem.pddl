(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint14 waypoint34 - waypoint
    data8 - data
    currenttide - tide
    turbine8 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint14)
    (can-move waypoint14 waypoint34)

    (is-in data8 turbine8)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)

    (at 65.4577 (not (tide-low currenttide)))
    (at 198.812 (tide-low currenttide))
    (at 265.489 (not (tide-low currenttide)))
    (at 398.832 (tide-low currenttide))
    (at 465.511 (not (tide-low currenttide)))
    (at 598.852 (tide-low currenttide))
    (at 665.53 (not (tide-low currenttide)))
    (at 798.872 (tide-low currenttide))
    (at 865.549 (not (tide-low currenttide)))
    (at 998.892 (tide-low currenttide))
    (at 1065.57 (not (tide-low currenttide)))


    (is-turbine-wp waypoint34 turbine8)

    (not-recharging vehicle0)

    (idle vehicle0)


    (= (battery-level vehicle0) 92.1508)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint14) 1.335)
    (= (traverse-cost waypoint14 waypoint34) 19.885)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data8)
))
)
