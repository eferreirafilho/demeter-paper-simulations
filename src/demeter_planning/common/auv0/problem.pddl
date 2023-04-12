(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint2 waypoint3 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint2)
    (can-move waypoint2 waypoint3)
    (can-move waypoint3 waypoint12)

    (is-in data2 turbine2)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint12 turbine2)

    (not-recharging vehicle0)


    (= (battery-amount vehicle0) 20)

    (= (recharge-rate vehicle0) 0.01)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint2) 0.118)
    (= (traverse-cost waypoint2 waypoint3) 0.503)
    (= (traverse-cost waypoint3 waypoint12) 2.659)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 100)

)
(:goal (and
    (data-sent data2)
))
)
