(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint39 waypoint67 waypoint100 waypoint137 waypoint175 waypoint212 - waypoint
    data41 - data
    currenttide - tide
    currentwaves - waves
    turbine41 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint39)
    (can-move waypoint39 waypoint67)
    (can-move waypoint67 waypoint100)
    (can-move waypoint100 waypoint137)
    (can-move waypoint137 waypoint175)
    (can-move waypoint175 waypoint212)

    (is-in data41 turbine41)


    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)


    (empty vehicle2)

    (not (tide-low currenttide))

    (at 793.865 (tide-low currenttide))
    (at 1193.87 (not (tide-low currenttide)))
    (at 1993.89 (tide-low currenttide))
    (at 2393.91 (not (tide-low currenttide)))
    (at 3193.93 (tide-low currenttide))
    (at 3593.93 (not (tide-low currenttide)))
    (at 4393.94 (tide-low currenttide))
    (at 4793.96 (not (tide-low currenttide)))
    (at 5593.97 (tide-low currenttide))
    (at 5993.99 (not (tide-low currenttide)))


    (is-turbine-wp waypoint212 turbine41)

    (idle vehicle2)


    (not-high-waves currentwaves)

    (at 5593.85 (not (not-high-waves currentwaves)))
    (at 6793.88 (not-high-waves currentwaves))
    (at 12793.9 (not (not-high-waves currentwaves)))
    (at 13993.9 (not-high-waves currentwaves))

    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint39) 8.95)
    (= (traverse-cost waypoint39 waypoint67) 9.11)
    (= (traverse-cost waypoint67 waypoint100) 63.41)
    (= (traverse-cost waypoint100 waypoint137) 21.54)
    (= (traverse-cost waypoint137 waypoint175) 62.43)
    (= (traverse-cost waypoint175 waypoint212) 21.3)

    (= (speed vehicle2) 0.65)

)
(:goal (and
    (data-sent data41)
))
)
