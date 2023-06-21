(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint22 waypoint42 - waypoint
    data10 - data
    currenttide - tide
    turbine10 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint22)
    (can-move waypoint22 waypoint42)

    (is-in data10 turbine10)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint42 turbine10)

    (not-recharging vehicle0)



    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint22) 1.26)
    (= (traverse-cost waypoint22 waypoint42) 20.805)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data10)
))
)
