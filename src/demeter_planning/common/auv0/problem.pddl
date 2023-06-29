(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint6 waypoint7 waypoint18 - waypoint
    data4 - data
    currenttide - tide
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint6)
    (can-move waypoint6 waypoint7)
    (can-move waypoint7 waypoint18)

    (is-in data4 turbine4)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 38.8 (not (tide-low currenttide)))
    (at 118.811 (tide-low currenttide))
    (at 158.822 (not (tide-low currenttide)))
    (at 238.853 (tide-low currenttide))
    (at 278.861 (not (tide-low currenttide)))
    (at 358.873 (tide-low currenttide))
    (at 398.885 (not (tide-low currenttide)))
    (at 478.892 (tide-low currenttide))
    (at 518.9 (not (tide-low currenttide)))
    (at 598.911 (tide-low currenttide))
    (at 638.924 (not (tide-low currenttide)))


    (is-turbine-wp waypoint18 turbine4)

    (not-recharging vehicle0)

    (idle vehicle0)


    (= (battery-level vehicle0) 99.0019)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint6) 1.27)
    (= (traverse-cost waypoint6 waypoint7) 5.16)
    (= (traverse-cost waypoint7 waypoint18) 17.115)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data4)
))
)
