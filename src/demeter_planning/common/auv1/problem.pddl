(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint50 waypoint54 waypoint90 - waypoint
    data17 - data
    currenttide - tide
    currentwaves - waves
    turbine17 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint50)
    (can-move waypoint50 waypoint54)
    (can-move waypoint54 waypoint90)

    (is-in data17 turbine17)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 106.635 (not (tide-low currenttide)))
    (at 1106.7 (tide-low currenttide))
    (at 1606.71 (not (tide-low currenttide)))
    (at 2606.71 (tide-low currenttide))
    (at 3106.79 (not (tide-low currenttide)))
    (at 4106.84 (tide-low currenttide))
    (at 4606.94 (not (tide-low currenttide)))
    (at 5606.94 (tide-low currenttide))
    (at 6107.1 (not (tide-low currenttide)))
    (at 7107.1 (tide-low currenttide))
    (at 7607.26 (not (tide-low currenttide)))


    (is-turbine-wp waypoint90 turbine17)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 2606.65 (not (not-high-waves currentwaves)))
    (at 4106.67 (not-high-waves currentwaves))
    (at 11606.8 (not (not-high-waves currentwaves)))
    (at 13106.8 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint50) 3.99)
    (= (traverse-cost waypoint50 waypoint54) 16.12)
    (= (traverse-cost waypoint54 waypoint90) 55.71)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data17)
))
)
