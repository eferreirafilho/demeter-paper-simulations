(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint24 waypoint21 waypoint17 waypoint12 - waypoint
    data2 - data
    currenttide - tide
    currentwaves - waves
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint24)
    (can-move waypoint24 waypoint21)
    (can-move waypoint21 waypoint17)
    (can-move waypoint17 waypoint12)

    (is-in data2 turbine2)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 82.935 (not (tide-low currenttide)))
    (at 483.06 (tide-low currenttide))
    (at 683.185 (not (tide-low currenttide)))
    (at 1083.28 (tide-low currenttide))
    (at 1283.35 (not (tide-low currenttide)))
    (at 1683.39 (tide-low currenttide))
    (at 1883.52 (not (tide-low currenttide)))
    (at 2283.57 (tide-low currenttide))
    (at 2483.69 (not (tide-low currenttide)))
    (at 2883.75 (tide-low currenttide))
    (at 3083.9 (not (tide-low currenttide)))


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 2282.91 (not (not-high-waves currentwaves)))
    (at 2883.01 (not-high-waves currentwaves))
    (at 5883.12 (not (not-high-waves currentwaves)))
    (at 6483.21 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint24) 5.91)
    (= (traverse-cost waypoint24 waypoint21) 41.33)
    (= (traverse-cost waypoint21 waypoint17) 13.47)
    (= (traverse-cost waypoint17 waypoint12) 28.86)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data2)
))
)
