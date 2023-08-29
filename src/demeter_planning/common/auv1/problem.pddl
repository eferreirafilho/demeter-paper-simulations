(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint19 waypoint52 - waypoint
    data10 - data
    currenttide - tide
    currentwaves - waves
    turbine10 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint19)
    (can-move waypoint19 waypoint52)

    (is-in data10 turbine10)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 95.795 (not (tide-low currenttide)))
    (at 495.83 (tide-low currenttide))
    (at 695.845 (not (tide-low currenttide)))
    (at 1095.88 (tide-low currenttide))
    (at 1295.94 (not (tide-low currenttide)))
    (at 1696.02 (tide-low currenttide))
    (at 1896.07 (not (tide-low currenttide)))
    (at 2296.11 (tide-low currenttide))
    (at 2496.16 (not (tide-low currenttide)))
    (at 2896.2 (tide-low currenttide))
    (at 3096.23 (not (tide-low currenttide)))


    (is-turbine-wp waypoint52 turbine10)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 1695.8 (not (not-high-waves currentwaves)))
    (at 2295.86 (not-high-waves currentwaves))
    (at 5295.88 (not (not-high-waves currentwaves)))
    (at 5895.9 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint19) 5.94)
    (= (traverse-cost waypoint19 waypoint52) 33.16)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data10)
))
)
