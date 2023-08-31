(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint27 waypoint25 waypoint52 - waypoint
    data10 - data
    currenttide - tide
    currentwaves - waves
    turbine10 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint27)
    (can-move waypoint27 waypoint25)
    (can-move waypoint25 waypoint52)

    (is-in data10 turbine10)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 38.785 (not (tide-low currenttide)))
    (at 638.81 (tide-low currenttide))
    (at 938.835 (not (tide-low currenttide)))
    (at 1538.88 (tide-low currenttide))
    (at 1838.9 (not (tide-low currenttide)))
    (at 2438.93 (tide-low currenttide))
    (at 2738.96 (not (tide-low currenttide)))
    (at 3338.99 (tide-low currenttide))
    (at 3639.03 (not (tide-low currenttide)))
    (at 4239.07 (tide-low currenttide))
    (at 4539.1 (not (tide-low currenttide)))


    (is-turbine-wp waypoint52 turbine10)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 4238.69 (not (not-high-waves currentwaves)))
    (at 5138.72 (not-high-waves currentwaves))
    (at 9638.76 (not (not-high-waves currentwaves)))
    (at 10538.8 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint27) 7)
    (= (traverse-cost waypoint27 waypoint25) 25.86)
    (= (traverse-cost waypoint25 waypoint52) 15.52)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data10)
))
)
