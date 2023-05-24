(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint47 waypoint77 - waypoint
    data15 - data
    currenttide - tide
    turbine15 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint47)
    (can-move waypoint47 waypoint77)

    (is-in data15 turbine15)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint77 turbine15)

    (not-recharging vehicle0)



    (= (battery-level vehicle0) 96.2881)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint47) 5.32)
    (= (traverse-cost waypoint47 waypoint77) 19.93)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data15)
))
)
