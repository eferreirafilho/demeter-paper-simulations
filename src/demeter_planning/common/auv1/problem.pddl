(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint34 waypoint14 waypoint6 - waypoint
    data1 - data
    currenttide - tide
    turbine1 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint34)
    (can-move waypoint34 waypoint14)
    (can-move waypoint14 waypoint6)

    (is-in data1 turbine1)



    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)


    (tide-low currenttide)


    (is-turbine-wp waypoint6 turbine1)

    (not-recharging vehicle1)



    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 10)

    (= (traverse-cost wp_init_auv1 waypoint34) 1.015)
    (= (traverse-cost waypoint34 waypoint14) 19.885)
    (= (traverse-cost waypoint14 waypoint6) 22.285)

    (= (speed vehicle1) 0.3)

)
(:goal (and
    (data-sent data1)
))
)
