(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint70 waypoint46 waypoint26 - waypoint
    data6 - data
    currenttide - tide
    turbine6 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint70)
    (can-move waypoint70 waypoint46)
    (can-move waypoint46 waypoint26)

    (is-in data6 turbine6)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint26 turbine6)

    (not-recharging vehicle0)



    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint70) 1.175)
    (= (traverse-cost waypoint70 waypoint46) 20.83)
    (= (traverse-cost waypoint46 waypoint26) 19.185)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data6)
))
)
