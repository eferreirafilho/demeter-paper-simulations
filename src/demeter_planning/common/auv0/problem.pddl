(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint7 - waypoint
    data1 - data
    currenttide - tide
    currentwaves - waves
    turbine1 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint7)

    (is-in data1 turbine1)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (not (tide-low currenttide))

    (at 21.13 (tide-low currenttide))
    (at 181.165 (not (tide-low currenttide)))
    (at 501.245 (tide-low currenttide))
    (at 661.26 (not (tide-low currenttide)))
    (at 981.28 (tide-low currenttide))
    (at 1141.3 (not (tide-low currenttide)))
    (at 1461.32 (tide-low currenttide))
    (at 1621.41 (not (tide-low currenttide)))
    (at 1941.43 (tide-low currenttide))
    (at 2101.46 (not (tide-low currenttide)))


    (is-turbine-wp waypoint7 turbine1)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint7) 4.94)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data1)
))
)
