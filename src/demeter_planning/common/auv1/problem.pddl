(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint42 - waypoint
    data10 - data
    currenttide - tide
    turbine10 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint42)


    (at 22745.3 (is-in data10 turbine10))



    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)


    (not (tide-low currenttide))

    (at 22797.5 (tide-low currenttide))
    (at 22830.9 (not (tide-low currenttide)))
    (at 22897.6 (tide-low currenttide))
    (at 22931 (not (tide-low currenttide)))
    (at 22997.7 (tide-low currenttide))
    (at 23031 (not (tide-low currenttide)))
    (at 23097.7 (tide-low currenttide))
    (at 23131.1 (not (tide-low currenttide)))



    (at 22745.4 (is-turbine-wp waypoint42 turbine10))

    (not-recharging vehicle1)



    (= (battery-level vehicle1) 0)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 10)

    (= (traverse-cost wp_init_auv1 waypoint42) 5.31)

    (= (speed vehicle1) 0.3)

)
(:goal (and
    (data-sent data10)
))
)
