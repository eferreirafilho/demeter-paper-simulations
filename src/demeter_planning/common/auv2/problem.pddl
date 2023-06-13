(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint38 waypoint20 waypoint22 - waypoint
    data5 - data
    currenttide - tide
    turbine5 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint38)
    (can-move waypoint38 waypoint20)
    (can-move waypoint20 waypoint22)

    (is-in data5 turbine5)



    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)


    (tide-low currenttide)


    (is-turbine-wp waypoint22 turbine5)

    (not-recharging vehicle2)



    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 10)

    (= (traverse-cost wp_init_auv2 waypoint38) 0.785)
    (= (traverse-cost waypoint38 waypoint20) 17.92)
    (= (traverse-cost waypoint20 waypoint22) 12.265)

    (= (total-missions-completed vehicle2) 0)

    (= (speed vehicle2) 0.3)

)
(:goal (and
    (data-sent data5)
))
)
