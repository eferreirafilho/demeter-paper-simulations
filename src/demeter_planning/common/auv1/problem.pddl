(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint29 waypoint26 waypoint22 - waypoint
    data5 - data
    currenttide - tide
    turbine5 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint29)
    (can-move waypoint29 waypoint26)
    (can-move waypoint26 waypoint22)

    (is-in data5 turbine5)



    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)


    (tide-low currenttide)


    (is-turbine-wp waypoint22 turbine5)

    (not-recharging vehicle1)


    (= (battery-amount vehicle1) 100)

    (= (recharge-rate vehicle1) 1)

    (= (recharge-rate-dedicated vehicle1) 100)

    (= (traverse-cost wp_init_auv1 waypoint29) 0.685)
    (= (traverse-cost waypoint29 waypoint26) 0.592)
    (= (traverse-cost waypoint26 waypoint22) 1.888)

    (= (total-missions-completed vehicle1) 0)

    (= (speed vehicle1) 100000)

)
(:goal (and
    (data-sent data5)
))
)
