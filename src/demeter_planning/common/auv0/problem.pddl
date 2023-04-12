(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint1 waypoint2 waypoint16 - waypoint
    data3 - data
    currenttide - tide
    turbine3 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint1)
    (can-move waypoint1 waypoint2)
    (can-move waypoint2 waypoint16)

    (is-in data3 turbine3)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint16 turbine3)

    (not-recharging vehicle0)


    (= (battery-amount vehicle0) 100)

    (= (recharge-rate vehicle0) 1)

    (= (recharge-rate-dedicated vehicle0) 100)

    (= (traverse-cost wp_init_auv0 waypoint1) 0.124)
    (= (traverse-cost waypoint1 waypoint2) 0.646)
    (= (traverse-cost waypoint2 waypoint16) 2.776)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 100000)

)
(:goal (and
    (data-sent data3)
))
)
