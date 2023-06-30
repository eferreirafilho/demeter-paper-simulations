(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint16 waypoint17 waypoint3 waypoint2 - waypoint
    data0 - data
    currenttide - tide
    turbine0 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint16)
    (can-move waypoint16 waypoint17)
    (can-move waypoint17 waypoint3)
    (can-move waypoint3 waypoint2)

    (is-in data0 turbine0)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (not (tide-low currenttide))

    (at 500 (tide-low currenttide))
    (at 700 (not (tide-low currenttide)))


    (is-turbine-wp waypoint2 turbine0)


    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint16) 0.55)
    (= (traverse-cost waypoint16 waypoint17) 5.16)
    (= (traverse-cost waypoint17 waypoint3) 21.11)
    (= (traverse-cost waypoint3 waypoint2) 5.16)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data0)
    ; (at vehicle0 wp_init_auv0)
    
))
)
