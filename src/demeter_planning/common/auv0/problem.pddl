(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint52 waypoint50 waypoint49 waypoint44 waypoint39 waypoint67 - waypoint
    data13 - data
    currenttide - tide
    turbine13 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint52)
    (can-move waypoint52 waypoint50)
    (can-move waypoint50 waypoint49)
    (can-move waypoint49 waypoint44)
    (can-move waypoint44 waypoint39)
    (can-move waypoint39 waypoint67)

    (is-in data13 turbine13)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 118.645 (not (tide-low currenttide)))
    (at 358.675 (tide-low currenttide))
    (at 478.695 (not (tide-low currenttide)))
    (at 718.715 (tide-low currenttide))
    (at 838.745 (not (tide-low currenttide)))
    (at 1078.76 (tide-low currenttide))
    (at 1198.77 (not (tide-low currenttide)))
    (at 1438.79 (tide-low currenttide))
    (at 1558.81 (not (tide-low currenttide)))
    (at 1798.85 (tide-low currenttide))
    (at 1918.88 (not (tide-low currenttide)))


    (is-turbine-wp waypoint67 turbine13)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint52) 6.2)
    (= (traverse-cost waypoint52 waypoint50) 25.52)
    (= (traverse-cost waypoint50 waypoint49) 7.18)
    (= (traverse-cost waypoint49 waypoint44) 29.18)
    (= (traverse-cost waypoint44 waypoint39) 31.48)
    (= (traverse-cost waypoint39 waypoint67) 33.7)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data13)
))
)
