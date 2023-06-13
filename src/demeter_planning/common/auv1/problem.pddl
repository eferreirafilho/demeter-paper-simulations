(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint58 waypoint62 waypoint66 - waypoint
    data16 - data
    currenttide - tide
    turbine16 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint58)
    (can-move waypoint58 waypoint62)
    (can-move waypoint62 waypoint66)

    (is-in data16 turbine16)



    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)


    (tide-low currenttide)


    (is-turbine-wp waypoint66 turbine16)

    (not-recharging vehicle1)



    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 10)

    (= (traverse-cost wp_init_auv1 waypoint58) 1.14)
    (= (traverse-cost waypoint58 waypoint62) 16.68)
    (= (traverse-cost waypoint62 waypoint66) 14.63)

    (= (total-missions-completed vehicle1) 0)

    (= (speed vehicle1) 0.3)

)
(:goal (and
    (data-sent data16)
))
)
