(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint14 waypoint42 - waypoint
    data8 - data
    currenttide - tide
    currentwaves - waves
    turbine8 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint14)
    (can-move waypoint14 waypoint42)

    (is-in data8 turbine8)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 42.725 (not (tide-low currenttide)))
    (at 362.755 (tide-low currenttide))
    (at 522.775 (not (tide-low currenttide)))
    (at 842.81 (tide-low currenttide))
    (at 1002.84 (not (tide-low currenttide)))
    (at 1322.85 (tide-low currenttide))
    (at 1482.88 (not (tide-low currenttide)))
    (at 1802.91 (tide-low currenttide))
    (at 1962.92 (not (tide-low currenttide)))
    (at 2282.95 (tide-low currenttide))
    (at 2442.96 (not (tide-low currenttide)))


    (is-turbine-wp waypoint42 turbine8)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 362.7 (not (not-high-waves currentwaves)))
    (at 842.72 (not-high-waves currentwaves))
    (at 1802.74 (not (not-high-waves currentwaves)))
    (at 2282.76 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint14) 6.27)
    (= (traverse-cost waypoint14 waypoint42) 9.14)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data8)
))
)
