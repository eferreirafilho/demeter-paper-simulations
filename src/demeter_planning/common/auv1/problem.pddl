(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint71 waypoint72 waypoint44 waypoint45 waypoint47 waypoint24 waypoint25 waypoint27 - waypoint
    data5 - data
    currenttide - tide
    currentwaves - waves
    turbine5 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint71)
    (can-move waypoint71 waypoint72)
    (can-move waypoint72 waypoint44)
    (can-move waypoint44 waypoint45)
    (can-move waypoint45 waypoint47)
    (can-move waypoint47 waypoint24)
    (can-move waypoint24 waypoint25)
    (can-move waypoint25 waypoint27)

    (is-in data5 turbine5)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 25.11 (not (tide-low currenttide)))
    (at 345.115 (tide-low currenttide))
    (at 505.19 (not (tide-low currenttide)))
    (at 825.32 (tide-low currenttide))
    (at 985.37 (not (tide-low currenttide)))
    (at 1305.43 (tide-low currenttide))
    (at 1465.51 (not (tide-low currenttide)))
    (at 1785.61 (tide-low currenttide))
    (at 1945.68 (not (tide-low currenttide)))
    (at 2265.76 (tide-low currenttide))
    (at 2425.86 (not (tide-low currenttide)))


    (is-turbine-wp waypoint27 turbine5)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 824.895 (not (not-high-waves currentwaves)))
    (at 1304.98 (not-high-waves currentwaves))
    (at 2265.06 (not (not-high-waves currentwaves)))
    (at 2745.07 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint71) 5.84)
    (= (traverse-cost waypoint71 waypoint72) 20.4)
    (= (traverse-cost waypoint72 waypoint44) 34.21)
    (= (traverse-cost waypoint44 waypoint45) 7.18)
    (= (traverse-cost waypoint45 waypoint47) 24.59)
    (= (traverse-cost waypoint47 waypoint24) 33.66)
    (= (traverse-cost waypoint24 waypoint25) 7.18)
    (= (traverse-cost waypoint25 waypoint27) 25.86)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data5)
))
)
