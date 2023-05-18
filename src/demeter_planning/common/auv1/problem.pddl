(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint37 waypoint15 waypoint17 - waypoint
    data3 - data
    currenttide - tide
    turbine3 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint37)
    (can-move waypoint37 waypoint15)
    (can-move waypoint15 waypoint17)

    (is-in data3 turbine3)



    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)


    (tide-low currenttide)


    (is-turbine-wp waypoint17 turbine3)

    (not-recharging vehicle1)



    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 10)

    (= (traverse-cost wp_init_auv1 waypoint37) 1.28)
    (= (traverse-cost waypoint37 waypoint15) 23.35)
    (= (traverse-cost waypoint15 waypoint17) 13.225)

    (= (total-missions-completed vehicle1) 0)

    (= (speed vehicle1) 0.3)

)
(:goal (and
    (data-sent data3)
))
)
