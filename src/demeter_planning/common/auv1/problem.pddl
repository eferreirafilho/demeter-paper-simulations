(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint27 waypoint22 - waypoint
    data4 - data
    currenttide - tide
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint27)
    (can-move waypoint27 waypoint22)

    (is-in data4 turbine4)



    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)


    (tide-low currenttide)


    (is-turbine-wp waypoint22 turbine4)

    (not-recharging vehicle1)


    (= (battery-amount vehicle1) 100)

    (= (recharge-rate vehicle1) 1)

    (= (recharge-rate-dedicated vehicle1) 100)

    (= (traverse-cost wp_init_auv1 waypoint27) 0.109)
    (= (traverse-cost waypoint27 waypoint22) 2.159)

    (= (total-missions-completed vehicle1) 0)

    (= (speed vehicle1) 100000)

)
(:goal (and
    (data-sent data4)
))
)
