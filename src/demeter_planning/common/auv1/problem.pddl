(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint34 waypoint29 waypoint26 waypoint22 waypoint17 - waypoint
    data3 - data
    currenttide - tide
    currentwaves - waves
    turbine3 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint34)
    (can-move waypoint34 waypoint29)
    (can-move waypoint29 waypoint26)
    (can-move waypoint26 waypoint22)
    (can-move waypoint22 waypoint17)

    (is-in data3 turbine3)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (not (tide-low currenttide))

    (at 311.825 (tide-low currenttide))
    (at 471.85 (not (tide-low currenttide)))
    (at 792.01 (tide-low currenttide))
    (at 952.01 (not (tide-low currenttide)))
    (at 1272.19 (tide-low currenttide))
    (at 1432.28 (not (tide-low currenttide)))
    (at 1752.28 (tide-low currenttide))
    (at 1912.29 (not (tide-low currenttide)))
    (at 2232.46 (tide-low currenttide))
    (at 2392.65 (not (tide-low currenttide)))


    (is-turbine-wp waypoint17 turbine3)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 791.4 (not (not-high-waves currentwaves)))
    (at 1271.53 (not-high-waves currentwaves))
    (at 2231.57 (not (not-high-waves currentwaves)))
    (at 2711.7 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint34) 5.42)
    (= (traverse-cost waypoint34 waypoint29) 31.78)
    (= (traverse-cost waypoint29 waypoint26) 38.43)
    (= (traverse-cost waypoint26 waypoint22) 13.47)
    (= (traverse-cost waypoint22 waypoint17) 31.64)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data3)
))
)
