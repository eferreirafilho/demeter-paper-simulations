(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint34 waypoint57 waypoint52 waypoint47 waypoint42 - waypoint
    data8 - data
    currenttide - tide
    turbine8 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint34)
    (can-move waypoint34 waypoint57)
    (can-move waypoint57 waypoint52)
    (can-move waypoint52 waypoint47)
    (can-move waypoint47 waypoint42)

    (is-in data8 turbine8)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 117.77 (not (tide-low currenttide)))
    (at 357.88 (tide-low currenttide))
    (at 477.92 (not (tide-low currenttide)))
    (at 718.045 (tide-low currenttide))
    (at 838.14 (not (tide-low currenttide)))
    (at 1078.22 (tide-low currenttide))
    (at 1198.36 (not (tide-low currenttide)))
    (at 1438.39 (tide-low currenttide))
    (at 1558.48 (not (tide-low currenttide)))
    (at 1798.65 (tide-low currenttide))
    (at 1918.7 (not (tide-low currenttide)))


    (is-turbine-wp waypoint42 turbine8)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint34) 5.54)
    (= (traverse-cost waypoint34 waypoint57) 32.41)
    (= (traverse-cost waypoint57 waypoint52) 28.44)
    (= (traverse-cost waypoint52 waypoint47) 32.27)
    (= (traverse-cost waypoint47 waypoint42) 29.18)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data8)
))
)
