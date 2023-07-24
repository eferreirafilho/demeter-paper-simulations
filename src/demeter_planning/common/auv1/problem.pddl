(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint14 waypoint19 waypoint52 waypoint57 - waypoint
    data11 - data
    currenttide - tide
    currentwaves - waves
    turbine11 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint14)
    (can-move waypoint14 waypoint19)
    (can-move waypoint19 waypoint52)
    (can-move waypoint52 waypoint57)

    (is-in data11 turbine11)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 46.425 (not (tide-low currenttide)))
    (at 366.535 (tide-low currenttide))
    (at 526.615 (not (tide-low currenttide)))
    (at 846.675 (tide-low currenttide))
    (at 1006.8 (not (tide-low currenttide)))
    (at 1326.84 (tide-low currenttide))
    (at 1486.96 (not (tide-low currenttide)))
    (at 1807.13 (tide-low currenttide))
    (at 1967.18 (not (tide-low currenttide)))
    (at 2287.25 (tide-low currenttide))
    (at 2447.33 (not (tide-low currenttide)))


    (is-turbine-wp waypoint57 turbine11)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 366.385 (not (not-high-waves currentwaves)))
    (at 846.46 (not-high-waves currentwaves))
    (at 3246.56 (not (not-high-waves currentwaves)))
    (at 3726.61 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint14) 5.94)
    (= (traverse-cost waypoint14 waypoint19) 28.86)
    (= (traverse-cost waypoint19 waypoint52) 33.16)
    (= (traverse-cost waypoint52 waypoint57) 28.44)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data11)
))
)
