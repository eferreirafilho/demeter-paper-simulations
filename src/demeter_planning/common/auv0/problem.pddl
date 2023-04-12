(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint21 waypoint7 waypoint6 - waypoint
    data1 - data
    currenttide - tide
    turbine1 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint21)
    (can-move waypoint21 waypoint7)
    (can-move waypoint7 waypoint6)

    (is-in data1 turbine1)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint6 turbine1)

    (not-recharging vehicle0)


    (= (battery-amount vehicle0) 100)

    (= (recharge-rate vehicle0) 1)

    (= (recharge-rate-dedicated vehicle0) 100)

    (= (traverse-cost wp_init_auv0 waypoint21) 0.571)
    (= (traverse-cost waypoint21 waypoint7) 2.467)
    (= (traverse-cost waypoint7 waypoint6) 0.592)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 100000)

)
(:goal (and
    (data-sent data1)
))
)
