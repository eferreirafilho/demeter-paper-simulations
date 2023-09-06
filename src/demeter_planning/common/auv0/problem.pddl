(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint21 waypoint16 waypoint11 - waypoint
    data2 - data
    currenttide - tide
    currentwaves - waves
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint21)
    (can-move waypoint21 waypoint16)
    (can-move waypoint16 waypoint11)

    (is-in data2 turbine2)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 282.51 (not (tide-low currenttide)))
    (at 1082.59 (tide-low currenttide))
    (at 1482.64 (not (tide-low currenttide)))
    (at 2282.7 (tide-low currenttide))
    (at 2682.75 (not (tide-low currenttide)))
    (at 3482.8 (tide-low currenttide))
    (at 3882.86 (not (tide-low currenttide)))
    (at 4682.94 (tide-low currenttide))
    (at 5082.97 (not (tide-low currenttide)))
    (at 5883.02 (tide-low currenttide))
    (at 6283.05 (not (tide-low currenttide)))


    (is-turbine-wp waypoint11 turbine2)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 4682.46 (not (not-high-waves currentwaves)))
    (at 5882.53 (not-high-waves currentwaves))
    (at 11882.6 (not (not-high-waves currentwaves)))
    (at 13082.6 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint21) 3.28)
    (= (traverse-cost waypoint21 waypoint16) 77.78)
    (= (traverse-cost waypoint16 waypoint11) 70.54)

    (= (speed vehicle0) 0.45)

)
(:goal (and
    (data-sent data2)
))
)
