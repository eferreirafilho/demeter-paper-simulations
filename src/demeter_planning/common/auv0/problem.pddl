(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint12 waypoint17 - waypoint
    data3 - data
    currenttide - tide
    turbine3 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint12)
    (can-move waypoint12 waypoint17)

    (is-in data3 turbine3)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint17 turbine3)

    (not-recharging vehicle0)


    (= (battery-amount vehicle0) 100)

    (= (recharge-rate vehicle0) 1)

    (= (recharge-rate-dedicated vehicle0) 100)

    (= (traverse-cost wp_init_auv0 waypoint12) 0.124)
    (= (traverse-cost waypoint12 waypoint17) 2.149)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 100000)

)
(:goal (and
    (data-sent data3)
))
)
