(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint28 waypoint22 waypoint17 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint28)
    (can-move waypoint28 waypoint22)
    (can-move waypoint22 waypoint17)
    (can-move waypoint17 waypoint12)

    (is-in data2 turbine2)



    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)


    (tide-low currenttide)


    (is-turbine-wp waypoint12 turbine2)

    (not-recharging vehicle2)



    (= (battery-level vehicle2) 99.1329)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 10)

    (= (traverse-cost wp_init_auv2 waypoint28) 4.155)
    (= (traverse-cost waypoint28 waypoint22) 14.285)
    (= (traverse-cost waypoint22 waypoint17) 15.24)
    (= (traverse-cost waypoint17 waypoint12) 13.87)

    (= (total-missions-completed vehicle2) 0)

    (= (speed vehicle2) 0.3)

)
(:goal (and
    (data-sent data2)
))
)
