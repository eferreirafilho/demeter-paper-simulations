(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint16 waypoint6 - waypoint
    data1 - data
    currenttide - tide
    currentwaves - waves
    turbine1 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint16)
    (can-move waypoint16 waypoint6)

    (is-in data1 turbine1)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (not (tide-low currenttide))

    (at 2.35 (tide-low currenttide))
    (at 402.35 (not (tide-low currenttide)))
    (at 1202.68 (tide-low currenttide))
    (at 1602.68 (not (tide-low currenttide)))
    (at 2402.68 (tide-low currenttide))
    (at 2803.12 (not (tide-low currenttide)))
    (at 3603.12 (tide-low currenttide))
    (at 4003.61 (not (tide-low currenttide)))
    (at 4803.87 (tide-low currenttide))
    (at 5203.87 (not (tide-low currenttide)))


    (is-turbine-wp waypoint6 turbine1)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 3601.57 (not (not-high-waves currentwaves)))
    (at 4802.03 (not-high-waves currentwaves))
    (at 10802 (not (not-high-waves currentwaves)))
    (at 12002.3 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint16) 3)
    (= (traverse-cost waypoint16 waypoint6) 109.32)

    (= (speed vehicle0) 0.45)

)
(:goal (and
    (data-sent data1)
))
)
