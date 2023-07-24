(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint27 waypoint22 waypoint20 waypoint19 waypoint42 - waypoint
    data8 - data
    currenttide - tide
    currentwaves - waves
    turbine8 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint27)
    (can-move waypoint27 waypoint22)
    (can-move waypoint22 waypoint20)
    (can-move waypoint20 waypoint19)
    (can-move waypoint19 waypoint42)

    (is-in data8 turbine8)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 55.01 (not (tide-low currenttide)))
    (at 375.035 (tide-low currenttide))
    (at 535.07 (not (tide-low currenttide)))
    (at 855.095 (tide-low currenttide))
    (at 1015.13 (not (tide-low currenttide)))
    (at 1335.17 (tide-low currenttide))
    (at 1495.2 (not (tide-low currenttide)))
    (at 1815.22 (tide-low currenttide))
    (at 1975.23 (not (tide-low currenttide)))
    (at 2295.25 (tide-low currenttide))
    (at 2455.28 (not (tide-low currenttide)))


    (is-turbine-wp waypoint42 turbine8)

    (idle vehicle0)


    (not (not-high-waves currentwaves))

    (at 374.965 (not-high-waves currentwaves))
    (at 1334.99 (not (not-high-waves currentwaves)))
    (at 1815.03 (not-high-waves currentwaves))
    (at 2775.06 (not (not-high-waves currentwaves)))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint27) 8.01)
    (= (traverse-cost waypoint27 waypoint22) 28.76)
    (= (traverse-cost waypoint22 waypoint20) 26.07)
    (= (traverse-cost waypoint20 waypoint19) 7.18)
    (= (traverse-cost waypoint19 waypoint42) 31.11)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data8)
))
)
