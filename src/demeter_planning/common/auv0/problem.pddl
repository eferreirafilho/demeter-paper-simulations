(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint20 waypoint22 - waypoint
    data5 - data
    currenttide - tide
    turbine5 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint20)
    (can-move waypoint20 waypoint22)

    (is-in data5 turbine5)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (not (tide-low currenttide))

    (at 21993.8 (tide-low currenttide))
    (at 22027.2 (not (tide-low currenttide)))
    (at 22093.9 (tide-low currenttide))
    (at 22127.2 (not (tide-low currenttide)))
    (at 22193.9 (tide-low currenttide))
    (at 22227.3 (not (tide-low currenttide)))
    (at 22294 (tide-low currenttide))
    (at 22327.3 (not (tide-low currenttide)))


    (is-turbine-wp waypoint22 turbine5)

    (not-recharging vehicle0)



    (= (battery-level vehicle0) 0)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint20) 2.94)
    (= (traverse-cost waypoint20 waypoint22) 12.265)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data5)
))
)
