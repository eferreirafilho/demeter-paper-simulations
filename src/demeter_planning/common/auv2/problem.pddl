(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint20 waypoint21 waypoint7 waypoint6 - waypoint
    data1 - data
    currenttide - tide
    turbine1 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint20)
    (can-move waypoint20 waypoint21)
    (can-move waypoint21 waypoint7)
    (can-move waypoint7 waypoint6)

    (is-in data1 turbine1)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (tide-low currenttide)

    (at 18.04 (not (tide-low currenttide)))
    (at 58.16 (tide-low currenttide))
    (at 78.19 (not (tide-low currenttide)))
    (at 118.315 (tide-low currenttide))
    (at 138.315 (not (tide-low currenttide)))
    (at 178.415 (tide-low currenttide))
    (at 198.445 (not (tide-low currenttide)))
    (at 238.57 (tide-low currenttide))
    (at 258.655 (not (tide-low currenttide)))
    (at 298.685 (tide-low currenttide))
    (at 318.685 (not (tide-low currenttide)))


    (is-turbine-wp waypoint6 turbine1)

    (idle vehicle2)


    (= (battery-level vehicle2) 78.1217)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 10)

    (= (traverse-cost wp_init_auv2 waypoint20) 5.88)
    (= (traverse-cost waypoint20 waypoint21) 10.32)
    (= (traverse-cost waypoint21 waypoint7) 43.36)
    (= (traverse-cost waypoint7 waypoint6) 10.32)

    (= (speed vehicle2) 0.5)

)
(:goal (and
    (data-sent data1)
))
)
