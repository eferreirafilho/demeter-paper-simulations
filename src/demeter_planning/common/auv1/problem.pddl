(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint29 waypoint30 waypoint32 - waypoint
    data6 - data
    currenttide - tide
    turbine6 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint29)
    (can-move waypoint29 waypoint30)
    (can-move waypoint30 waypoint32)

    (is-in data6 turbine6)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (not (tide-low currenttide))

    (at 358.62 (tide-low currenttide))
    (at 478.64 (not (tide-low currenttide)))
    (at 718.665 (tide-low currenttide))
    (at 838.695 (not (tide-low currenttide)))
    (at 1078.75 (tide-low currenttide))
    (at 1198.76 (not (tide-low currenttide)))
    (at 1438.8 (tide-low currenttide))
    (at 1558.81 (not (tide-low currenttide)))
    (at 1798.86 (tide-low currenttide))
    (at 1918.88 (not (tide-low currenttide)))


    (is-turbine-wp waypoint32 turbine6)

    (idle vehicle1)


    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint29) 7.07)
    (= (traverse-cost waypoint29 waypoint30) 7.18)
    (= (traverse-cost waypoint30 waypoint32) 21.65)

    (= (speed vehicle1) 0.35)

)
(:goal (and
    (data-sent data6)
))
)
