(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint19 waypoint52 waypoint57 - waypoint
    data11 - data
    currenttide - tide
    turbine11 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint19)
    (can-move waypoint19 waypoint52)
    (can-move waypoint52 waypoint57)

    (is-in data11 turbine11)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 118.495 (not (tide-low currenttide)))
    (at 358.52 (tide-low currenttide))
    (at 478.55 (not (tide-low currenttide)))
    (at 718.575 (tide-low currenttide))
    (at 838.595 (not (tide-low currenttide)))
    (at 1078.61 (tide-low currenttide))
    (at 1198.7 (not (tide-low currenttide)))
    (at 1438.72 (tide-low currenttide))
    (at 1558.74 (not (tide-low currenttide)))
    (at 1798.77 (tide-low currenttide))
    (at 1918.83 (not (tide-low currenttide)))


    (is-turbine-wp waypoint57 turbine11)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint19) 6.42)
    (= (traverse-cost waypoint19 waypoint52) 33.16)
    (= (traverse-cost waypoint52 waypoint57) 28.44)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data11)
))
)
