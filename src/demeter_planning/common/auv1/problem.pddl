(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint21 waypoint7 waypoint6 - waypoint
    data1 - data
    currenttide - tide
    turbine1 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint21)
    (can-move waypoint21 waypoint7)
    (can-move waypoint7 waypoint6)

    (is-in data1 turbine1)



    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)


    (tide-low currenttide)


    (is-turbine-wp waypoint6 turbine1)

    (not-recharging vehicle1)


    (= (battery-amount vehicle1) 100)

    (= (recharge-rate vehicle1) 1)

    (= (recharge-rate-dedicated vehicle1) 100)

    (= (traverse-cost wp_init_auv1 waypoint21) 0.121)
    (= (traverse-cost waypoint21 waypoint7) 2.882)
    (= (traverse-cost waypoint7 waypoint6) 0.646)

    (= (total-missions-completed vehicle1) 0)

    (= (speed vehicle1) 100000)

)
(:goal (and
    (data-sent data1)
))
)
