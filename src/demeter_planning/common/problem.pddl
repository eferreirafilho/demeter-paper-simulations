(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint16 waypoint10 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint16)
    (can-move waypoint16 waypoint10)


    (at 756.295 (is-in data2 turbine2))




    (at 756.5 (at vehicle0 wp_init_auv0))


    (at 756.815 (is-surfaced vehicle0))



    (at 756.83 (empty vehicle0))


    (not (tide-low currenttide))

    (at 796.05 (tide-low currenttide))
    (at 829.433 (not (tide-low currenttide)))
    (at 896.12 (tide-low currenttide))
    (at 929.473 (not (tide-low currenttide)))
    (at 996.16 (tide-low currenttide))
    (at 1029.51 (not (tide-low currenttide)))
    (at 1096.2 (tide-low currenttide))
    (at 1129.55 (not (tide-low currenttide)))



    (at 756.34 (is-turbine-wp waypoint10 turbine2))


    (at 756.845 (not-recharging vehicle0))



    (= (battery-level vehicle0) 99.0829)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint16) 0.55)
    (= (traverse-cost waypoint16 waypoint10) 21.69)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data2)
))
)
