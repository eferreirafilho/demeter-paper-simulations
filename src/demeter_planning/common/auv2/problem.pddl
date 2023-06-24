(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint6 waypoint14 waypoint34 waypoint58 - waypoint
    data14 - data
    currenttide - tide
    turbine14 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint6)
    (can-move waypoint6 waypoint14)
    (can-move waypoint14 waypoint34)
    (can-move waypoint34 waypoint58)


    (at 22743.8 (is-in data14 turbine14))



    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)


    (not (tide-low currenttide))

    (at 22797.6 (tide-low currenttide))
    (at 22830.9 (not (tide-low currenttide)))
    (at 22897.6 (tide-low currenttide))
    (at 22931 (not (tide-low currenttide)))
    (at 22997.7 (tide-low currenttide))
    (at 23031 (not (tide-low currenttide)))
    (at 23097.7 (tide-low currenttide))
    (at 23131.1 (not (tide-low currenttide)))



    (at 22743.9 (is-turbine-wp waypoint58 turbine14))

    (not-recharging vehicle2)



    (= (battery-level vehicle2) 0)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 10)

    (= (traverse-cost wp_init_auv2 waypoint6) 0.03)
    (= (traverse-cost waypoint6 waypoint14) 22.285)
    (= (traverse-cost waypoint14 waypoint34) 19.885)
    (= (traverse-cost waypoint34 waypoint58) 21.705)

    (= (speed vehicle2) 0.3)

)
(:goal (and
    (data-sent data14)
))
)
