(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint46 waypoint70 - waypoint
    data17 - data
    currenttide - tide
    turbine17 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint46)
    (can-move waypoint46 waypoint70)

    (is-in data17 turbine17)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint70 turbine17)

    (not-recharging vehicle0)



    (= (battery-level vehicle0) 74.7786)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint46) 0.96)
    (= (traverse-cost waypoint46 waypoint70) 20.83)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data17)
))
)
