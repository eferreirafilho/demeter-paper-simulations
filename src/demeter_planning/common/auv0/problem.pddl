(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint72 waypoint38 waypoint37 - waypoint
    data7 - data
    currenttide - tide
    turbine7 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint72)
    (can-move waypoint72 waypoint38)
    (can-move waypoint38 waypoint37)

    (is-in data7 turbine7)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 118.175 (not (tide-low currenttide)))
    (at 358.255 (tide-low currenttide))
    (at 478.305 (not (tide-low currenttide)))
    (at 718.36 (tide-low currenttide))
    (at 838.45 (not (tide-low currenttide)))
    (at 1078.45 (tide-low currenttide))
    (at 1198.56 (not (tide-low currenttide)))
    (at 1438.62 (tide-low currenttide))
    (at 1558.67 (not (tide-low currenttide)))
    (at 1798.73 (tide-low currenttide))
    (at 1918.77 (not (tide-low currenttide)))


    (is-turbine-wp waypoint37 turbine7)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint72) 6.16)
    (= (traverse-cost waypoint72 waypoint38) 28.9)
    (= (traverse-cost waypoint38 waypoint37) 13.47)

    (= (speed vehicle0) 0.35)

)
(:goal (and
    (data-sent data7)
))
)
