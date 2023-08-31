(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint37 waypoint42 waypoint47 waypoint52 waypoint57 - waypoint
    data11 - data
    currenttide - tide
    currentwaves - waves
    turbine11 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint37)
    (can-move waypoint37 waypoint42)
    (can-move waypoint42 waypoint47)
    (can-move waypoint47 waypoint52)
    (can-move waypoint52 waypoint57)

    (is-in data11 turbine11)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 94.39 (not (tide-low currenttide)))
    (at 494.45 (tide-low currenttide))
    (at 694.515 (not (tide-low currenttide)))
    (at 1094.61 (tide-low currenttide))
    (at 1294.65 (not (tide-low currenttide)))
    (at 1694.7 (tide-low currenttide))
    (at 1894.76 (not (tide-low currenttide)))
    (at 2294.84 (tide-low currenttide))
    (at 2494.89 (not (tide-low currenttide)))
    (at 2894.95 (tide-low currenttide))
    (at 3095.03 (not (tide-low currenttide)))


    (is-turbine-wp waypoint57 turbine11)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 494.35 (not (not-high-waves currentwaves)))
    (at 1094.39 (not-high-waves currentwaves))
    (at 4094.47 (not (not-high-waves currentwaves)))
    (at 4694.55 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint37) 7.02)
    (= (traverse-cost waypoint37 waypoint42) 31.48)
    (= (traverse-cost waypoint42 waypoint47) 29.18)
    (= (traverse-cost waypoint47 waypoint52) 32.27)
    (= (traverse-cost waypoint52 waypoint57) 28.44)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data11)
))
)
