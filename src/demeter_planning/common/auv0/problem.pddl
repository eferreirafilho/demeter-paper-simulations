(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint42 waypoint19 waypoint18 - waypoint
    data4 - data
    currenttide - tide
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint42)
    (can-move waypoint42 waypoint19)
    (can-move waypoint19 waypoint18)

    (is-in data4 turbine4)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (not (tide-low currenttide))

    (at 8450.2 (tide-low currenttide))
    (at 8464.51 (not (tide-low currenttide)))
    (at 8597.87 (tide-low currenttide))
    (at 8664.55 (not (tide-low currenttide)))
    (at 8797.9 (tide-low currenttide))
    (at 8864.58 (not (tide-low currenttide)))
    (at 8997.92 (tide-low currenttide))
    (at 9064.6 (not (tide-low currenttide)))
    (at 9197.94 (tide-low currenttide))
    (at 9264.62 (not (tide-low currenttide)))


    (is-turbine-wp waypoint18 turbine4)

    (not-recharging vehicle0)

    (idle vehicle0)


    (= (battery-level vehicle0) 92.2)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint42) 2.405)
    (= (traverse-cost waypoint42 waypoint19) 15.42)
    (= (traverse-cost waypoint19 waypoint18) 5.16)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data4)
))
)
