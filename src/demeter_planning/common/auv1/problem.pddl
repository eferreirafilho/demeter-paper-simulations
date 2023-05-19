(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint2 - waypoint
    data0 - data
    currenttide - tide
    turbine0 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint2)

    (is-in data0 turbine0)



    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)


    (tide-low currenttide)


    (is-turbine-wp waypoint2 turbine0)

    (not-recharging vehicle1)



    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 10)

    (= (traverse-cost wp_init_auv1 waypoint2) 1.655)

    (= (total-missions-completed vehicle1) 0)

    (= (speed vehicle1) 0.3)

)
(:goal (and
    (data-sent data0)
))
)
