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

    (tide-low currenttide)

    (at 111.355 (not (tide-low currenttide)))
    (at 511.38 (tide-low currenttide))
    (at 711.415 (not (tide-low currenttide)))
    (at 1111.43 (tide-low currenttide))
    (at 1311.46 (not (tide-low currenttide)))
    (at 1711.5 (tide-low currenttide))
    (at 1911.52 (not (tide-low currenttide)))
    (at 2311.53 (tide-low currenttide))
    (at 2511.57 (not (tide-low currenttide)))
    (at 2911.62 (tide-low currenttide))
    (at 3111.65 (not (tide-low currenttide)))


    (is-turbine-wp waypoint22 turbine4)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 2911.34 (not (not-high-waves currentwaves)))
    (at 3511.36 (not-high-waves currentwaves))
    (at 6511.39 (not (not-high-waves currentwaves)))
    (at 7111.42 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint19) 6.44)
    (= (traverse-cost waypoint19 waypoint20) 7.18)
    (= (traverse-cost waypoint20 waypoint22) 26.07)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data4)
))
)
