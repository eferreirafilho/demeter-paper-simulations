(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint120 waypoint118 waypoint117 waypoint150 waypoint145 - waypoint
    data28 - data
    currenttide - tide
    currentwaves - waves
    turbine28 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint120)
    (can-move waypoint120 waypoint118)
    (can-move waypoint118 waypoint117)
    (can-move waypoint117 waypoint150)
    (can-move waypoint150 waypoint145)

    (is-in data28 turbine28)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 146.18 (not (tide-low currenttide)))
    (at 1146.33 (tide-low currenttide))
    (at 1646.45 (not (tide-low currenttide)))
    (at 2646.48 (tide-low currenttide))
    (at 3146.59 (not (tide-low currenttide)))
    (at 4146.59 (tide-low currenttide))
    (at 4646.66 (not (tide-low currenttide)))
    (at 5646.69 (tide-low currenttide))
    (at 6146.8 (not (tide-low currenttide)))
    (at 7146.9 (tide-low currenttide))
    (at 7646.91 (not (tide-low currenttide)))


    (is-turbine-wp waypoint145 turbine28)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 2646.07 (not (not-high-waves currentwaves)))
    (at 4146.12 (not-high-waves currentwaves))
    (at 11646.1 (not (not-high-waves currentwaves)))
    (at 13146.2 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint120) 6.17)
    (= (traverse-cost waypoint120 waypoint118) 35.58)
    (= (traverse-cost waypoint118 waypoint117) 10.52)
    (= (traverse-cost waypoint117 waypoint150) 47.11)
    (= (traverse-cost waypoint150 waypoint145) 40.62)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data28)
))
)
