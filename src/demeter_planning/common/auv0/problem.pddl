(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint24 waypoint57 - waypoint
    data11 - data
    currenttide - tide
    currentwaves - waves
    turbine11 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint24)
    (can-move waypoint24 waypoint57)

    (is-in data11 turbine11)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (not (tide-low currenttide))

    (at 570.5 (tide-low currenttide))
    (at 870.53 (not (tide-low currenttide)))
    (at 1470.58 (tide-low currenttide))
    (at 1770.62 (not (tide-low currenttide)))
    (at 2370.66 (tide-low currenttide))
    (at 2670.68 (not (tide-low currenttide)))
    (at 3270.72 (tide-low currenttide))
    (at 3570.74 (not (tide-low currenttide)))
    (at 4170.78 (tide-low currenttide))
    (at 4470.81 (not (tide-low currenttide)))


    (is-turbine-wp waypoint57 turbine11)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 3270.42 (not (not-high-waves currentwaves)))
    (at 4170.45 (not-high-waves currentwaves))
    (at 8670.49 (not (not-high-waves currentwaves)))
    (at 9570.52 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint24) 5.85)
    (= (traverse-cost waypoint24 waypoint57) 30.15)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data11)
))
)
