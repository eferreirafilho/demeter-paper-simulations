(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint29 waypoint26 waypoint22 waypoint17 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    currentwaves - waves
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint29)
    (can-move waypoint29 waypoint26)
    (can-move waypoint26 waypoint22)
    (can-move waypoint22 waypoint17)
    (can-move waypoint17 waypoint12)

    (is-in data2 turbine2)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (not (tide-low currenttide))

    (at 187.415 (tide-low currenttide))
    (at 387.435 (not (tide-low currenttide)))
    (at 787.455 (tide-low currenttide))
    (at 987.475 (not (tide-low currenttide)))
    (at 1387.49 (tide-low currenttide))
    (at 1587.53 (not (tide-low currenttide)))
    (at 1987.55 (tide-low currenttide))
    (at 2187.58 (not (tide-low currenttide)))
    (at 2587.61 (tide-low currenttide))
    (at 2787.64 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 2587.34 (not (not-high-waves currentwaves)))
    (at 3187.36 (not-high-waves currentwaves))
    (at 6187.4 (not (not-high-waves currentwaves)))
    (at 6787.42 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint29) 7.08)
    (= (traverse-cost waypoint29 waypoint26) 38.43)
    (= (traverse-cost waypoint26 waypoint22) 13.47)
    (= (traverse-cost waypoint22 waypoint17) 31.64)
    (= (traverse-cost waypoint17 waypoint12) 28.86)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data2)
))
)
