(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint67 waypoint39 waypoint40 waypoint42 waypoint47 - waypoint
    data9 - data
    currenttide - tide
    turbine9 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint67)
    (can-move waypoint67 waypoint39)
    (can-move waypoint39 waypoint40)
    (can-move waypoint40 waypoint42)
    (can-move waypoint42 waypoint47)

    (is-in data9 turbine9)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (not (tide-low currenttide))

    (at 358.705 (tide-low currenttide))
    (at 478.725 (not (tide-low currenttide)))
    (at 718.74 (tide-low currenttide))
    (at 838.755 (not (tide-low currenttide)))
    (at 1078.78 (tide-low currenttide))
    (at 1198.81 (not (tide-low currenttide)))
    (at 1438.83 (tide-low currenttide))
    (at 1558.85 (not (tide-low currenttide)))
    (at 1798.87 (tide-low currenttide))
    (at 1918.91 (not (tide-low currenttide)))


    (is-turbine-wp waypoint47 turbine9)

    (idle vehicle1)


    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint67) 5.91)
    (= (traverse-cost waypoint67 waypoint39) 33.7)
    (= (traverse-cost waypoint39 waypoint40) 7.18)
    (= (traverse-cost waypoint40 waypoint42) 26.32)
    (= (traverse-cost waypoint42 waypoint47) 29.18)

    (= (speed vehicle1) 0.35)

)
(:goal (and
    (data-sent data9)
))
)
