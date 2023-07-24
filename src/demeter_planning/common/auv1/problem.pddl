(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint9 waypoint20 waypoint47 - waypoint
    data9 - data
    currenttide - tide
    currentwaves - waves
    turbine9 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint9)
    (can-move waypoint9 waypoint20)
    (can-move waypoint20 waypoint47)

    (is-in data9 turbine9)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 54.6 (not (tide-low currenttide)))
    (at 374.635 (tide-low currenttide))
    (at 534.67 (not (tide-low currenttide)))
    (at 854.71 (tide-low currenttide))
    (at 1014.75 (not (tide-low currenttide)))
    (at 1334.79 (tide-low currenttide))
    (at 1494.83 (not (tide-low currenttide)))
    (at 1814.87 (tide-low currenttide))
    (at 1974.9 (not (tide-low currenttide)))
    (at 2294.93 (tide-low currenttide))
    (at 2454.96 (not (tide-low currenttide)))


    (is-turbine-wp waypoint47 turbine9)

    (idle vehicle1)


    (not (not-high-waves currentwaves))

    (at 374.535 (not-high-waves currentwaves))
    (at 1334.59 (not (not-high-waves currentwaves)))
    (at 1814.62 (not-high-waves currentwaves))
    (at 2774.66 (not (not-high-waves currentwaves)))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint9) 7.65)
    (= (traverse-cost waypoint9 waypoint20) 38.56)
    (= (traverse-cost waypoint20 waypoint47) 14.97)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data9)
))
)
