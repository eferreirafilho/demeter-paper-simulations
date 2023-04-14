(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint22 waypoint27 - waypoint
    data5 - data
    currenttide - tide
    turbine5 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint22)
    (can-move waypoint22 waypoint27)

    (is-in data5 turbine5)



    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)


    (tide-low currenttide)


    (is-turbine-wp waypoint27 turbine5)

    (not-recharging vehicle2)



    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.01)

    (= (recharge-rate-dedicated vehicle2) 10)

    (= (traverse-cost wp_init_auv2 waypoint22) 0.56)
    (= (traverse-cost waypoint22 waypoint27) 10.795)

    (= (total-missions-completed vehicle2) 0)

    (= (speed vehicle2) 100)

)
(:goal (and
    (data-sent data5)
))
)
