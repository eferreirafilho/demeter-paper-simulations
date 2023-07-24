(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint39 waypoint72 - waypoint
    data14 - data
    currenttide - tide
    currentwaves - waves
    turbine14 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint39)
    (can-move waypoint39 waypoint72)

    (is-in data14 turbine14)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 45.575 (not (tide-low currenttide)))
    (at 365.595 (tide-low currenttide))
    (at 525.625 (not (tide-low currenttide)))
    (at 845.655 (tide-low currenttide))
    (at 1005.69 (not (tide-low currenttide)))
    (at 1325.72 (tide-low currenttide))
    (at 1485.75 (not (tide-low currenttide)))
    (at 1805.77 (tide-low currenttide))
    (at 1965.8 (not (tide-low currenttide)))
    (at 2285.83 (tide-low currenttide))
    (at 2445.87 (not (tide-low currenttide)))


    (is-turbine-wp waypoint72 turbine14)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 365.54 (not (not-high-waves currentwaves)))
    (at 845.57 (not-high-waves currentwaves))
    (at 1805.6 (not (not-high-waves currentwaves)))
    (at 2285.63 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint39) 7.05)
    (= (traverse-cost waypoint39 waypoint72) 11.3)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data14)
))
)
