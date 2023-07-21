(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint27 - waypoint
    data5 - data
    currenttide - tide
    currentwaves - waves
    turbine5 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint27)

    (is-in data5 turbine5)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (not (tide-low currenttide))

    (at 27.65 (tide-low currenttide))
    (at 187.68 (not (tide-low currenttide)))
    (at 507.78 (tide-low currenttide))
    (at 667.8 (not (tide-low currenttide)))
    (at 987.83 (tide-low currenttide))
    (at 1147.87 (not (tide-low currenttide)))
    (at 1467.9 (tide-low currenttide))
    (at 1627.92 (not (tide-low currenttide)))
    (at 1947.93 (tide-low currenttide))
    (at 2108 (not (tide-low currenttide)))


    (is-turbine-wp waypoint27 turbine5)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint27) 6.8)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data5)
))
)
