(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint14 waypoint18 waypoint22 - waypoint
    data5 - data
    currenttide - tide
    turbine5 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint14)
    (can-move waypoint14 waypoint18)
    (can-move waypoint18 waypoint22)

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

    (= (traverse-cost wp_init_auv2 waypoint14) 1.07)
    (= (traverse-cost waypoint14 waypoint18) 15.93)
    (= (traverse-cost waypoint18 waypoint22) 14.485)

    (= (total-missions-completed vehicle2) 0)

    (= (speed vehicle2) 0.3)

)
(:goal (and
    (data-sent data5)
))
)
