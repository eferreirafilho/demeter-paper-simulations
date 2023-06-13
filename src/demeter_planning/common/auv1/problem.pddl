(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint54 waypoint30 waypoint10 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint54)
    (can-move waypoint54 waypoint30)
    (can-move waypoint30 waypoint10)

    (is-in data2 turbine2)



    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)


    (tide-low currenttide)


    (is-turbine-wp waypoint10 turbine2)

    (not-recharging vehicle1)



    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 10)

    (= (traverse-cost wp_init_auv1 waypoint54) 1.01)
    (= (traverse-cost waypoint54 waypoint30) 21.34)
    (= (traverse-cost waypoint30 waypoint10) 20.765)

    (= (total-missions-completed vehicle1) 0)

    (= (speed vehicle1) 0.3)

)
(:goal (and
    (data-sent data2)
))
)
