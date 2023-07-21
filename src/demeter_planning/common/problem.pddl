(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint29 waypoint52 waypoint50 waypoint49 waypoint44 waypoint39 waypoint67 - waypoint
    data13 - data
    currenttide - tide
    currentwaves - waves
    turbine13 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint29)
    (can-move waypoint29 waypoint52)
    (can-move waypoint52 waypoint50)
    (can-move waypoint50 waypoint49)
    (can-move waypoint49 waypoint44)
    (can-move waypoint44 waypoint39)
    (can-move waypoint39 waypoint67)

    (is-in data13 turbine13)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)

    (empty vehicle1)

    (not (tide-low currenttide))

    (at 63.635 (tide-low currenttide))
    (at 183.695 (not (tide-low currenttide)))
    (at 423.725 (tide-low currenttide))

    (is-turbine-wp waypoint67 turbine13)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint29) 7.08)
    (= (traverse-cost waypoint29 waypoint52) 30.86)
    (= (traverse-cost waypoint52 waypoint50) 25.52)
    (= (traverse-cost waypoint50 waypoint49) 7.18)
    (= (traverse-cost waypoint49 waypoint44) 29.18)
    (= (traverse-cost waypoint44 waypoint39) 31.48)
    (= (traverse-cost waypoint39 waypoint67) 33.7)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data13)
))
)
