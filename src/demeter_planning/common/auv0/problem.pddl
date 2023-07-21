(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint18 waypoint42 - waypoint
    data8 - data
    currenttide - tide
    currentwaves - waves
    turbine8 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint18)
    (can-move waypoint18 waypoint42)

    (is-in data8 turbine8)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 138.67 (not (tide-low currenttide)))
    (at 458.73 (tide-low currenttide))
    (at 618.775 (not (tide-low currenttide)))
    (at 938.845 (tide-low currenttide))
    (at 1098.94 (not (tide-low currenttide)))
    (at 1418.99 (tide-low currenttide))
    (at 1579.09 (not (tide-low currenttide)))
    (at 1899.11 (tide-low currenttide))
    (at 2059.18 (not (tide-low currenttide)))
    (at 2379.24 (tide-low currenttide))
    (at 2539.3 (not (tide-low currenttide)))


    (is-turbine-wp waypoint42 turbine8)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 458.525 (not (not-high-waves currentwaves)))
    (at 938.615 (not-high-waves currentwaves))
    (at 1898.67 (not (not-high-waves currentwaves)))
    (at 2378.76 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint18) 5.82)
    (= (traverse-cost waypoint18 waypoint42) 28.81)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data8)
))
)
