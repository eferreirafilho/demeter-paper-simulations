(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint18 waypoint19 waypoint42 - waypoint
    data10 - data
    currenttide - tide
    turbine10 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint18)
    (can-move waypoint18 waypoint19)
    (can-move waypoint19 waypoint42)

    (is-in data10 turbine10)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (not (tide-low currenttide))

    (at 58.7 (tide-low currenttide))
    (at 78.71 (not (tide-low currenttide)))
    (at 118.73 (tide-low currenttide))
    (at 138.745 (not (tide-low currenttide)))
    (at 178.765 (tide-low currenttide))
    (at 198.785 (not (tide-low currenttide)))
    (at 238.81 (tide-low currenttide))
    (at 258.83 (not (tide-low currenttide)))
    (at 298.84 (tide-low currenttide))
    (at 318.865 (not (tide-low currenttide)))


    (is-turbine-wp waypoint42 turbine10)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 10)

    (= (traverse-cost wp_init_auv2 waypoint18) 14.23)
    (= (traverse-cost waypoint18 waypoint19) 10.32)
    (= (traverse-cost waypoint19 waypoint42) 30.84)

    (= (speed vehicle2) 0.4)

)
(:goal (and
    (data-sent data10)
))
)
