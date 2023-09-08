(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint32 waypoint27 waypoint25 waypoint24 waypoint47 - waypoint
    data8 - data
    currenttide - tide
    currentwaves - waves
    turbine8 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint32)
    (can-move waypoint32 waypoint27)
    (can-move waypoint27 waypoint25)
    (can-move waypoint25 waypoint24)
    (can-move waypoint24 waypoint47)

    (is-in data8 turbine8)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 80.36 (not (tide-low currenttide)))
    (at 880.38 (tide-low currenttide))
    (at 1280.39 (not (tide-low currenttide)))
    (at 2080.41 (tide-low currenttide))
    (at 2480.42 (not (tide-low currenttide)))
    (at 3280.43 (tide-low currenttide))
    (at 3680.45 (not (tide-low currenttide)))
    (at 4480.48 (tide-low currenttide))
    (at 4880.49 (not (tide-low currenttide)))
    (at 5680.51 (tide-low currenttide))
    (at 6080.52 (not (tide-low currenttide)))


    (is-turbine-wp waypoint47 turbine8)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 5680.34 (not (not-high-waves currentwaves)))
    (at 6880.35 (not-high-waves currentwaves))
    (at 12880.4 (not (not-high-waves currentwaves)))
    (at 14080.4 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint32) 9.24)
    (= (traverse-cost waypoint32 waypoint27) 37.45)
    (= (traverse-cost waypoint27 waypoint25) 34.45)
    (= (traverse-cost waypoint25 waypoint24) 10.52)
    (= (traverse-cost waypoint24 waypoint47) 43.86)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data8)
))
)
