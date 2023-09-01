(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    currentwaves - waves
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint12)

    (is-in data2 turbine2)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 1.15 (not (tide-low currenttide)))
    (at 601.17 (tide-low currenttide))
    (at 901.205 (not (tide-low currenttide)))
    (at 1501.23 (tide-low currenttide))
    (at 1801.26 (not (tide-low currenttide)))
    (at 2401.3 (tide-low currenttide))
    (at 2701.32 (not (tide-low currenttide)))
    (at 3301.36 (tide-low currenttide))
    (at 3601.38 (not (tide-low currenttide)))
    (at 4201.4 (tide-low currenttide))
    (at 4501.43 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 3301.12 (not (not-high-waves currentwaves)))
    (at 4201.16 (not-high-waves currentwaves))
    (at 8701.19 (not (not-high-waves currentwaves)))
    (at 9601.2 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint12) 8.36)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data2)
))
)
