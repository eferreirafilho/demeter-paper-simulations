(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint18 waypoint14 waypoint10 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint18)
    (can-move waypoint18 waypoint14)
    (can-move waypoint14 waypoint10)

    (is-in data2 turbine2)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint10 turbine2)

    (not-recharging vehicle0)



    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint18) 1.115)
    (= (traverse-cost waypoint18 waypoint14) 15.93)
    (= (traverse-cost waypoint14 waypoint10) 14.525)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data2)
))
)
