(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint9 waypoint27 waypoint32 - waypoint
    data6 - data
    currenttide - tide
    currentwaves - waves
    turbine6 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint9)
    (can-move waypoint9 waypoint27)
    (can-move waypoint27 waypoint32)

    (is-in data6 turbine6)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 95.61 (not (tide-low currenttide)))
    (at 495.625 (tide-low currenttide))
    (at 695.645 (not (tide-low currenttide)))
    (at 1095.68 (tide-low currenttide))
    (at 1295.7 (not (tide-low currenttide)))
    (at 1695.74 (tide-low currenttide))
    (at 1895.79 (not (tide-low currenttide)))
    (at 2295.82 (tide-low currenttide))
    (at 2495.85 (not (tide-low currenttide)))
    (at 2895.88 (tide-low currenttide))
    (at 3095.9 (not (tide-low currenttide)))


    (is-turbine-wp waypoint32 turbine6)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 2295.59 (not (not-high-waves currentwaves)))
    (at 2895.62 (not-high-waves currentwaves))
    (at 5895.66 (not (not-high-waves currentwaves)))
    (at 6495.69 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint9) 7.61)
    (= (traverse-cost waypoint9 waypoint27) 32.24)
    (= (traverse-cost waypoint27 waypoint32) 31.78)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data6)
))
)
