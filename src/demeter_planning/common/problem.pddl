(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 waypoint6 waypoint7 waypoint8 waypoint9 waypoint10 waypoint11 waypoint12 waypoint13 waypoint14 waypoint15 waypoint16 waypoint17 waypoint18 waypoint19 waypoint20 - waypoint
    data0 data1 - data
    currenttide - tide
    currentwaves - waves
    turbine0 turbine1 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint2)
    (can-move waypoint2 waypoint1)
    (can-move waypoint1 waypoint6)
    (can-move waypoint6 waypoint1)

    (is-in data0 turbine0)
    (is-in data1 turbine1)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)

    (empty vehicle0)

    (tide-low currenttide)

    (at 124.02 (not (tide-low currenttide)))
    (at 524.055 (tide-low currenttide))
    (at 724.065 (not (tide-low currenttide)))
    (at 1124.11 (tide-low currenttide))
    (at 1324.13 (not (tide-low currenttide)))
    (at 1724.18 (tide-low currenttide))
    (at 1924.23 (not (tide-low currenttide)))
    (at 2324.24 (tide-low currenttide))
    (at 2524.29 (not (tide-low currenttide)))
    (at 2924.37 (tide-low currenttide))
    (at 3124.54 (not (tide-low currenttide)))


    (is-turbine-wp waypoint1 turbine0)
    (is-turbine-wp waypoint6 turbine1)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 2323.96 (not (not-high-waves currentwaves)))
    (at 2923.99 (not-high-waves currentwaves))
    (at 5924.04 (not (not-high-waves currentwaves)))
    (at 6524.08 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 97.4716)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint2) 18.88)
    (= (traverse-cost waypoint2 waypoint1) 28.04)
    (= (traverse-cost waypoint1 waypoint6) 80.88)
    (= (traverse-cost waypoint6 waypoint1) 80.88)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data0)
    ; (data-sent data1)
))
)
