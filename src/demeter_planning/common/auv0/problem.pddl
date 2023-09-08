(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint79 waypoint80 waypoint50 waypoint52 waypoint25 waypoint27 - waypoint
    data4 - data
    currenttide - tide
    currentwaves - waves
    turbine4 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint79)
    (can-move waypoint79 waypoint80)
    (can-move waypoint80 waypoint50)
    (can-move waypoint50 waypoint52)
    (can-move waypoint52 waypoint25)
    (can-move waypoint25 waypoint27)

    (is-in data4 turbine4)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 180.135 (not (tide-low currenttide)))
    (at 980.145 (tide-low currenttide))
    (at 1380.16 (not (tide-low currenttide)))
    (at 2180.18 (tide-low currenttide))
    (at 2580.18 (not (tide-low currenttide)))
    (at 3380.2 (tide-low currenttide))
    (at 3780.2 (not (tide-low currenttide)))
    (at 4580.23 (tide-low currenttide))
    (at 4980.23 (not (tide-low currenttide)))
    (at 5780.24 (tide-low currenttide))
    (at 6180.25 (not (tide-low currenttide)))


    (is-turbine-wp waypoint27 turbine4)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 5780.14 (not (not-high-waves currentwaves)))
    (at 6980.15 (not-high-waves currentwaves))
    (at 12980.2 (not (not-high-waves currentwaves)))
    (at 14180.2 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint79) 8.68)
    (= (traverse-cost waypoint79 waypoint80) 10.52)
    (= (traverse-cost waypoint80 waypoint50) 56.74)
    (= (traverse-cost waypoint50 waypoint52) 31.45)
    (= (traverse-cost waypoint52 waypoint25) 20.11)
    (= (traverse-cost waypoint25 waypoint27) 34.45)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data4)
))
)
