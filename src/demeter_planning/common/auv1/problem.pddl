(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint29 waypoint26 waypoint6 waypoint2 - waypoint
    data0 - data
    currenttide - tide
    currentwaves - waves
    turbine0 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint29)
    (can-move waypoint29 waypoint26)
    (can-move waypoint26 waypoint6)
    (can-move waypoint6 waypoint2)

    (is-in data0 turbine0)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 283.36 (not (tide-low currenttide)))
    (at 883.385 (tide-low currenttide))
    (at 1183.4 (not (tide-low currenttide)))
    (at 1783.43 (tide-low currenttide))
    (at 2083.45 (not (tide-low currenttide)))
    (at 2683.47 (tide-low currenttide))
    (at 2983.5 (not (tide-low currenttide)))
    (at 3583.52 (tide-low currenttide))
    (at 3883.56 (not (tide-low currenttide)))
    (at 4483.58 (tide-low currenttide))
    (at 4783.6 (not (tide-low currenttide)))


    (is-turbine-wp waypoint2 turbine0)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 4483.35 (not (not-high-waves currentwaves)))
    (at 5383.38 (not-high-waves currentwaves))
    (at 9883.41 (not (not-high-waves currentwaves)))
    (at 10783.4 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint29) 7.1)
    (= (traverse-cost waypoint29 waypoint26) 38.43)
    (= (traverse-cost waypoint26 waypoint6) 62.59)
    (= (traverse-cost waypoint6 waypoint2) 13.47)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data0)
))
)
