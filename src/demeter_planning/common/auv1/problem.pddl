(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint32 - waypoint
    data6 - data
    currenttide - tide
    turbine6 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint32)

    (is-in data6 turbine6)



    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)


    (tide-low currenttide)


    (is-turbine-wp waypoint32 turbine6)

    (not-recharging vehicle1)



    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.01)

    (= (recharge-rate-dedicated vehicle1) 10)

    (= (traverse-cost wp_init_auv1 waypoint32) 0.61)

    (= (total-missions-completed vehicle1) 0)

    (= (speed vehicle1) 100)

)
(:goal (and
    (data-sent data6)
))
)
