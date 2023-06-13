(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint6 waypoint14 waypoint34 - waypoint
    data8 - data
    currenttide - tide
    turbine8 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint6)
    (can-move waypoint6 waypoint14)
    (can-move waypoint14 waypoint34)

    (is-in data8 turbine8)



    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)


    (tide-low currenttide)


    (is-turbine-wp waypoint34 turbine8)

    (not-recharging vehicle2)



    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 10)

    (= (traverse-cost wp_init_auv2 waypoint6) 1.275)
    (= (traverse-cost waypoint6 waypoint14) 22.285)
    (= (traverse-cost waypoint14 waypoint34) 19.885)

    (= (total-missions-completed vehicle2) 0)

    (= (speed vehicle2) 0.3)

)
(:goal (and
    (data-sent data8)
))
)
