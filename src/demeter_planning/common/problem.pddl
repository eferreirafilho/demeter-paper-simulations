(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint6 - waypoint
    data1 - data
    currenttide - tide
    turbine1 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint6)

    (is-in data1 turbine1)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 38.823 (not (tide-low currenttide)))
    (at 118.832 (tide-low currenttide))
    (at 158.843 (not (tide-low currenttide)))
    (at 238.851 (tide-low currenttide))
    (at 278.862 (not (tide-low currenttide)))
    (at 358.874 (tide-low currenttide))
    (at 398.883 (not (tide-low currenttide)))
    (at 478.892 (tide-low currenttide))
    (at 518.903 (not (tide-low currenttide)))
    (at 598.912 (tide-low currenttide))
    (at 638.925 (not (tide-low currenttide)))


    (is-turbine-wp waypoint6 turbine1)

    (not-recharging vehicle0)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint6) 0.005)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data1)
))
)
