(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint3 waypoint2 - waypoint
    data0 - data
    currenttide - tide
    turbine0 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint3)
    (can-move waypoint3 waypoint2)

    (is-in data0 turbine0)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint2 turbine0)

    (not-recharging vehicle0)



    (= (battery-level vehicle0) 89.2099)

    (= (recharge-rate vehicle0) 0.01)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint3) 0.01)
    (= (traverse-cost waypoint3 waypoint2) 2.515)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 100)

)
(:goal (and
    (data-sent data0)
))
)
