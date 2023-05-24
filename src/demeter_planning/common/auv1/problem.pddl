(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint61 waypoint57 waypoint52 waypoint49 waypoint44 waypoint72 - waypoint
    data14 - data
    currenttide - tide
    turbine14 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint61)
    (can-move waypoint61 waypoint57)
    (can-move waypoint57 waypoint52)
    (can-move waypoint52 waypoint49)
    (can-move waypoint49 waypoint44)
    (can-move waypoint44 waypoint72)

    (is-in data14 turbine14)



    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)


    (tide-low currenttide)


    (is-turbine-wp waypoint72 turbine14)

    (not-recharging vehicle1)



    (= (battery-level vehicle1) 98.9826)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 10)

    (= (traverse-cost wp_init_auv1 waypoint61) 1.52)
    (= (traverse-cost waypoint61 waypoint57) 3.32)
    (= (traverse-cost waypoint57 waypoint52) 13.695)
    (= (traverse-cost waypoint52 waypoint49) 14.12)
    (= (traverse-cost waypoint49 waypoint44) 14.005)
    (= (traverse-cost waypoint44 waypoint72) 17.65)

    (= (total-missions-completed vehicle1) 0)

    (= (speed vehicle1) 0.3)

)
(:goal (and
    (data-sent data14)
))
)
