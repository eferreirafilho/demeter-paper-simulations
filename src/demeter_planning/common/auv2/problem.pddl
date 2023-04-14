(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint12 waypoint17 - waypoint
    data3 - data
    currenttide - tide
    turbine3 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint12)
    (can-move waypoint12 waypoint17)

    (is-in data3 turbine3)



    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)


    (tide-low currenttide)


    (is-turbine-wp waypoint17 turbine3)

    (not-recharging vehicle2)


    (= (battery-level vehicle2) 20)

    (= (recharge-rate vehicle2) 0.01)

    (= (recharge-rate-dedicated vehicle2) 10)

    (= (traverse-cost wp_init_auv2 waypoint12) 0.122)
    (= (traverse-cost waypoint12 waypoint17) 2.149)

    (= (total-missions-completed vehicle2) 0)

    (= (speed vehicle2) 100)

)
(:goal (and
    (data-sent data3)
))
)
