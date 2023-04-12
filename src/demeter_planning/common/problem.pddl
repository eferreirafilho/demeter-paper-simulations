(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint17 waypoint22 - waypoint
    data4 - data
    currenttide - tide
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint17)
    (can-move waypoint17 waypoint22)

    (is-in data4 turbine4)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint22 turbine4)

    (not-recharging vehicle0)


    (= (battery-amount vehicle0) 20)

    (= (recharge-rate vehicle0) 0)

    (= (recharge-rate-dedicated vehicle0) 100)

    (= (traverse-cost wp_init_auv0 waypoint17) 0.001)
    (= (traverse-cost waypoint17 waypoint22) 2.362)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 100)

)
(:goal (and
    (data-sent data4)
))
)
