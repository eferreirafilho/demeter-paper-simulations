(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint4 waypoint52 - waypoint
    data10 - data
    currenttide - tide
    currentwaves - waves
    turbine10 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint4)
    (can-move waypoint4 waypoint52)

    (is-in data10 turbine10)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 45.975 (not (tide-low currenttide)))
    (at 366.07 (tide-low currenttide))
    (at 526.135 (not (tide-low currenttide)))
    (at 846.14 (tide-low currenttide))
    (at 1006.23 (not (tide-low currenttide)))
    (at 1326.28 (tide-low currenttide))
    (at 1486.37 (not (tide-low currenttide)))
    (at 1806.44 (tide-low currenttide))
    (at 1966.52 (not (tide-low currenttide)))
    (at 2286.6 (tide-low currenttide))
    (at 2446.64 (not (tide-low currenttide)))


    (is-turbine-wp waypoint52 turbine10)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 365.955 (not (not-high-waves currentwaves)))
    (at 846.025 (not-high-waves currentwaves))
    (at 3246.07 (not (not-high-waves currentwaves)))
    (at 3726.14 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint4) 6.61)
    (= (traverse-cost waypoint4 waypoint52) 69.52)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data10)
))
)
