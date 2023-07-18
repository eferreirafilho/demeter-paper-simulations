(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint37 waypoint42 - waypoint
    data8 - data
    currenttide - tide
    turbine8 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint37)
    (can-move waypoint37 waypoint42)

    (is-in data8 turbine8)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 118.565 (not (tide-low currenttide)))
    (at 358.59 (tide-low currenttide))
    (at 478.615 (not (tide-low currenttide)))
    (at 718.71 (tide-low currenttide))
    (at 838.725 (not (tide-low currenttide)))
    (at 1078.77 (tide-low currenttide))
    (at 1198.79 (not (tide-low currenttide)))
    (at 1438.82 (tide-low currenttide))
    (at 1558.86 (not (tide-low currenttide)))
    (at 1798.86 (tide-low currenttide))
    (at 1918.88 (not (tide-low currenttide)))


    (is-turbine-wp waypoint42 turbine8)

    (idle vehicle1)


    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint37) 7.65)
    (= (traverse-cost waypoint37 waypoint42) 31.48)

    (= (speed vehicle1) 0.35)

)
(:goal (and
    (data-sent data8)
))
)
