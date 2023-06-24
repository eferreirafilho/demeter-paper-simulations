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


    (at 4596.45 (is-in data5 turbine5))



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (not (tide-low currenttide))

    (at 4598.35 (tide-low currenttide))
    (at 4629.3 (not (tide-low currenttide)))
    (at 4696.02 (tide-low currenttide))
    (at 4729.38 (not (tide-low currenttide)))
    (at 4796.08 (tide-low currenttide))
    (at 4829.46 (not (tide-low currenttide)))
    (at 4896.15 (tide-low currenttide))
    (at 4929.51 (not (tide-low currenttide)))
    (at 4996.2 (tide-low currenttide))
    (at 5029.56 (not (tide-low currenttide)))



    (at 4596.52 (is-turbine-wp waypoint22 turbine5))

    (not-recharging vehicle0)



    (= (battery-level vehicle0) 71.1084)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint20) 2.595)
    (= (traverse-cost waypoint20 waypoint22) 12.265)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data5)
))
)
