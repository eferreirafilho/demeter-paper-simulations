(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint19 waypoint16 waypoint34 - waypoint
    data8 - data
    currenttide - tide
    turbine8 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint19)
    (can-move waypoint19 waypoint16)
    (can-move waypoint16 waypoint34)

    (is-in data8 turbine8)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (not (tide-low currenttide))

    (at 58.305 (tide-low currenttide))
    (at 78.335 (not (tide-low currenttide)))
    (at 118.34 (tide-low currenttide))
    (at 138.365 (not (tide-low currenttide)))
    (at 178.485 (tide-low currenttide))
    (at 198.53 (not (tide-low currenttide)))
    (at 238.58 (tide-low currenttide))
    (at 258.61 (not (tide-low currenttide)))
    (at 298.61 (tide-low currenttide))
    (at 318.76 (not (tide-low currenttide)))


    (is-turbine-wp waypoint34 turbine8)

    (idle vehicle1)


    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 10)

    (= (traverse-cost wp_init_auv1 waypoint19) 13.32)
    (= (traverse-cost waypoint19 waypoint16) 24.24)
    (= (traverse-cost waypoint16 waypoint34) 33.47)

    (= (speed vehicle1) 0.5)

)
(:goal (and
    (data-sent data8)
))
)
