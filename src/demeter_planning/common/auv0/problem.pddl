(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint28 waypoint11 waypoint7 - waypoint
    data1 - data
    currenttide - tide
    turbine1 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint28)
    (can-move waypoint28 waypoint11)
    (can-move waypoint11 waypoint7)

    (is-in data1 turbine1)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint7 turbine1)

    (not-recharging vehicle0)



    (= (battery-level vehicle0) 79.7836)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint28) 2.075)
    (= (traverse-cost waypoint28 waypoint11) 38.195)
    (= (traverse-cost waypoint11 waypoint7) 4.765)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data1)
))
)
