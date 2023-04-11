(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint16 waypoint11 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint16)
    (can-move waypoint16 waypoint11)

    (is-in data2 turbine2)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint11 turbine2)

    (not-recharging vehicle0)


    (= (battery-amount vehicle0) 100)

    (= (recharge-rate vehicle0) 1)

    (= (recharge-rate-dedicated vehicle0) 100)

    (= (traverse-cost wp_init_auv0 waypoint16) 0.134)
    (= (traverse-cost waypoint16 waypoint11) 3.182)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 100000)

)
(:goal (and
    (data-sent data2)
))
)
