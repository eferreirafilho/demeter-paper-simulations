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

    (at 12000.5 (tide-low currenttide))
    (at 12026.9 (not (tide-low currenttide)))
    (at 12093.6 (tide-low currenttide))
    (at 12127 (not (tide-low currenttide)))
    (at 12193.8 (tide-low currenttide))
    (at 12227.1 (not (tide-low currenttide)))
    (at 12293.8 (tide-low currenttide))
    (at 12327.2 (not (tide-low currenttide)))
    (at 12393.9 (tide-low currenttide))
    (at 12427.3 (not (tide-low currenttide)))


    (is-turbine-wp waypoint22 turbine5)

    (not-recharging vehicle0)



    (= (battery-level vehicle0) 0)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint20) 0.005)
    (= (traverse-cost waypoint20 waypoint22) 12.265)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data5)
))
)
