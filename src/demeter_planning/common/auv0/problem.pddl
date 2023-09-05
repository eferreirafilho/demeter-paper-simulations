(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint27 waypoint25 waypoint24 waypoint47 waypoint45 waypoint44 waypoint72 - waypoint
    data14 - data
    currenttide - tide
    currentwaves - waves
    turbine14 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint27)
    (can-move waypoint27 waypoint25)
    (can-move waypoint25 waypoint24)
    (can-move waypoint24 waypoint47)
    (can-move waypoint47 waypoint45)
    (can-move waypoint45 waypoint44)
    (can-move waypoint44 waypoint72)

    (is-in data14 turbine14)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (at 798.77 (tide-low currenttide))
    (at 1198.81 (not (tide-low currenttide)))
    (at 1998.93 (tide-low currenttide))
    (at 2398.99 (not (tide-low currenttide)))
    (at 3199.07 (tide-low currenttide))
    (at 3599.14 (not (tide-low currenttide)))
    (at 4399.19 (tide-low currenttide))
    (at 4799.23 (not (tide-low currenttide)))
    (at 5599.3 (tide-low currenttide))
    (at 5999.35 (not (tide-low currenttide)))


    (is-turbine-wp waypoint72 turbine14)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 3198.63 (not (not-high-waves currentwaves)))
    (at 4398.7 (not-high-waves currentwaves))
    (at 10398.8 (not (not-high-waves currentwaves)))
    (at 11598.8 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint27) 7.8)
    (= (traverse-cost waypoint27 waypoint25) 25.86)
    (= (traverse-cost waypoint25 waypoint24) 7.18)
    (= (traverse-cost waypoint24 waypoint47) 33.66)
    (= (traverse-cost waypoint47 waypoint45) 24.59)
    (= (traverse-cost waypoint45 waypoint44) 7.18)
    (= (traverse-cost waypoint44 waypoint72) 34.21)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data14)
))
)
