(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint0 waypoint1 waypoint2 waypoint3 waypoint4 waypoint5 waypoint6 waypoint7 waypoint8 waypoint9 waypoint10 waypoint11 waypoint12 waypoint13 waypoint14 waypoint15 waypoint16 waypoint17 waypoint18 waypoint19 waypoint20 - waypoint
    data0 - data
    currenttide - tide
    currentwaves - waves
    turbine0 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint4)
    (can-move waypoint4 waypoint5)
    (can-move waypoint5 waypoint1)

    (is-in data0 turbine0)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 159.735 (not (tide-low currenttide)))
    (at 559.77 (tide-low currenttide))
    (at 759.825 (not (tide-low currenttide)))
    (at 1159.85 (tide-low currenttide))
    (at 1359.88 (not (tide-low currenttide)))
    (at 1759.91 (tide-low currenttide))
    (at 1959.94 (not (tide-low currenttide)))
    (at 2360 (tide-low currenttide))
    (at 2560.01 (not (tide-low currenttide)))
    (at 2960.04 (tide-low currenttide))
    (at 3160.06 (not (tide-low currenttide)))


    (is-turbine-wp waypoint1 turbine0)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 2959.72 (not (not-high-waves currentwaves)))
    (at 3559.75 (not-high-waves currentwaves))
    (at 6559.8 (not (not-high-waves currentwaves)))
    (at 7159.84 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint4) 29.19)
    (= (traverse-cost waypoint4 waypoint5) 37.54)
    (= (traverse-cost waypoint5 waypoint1) 28.04)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data0)
))
)
