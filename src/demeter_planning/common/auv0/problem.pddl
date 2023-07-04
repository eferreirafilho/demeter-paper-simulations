(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint2 waypoint3 waypoint14 - waypoint
    data3 - data
    currenttide - tide
    turbine3 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint2)
    (can-move waypoint2 waypoint3)
    (can-move waypoint3 waypoint14)

    (is-in data3 turbine3)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 118.085 (not (tide-low currenttide)))
    (at 358.175 (tide-low currenttide))
    (at 478.215 (not (tide-low currenttide)))
    (at 718.27 (tide-low currenttide))
    (at 838.325 (not (tide-low currenttide)))
    (at 1078.38 (tide-low currenttide))
    (at 1198.52 (not (tide-low currenttide)))
    (at 1438.59 (tide-low currenttide))
    (at 1558.72 (not (tide-low currenttide)))
    (at 1798.76 (tide-low currenttide))
    (at 1918.82 (not (tide-low currenttide)))


    (is-turbine-wp waypoint14 turbine3)

    (idle vehicle0)


    (= (battery-level vehicle0) 98.5318)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint2) 30.37)
    (= (traverse-cost waypoint2 waypoint3) 10.32)
    (= (traverse-cost waypoint3 waypoint14) 33.02)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data3)
))
)
