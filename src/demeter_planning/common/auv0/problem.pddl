(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint19 waypoint20 waypoint22 - waypoint
    data4 - data
    currenttide - tide
    currentwaves - waves
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint19)
    (can-move waypoint19 waypoint20)
    (can-move waypoint20 waypoint22)

    (is-in data4 turbine4)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (not (tide-low currenttide))

    (at 189.735 (tide-low currenttide))
    (at 389.755 (not (tide-low currenttide)))
    (at 789.78 (tide-low currenttide))
    (at 989.81 (not (tide-low currenttide)))
    (at 1389.84 (tide-low currenttide))
    (at 1589.88 (not (tide-low currenttide)))
    (at 1989.91 (tide-low currenttide))
    (at 2189.92 (not (tide-low currenttide)))
    (at 2589.94 (tide-low currenttide))
    (at 2789.96 (not (tide-low currenttide)))


    (is-turbine-wp waypoint22 turbine4)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 2589.7 (not (not-high-waves currentwaves)))
    (at 3189.73 (not-high-waves currentwaves))
    (at 6189.75 (not (not-high-waves currentwaves)))
    (at 6789.78 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint19) 6.42)
    (= (traverse-cost waypoint19 waypoint20) 7.18)
    (= (traverse-cost waypoint20 waypoint22) 26.07)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data4)
))
)
