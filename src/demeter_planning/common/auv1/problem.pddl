(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint32 waypoint27 - waypoint
    data5 - data
    currenttide - tide
    turbine5 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint32)
    (can-move waypoint32 waypoint27)

    (is-in data5 turbine5)



    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)


    (tide-low currenttide)


    (is-turbine-wp waypoint27 turbine5)

    (not-recharging vehicle1)



    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.01)

    (= (recharge-rate-dedicated vehicle1) 10)

    (= (traverse-cost wp_init_auv1 waypoint32) 1.115)
    (= (traverse-cost waypoint32 waypoint27) 11.315)

    (= (total-missions-completed vehicle1) 0)

    (= (speed vehicle1) 100)

)
(:goal (and
    (data-sent data5)
))
)
