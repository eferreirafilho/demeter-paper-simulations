(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint2 waypoint10 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint2)
    (can-move waypoint2 waypoint10)

    (is-in data2 turbine2)



    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)


    (tide-low currenttide)


    (is-turbine-wp waypoint10 turbine2)

    (not-recharging vehicle2)



    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 10)

    (= (traverse-cost wp_init_auv2 waypoint2) 1.025)
    (= (traverse-cost waypoint2 waypoint10) 20.995)

    (= (speed vehicle2) 0.3)

)
(:goal (and
    (data-sent data2)
))
)
