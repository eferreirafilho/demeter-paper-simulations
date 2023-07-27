(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint29 waypoint28 waypoint11 waypoint7 - waypoint
    data1 - data
    currenttide - tide
    currentwaves - waves
    turbine1 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint29)
    (can-move waypoint29 waypoint28)
    (can-move waypoint28 waypoint11)
    (can-move waypoint11 waypoint7)

    (is-in data1 turbine1)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 132.52 (not (tide-low currenttide)))
    (at 532.555 (tide-low currenttide))
    (at 732.575 (not (tide-low currenttide)))
    (at 1132.61 (tide-low currenttide))
    (at 1332.62 (not (tide-low currenttide)))
    (at 1732.64 (tide-low currenttide))
    (at 1932.66 (not (tide-low currenttide)))
    (at 2332.68 (tide-low currenttide))
    (at 2532.7 (not (tide-low currenttide)))
    (at 2932.72 (tide-low currenttide))
    (at 3132.76 (not (tide-low currenttide)))


    (is-turbine-wp waypoint7 turbine1)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 2932.49 (not (not-high-waves currentwaves)))
    (at 3532.51 (not-high-waves currentwaves))
    (at 6532.53 (not (not-high-waves currentwaves)))
    (at 7132.56 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint29) 7.07)
    (= (traverse-cost waypoint29 waypoint28) 19.79)
    (= (traverse-cost waypoint28 waypoint11) 59.27)
    (= (traverse-cost waypoint11 waypoint7) 13.47)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data1)
))
)
