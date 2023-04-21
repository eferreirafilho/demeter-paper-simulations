(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint12 waypoint17 waypoint22 - waypoint
    data4 - data
    currenttide - tide
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint12)
    (can-move waypoint12 waypoint17)
    (can-move waypoint17 waypoint22)

    (is-in data4 turbine4)



    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)


    (tide-low currenttide)


    (is-turbine-wp waypoint22 turbine4)

    (not-recharging vehicle2)



    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.01)

    (= (recharge-rate-dedicated vehicle2) 10)

    (= (traverse-cost wp_init_auv2 waypoint12) 1.175)
    (= (traverse-cost waypoint12 waypoint17) 10.575)
    (= (traverse-cost waypoint17 waypoint22) 11.625)

    (= (total-missions-completed vehicle2) 0)

    (= (speed vehicle2) 100)

)
(:goal (and
    (data-sent data4)
))
)
