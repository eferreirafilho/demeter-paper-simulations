(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint2 - waypoint
    data0 - data
    currenttide - tide
    currentwaves - waves
    turbine0 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint2)

    (is-in data0 turbine0)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (not (tide-low currenttide))

    (at 25.355 (tide-low currenttide))
    (at 185.385 (not (tide-low currenttide)))
    (at 505.43 (tide-low currenttide))
    (at 665.45 (not (tide-low currenttide)))
    (at 985.47 (tide-low currenttide))
    (at 1145.49 (not (tide-low currenttide)))
    (at 1465.54 (tide-low currenttide))
    (at 1625.57 (not (tide-low currenttide)))
    (at 1945.59 (tide-low currenttide))
    (at 2105.62 (not (tide-low currenttide)))


    (is-turbine-wp waypoint2 turbine0)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint2) 4.85)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data0)
))
)
