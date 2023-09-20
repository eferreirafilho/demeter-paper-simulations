(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint45 waypoint43 waypoint42 waypoint70 - waypoint
    data13 - data
    currenttide - tide
    currentwaves - waves
    turbine13 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint45)
    (can-move waypoint45 waypoint43)
    (can-move waypoint43 waypoint42)
    (can-move waypoint42 waypoint70)

    (is-in data13 turbine13)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 34.505 (not (tide-low currenttide)))
    (at 1034.51 (tide-low currenttide))
    (at 1534.58 (not (tide-low currenttide)))
    (at 2534.7 (tide-low currenttide))
    (at 3034.73 (not (tide-low currenttide)))
    (at 4034.86 (tide-low currenttide))
    (at 4534.88 (not (tide-low currenttide)))
    (at 5534.93 (tide-low currenttide))
    (at 6035.01 (not (tide-low currenttide)))
    (at 7035.09 (tide-low currenttide))
    (at 7535.14 (not (tide-low currenttide)))


    (is-turbine-wp waypoint70 turbine13)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 2534.33 (not (not-high-waves currentwaves)))
    (at 4034.35 (not-high-waves currentwaves))
    (at 11534.4 (not (not-high-waves currentwaves)))
    (at 13034.4 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint45) 5.85)
    (= (traverse-cost waypoint45 waypoint43) 36.25)
    (= (traverse-cost waypoint43 waypoint42) 10.52)
    (= (traverse-cost waypoint42 waypoint70) 48.54)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data13)
))
)
