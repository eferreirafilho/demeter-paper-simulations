(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint15 waypoint19 waypoint22 waypoint57 waypoint95 - waypoint
    data18 - data
    currenttide - tide
    currentwaves - waves
    turbine18 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint15)
    (can-move waypoint15 waypoint19)
    (can-move waypoint19 waypoint22)
    (can-move waypoint22 waypoint57)
    (can-move waypoint57 waypoint95)

    (is-in data18 turbine18)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 363.235 (not (tide-low currenttide)))
    (at 1363.29 (tide-low currenttide))
    (at 1863.29 (not (tide-low currenttide)))
    (at 2863.46 (tide-low currenttide))
    (at 3363.53 (not (tide-low currenttide)))
    (at 4363.53 (tide-low currenttide))
    (at 4863.7 (not (tide-low currenttide)))
    (at 5863.7 (tide-low currenttide))
    (at 6363.7 (not (tide-low currenttide)))
    (at 7363.7 (tide-low currenttide))
    (at 7863.86 (not (tide-low currenttide)))


    (is-turbine-wp waypoint95 turbine18)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 2863.28 (not (not-high-waves currentwaves)))
    (at 4363.38 (not-high-waves currentwaves))
    (at 11863.4 (not (not-high-waves currentwaves)))
    (at 13363.5 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint15) 4.87)
    (= (traverse-cost waypoint15 waypoint19) 16.12)
    (= (traverse-cost waypoint19 waypoint22) 46.06)
    (= (traverse-cost waypoint22 waypoint57) 69.94)
    (= (traverse-cost waypoint57 waypoint95) 37.71)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data18)
))
)
