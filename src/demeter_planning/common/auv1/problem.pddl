(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint52 - waypoint
    data10 - data
    currenttide - tide
    currentwaves - waves
    turbine10 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint52)

    (is-in data10 turbine10)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (not (tide-low currenttide))

    (at 18.85 (tide-low currenttide))
    (at 178.91 (not (tide-low currenttide)))
    (at 498.93 (tide-low currenttide))
    (at 658.95 (not (tide-low currenttide)))
    (at 978.97 (tide-low currenttide))
    (at 1139 (not (tide-low currenttide)))
    (at 1459.05 (tide-low currenttide))
    (at 1619.06 (not (tide-low currenttide)))
    (at 1939.08 (tide-low currenttide))
    (at 2099.1 (not (tide-low currenttide)))


    (is-turbine-wp waypoint52 turbine10)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint52) 6.71)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data10)
))
)
