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

    (at 102.06 (not (tide-low currenttide)))
    (at 502.09 (tide-low currenttide))
    (at 702.125 (not (tide-low currenttide)))
    (at 1102.15 (tide-low currenttide))
    (at 1302.18 (not (tide-low currenttide)))
    (at 1702.21 (tide-low currenttide))
    (at 1902.24 (not (tide-low currenttide)))
    (at 2302.28 (tide-low currenttide))
    (at 2502.3 (not (tide-low currenttide)))
    (at 2902.32 (tide-low currenttide))
    (at 3102.36 (not (tide-low currenttide)))


    (is-turbine-wp waypoint52 turbine10)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 2302.02 (not (not-high-waves currentwaves)))
    (at 2902.04 (not-high-waves currentwaves))
    (at 5902.07 (not (not-high-waves currentwaves)))
    (at 6502.09 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint27) 7.04)
    (= (traverse-cost waypoint27 waypoint25) 25.86)
    (= (traverse-cost waypoint25 waypoint52) 15.52)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data10)
))
)
