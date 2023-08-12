(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 waypoint6 waypoint7 waypoint8 waypoint9 waypoint10 waypoint11 waypoint12 waypoint13 waypoint14 waypoint15 waypoint16 waypoint17 waypoint18 waypoint19 waypoint20 - waypoint
    data0 data1 - data
    currenttide - tide
    currentwaves - waves
    turbine0 turbine1 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint4)
    (can-move waypoint4 waypoint5)
    (can-move waypoint5 waypoint1)
    (can-move waypoint4 waypoint6)
    (can-move waypoint1 waypoint6)
    (can-move waypoint6 waypoint1)

    (is-in data0 turbine0)
    (is-in data1 turbine1)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 127.25 (not (tide-low currenttide)))
    (at 527.29 (tide-low currenttide))
    (at 727.315 (not (tide-low currenttide)))
    (at 1127.41 (tide-low currenttide))
    (at 1327.43 (not (tide-low currenttide)))
    (at 1727.46 (tide-low currenttide))
    (at 1927.53 (not (tide-low currenttide)))
    (at 2327.56 (tide-low currenttide))
    (at 2527.61 (not (tide-low currenttide)))
    (at 2927.67 (tide-low currenttide))
    (at 3127.69 (not (tide-low currenttide)))


    (is-turbine-wp waypoint1 turbine0)
    (is-turbine-wp waypoint6 turbine1)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 2327.22 (not (not-high-waves currentwaves)))
    (at 2927.25 (not-high-waves currentwaves))
    (at 5927.28 (not (not-high-waves currentwaves)))
    (at 6527.31 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 99.5329)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint4) 29.19)
    (= (traverse-cost waypoint4 waypoint5) 37.54)
    (= (traverse-cost waypoint5 waypoint1) 28.04)
    (= (traverse-cost waypoint4 waypoint6) 69.83)
    (= (traverse-cost waypoint1 waypoint6) 80.88)
    (= (traverse-cost waypoint6 waypoint1) 80.88)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data0)
    (data-sent data1)
))
)
