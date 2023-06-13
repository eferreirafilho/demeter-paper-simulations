(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint18 waypoint38 - waypoint
    data9 - data
    currenttide - tide
    turbine9 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint18)
    (can-move waypoint18 waypoint38)

    (is-in data9 turbine9)



    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)


    (tide-low currenttide)


    (is-turbine-wp waypoint38 turbine9)

    (not-recharging vehicle2)



    (= (battery-level vehicle2) 74.9144)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 10)

    (= (traverse-cost wp_init_auv2 waypoint18) 7.115)
    (= (traverse-cost waypoint18 waypoint38) 20.68)

    (= (total-missions-completed vehicle2) 0)

    (= (speed vehicle2) 0.3)

)
(:goal (and
    (data-sent data9)
))
)
