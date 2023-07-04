(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint20 waypoint22 - waypoint
    data5 - data
    currenttide - tide
    turbine5 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint20)
    (can-move waypoint20 waypoint22)

    (is-in data5 turbine5)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 18.205 (not (tide-low currenttide)))
    (at 58.205 (tide-low currenttide))
    (at 78.31 (not (tide-low currenttide)))
    (at 118.315 (tide-low currenttide))
    (at 138.315 (not (tide-low currenttide)))
    (at 178.35 (tide-low currenttide))
    (at 198.485 (not (tide-low currenttide)))
    (at 238.52 (tide-low currenttide))
    (at 258.56 (not (tide-low currenttide)))
    (at 298.695 (tide-low currenttide))
    (at 318.735 (not (tide-low currenttide)))


    (is-turbine-wp waypoint22 turbine5)

    (idle vehicle0)


    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint20) 1.6)
    (= (traverse-cost waypoint20 waypoint22) 24.53)

    (= (speed vehicle0) 0.5)

)
(:goal (and
    (data-sent data5)
))
)
