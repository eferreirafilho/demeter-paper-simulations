(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint12 waypoint17 waypoint22 waypoint27 waypoint32 - waypoint
    data6 - data
    currenttide - tide
    turbine6 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint12)
    (can-move waypoint12 waypoint17)
    (can-move waypoint17 waypoint22)
    (can-move waypoint22 waypoint27)
    (can-move waypoint27 waypoint32)

    (is-in data6 turbine6)



    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)


    (tide-low currenttide)


    (is-turbine-wp waypoint32 turbine6)

    (not-recharging vehicle2)



    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 10)

    (= (traverse-cost wp_init_auv2 waypoint12) 1.295)
    (= (traverse-cost waypoint12 waypoint17) 18.09)
    (= (traverse-cost waypoint17 waypoint22) 19.82)
    (= (traverse-cost waypoint22 waypoint27) 18)
    (= (traverse-cost waypoint27 waypoint32) 20.01)

    (= (total-missions-completed vehicle2) 0)

    (= (speed vehicle2) 0.3)

)
(:goal (and
    (data-sent data6)
))
)
