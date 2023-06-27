(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint22 - waypoint
    data5 - data
    currenttide - tide
    turbine5 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint22)

    (is-in data5 turbine5)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (not (tide-low currenttide))

    (at 2013.62 (tide-low currenttide))
    (at 2031.2 (not (tide-low currenttide)))
    (at 2097.87 (tide-low currenttide))
    (at 2131.22 (not (tide-low currenttide)))
    (at 2197.89 (tide-low currenttide))
    (at 2231.24 (not (tide-low currenttide)))
    (at 2297.91 (tide-low currenttide))
    (at 2331.25 (not (tide-low currenttide)))
    (at 2397.93 (tide-low currenttide))
    (at 2431.28 (not (tide-low currenttide)))


    (is-turbine-wp waypoint22 turbine5)

    (not-recharging vehicle0)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint22) 5.325)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data5)
))
)
