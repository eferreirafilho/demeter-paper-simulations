(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint24 waypoint21 waypoint17 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    currentwaves - waves
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint24)
    (can-move waypoint24 waypoint21)
    (can-move waypoint21 waypoint17)
    (can-move waypoint17 waypoint12)

    (is-in data2 turbine2)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (not (tide-low currenttide))

    (at 313.065 (tide-low currenttide))
    (at 473.1 (not (tide-low currenttide)))
    (at 793.265 (tide-low currenttide))
    (at 953.405 (not (tide-low currenttide)))
    (at 1273.49 (tide-low currenttide))
    (at 1433.56 (not (tide-low currenttide)))
    (at 1753.74 (tide-low currenttide))
    (at 1913.75 (not (tide-low currenttide)))
    (at 2233.92 (tide-low currenttide))
    (at 2393.99 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 792.855 (not (not-high-waves currentwaves)))
    (at 1273.09 (not-high-waves currentwaves))
    (at 2233.22 (not (not-high-waves currentwaves)))
    (at 2713.25 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint24) 5.78)
    (= (traverse-cost waypoint24 waypoint21) 41.33)
    (= (traverse-cost waypoint21 waypoint17) 13.47)
    (= (traverse-cost waypoint17 waypoint12) 28.86)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data2)
))
)
