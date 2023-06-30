(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint18 waypoint14 waypoint10 - waypoint
    data2 - data
    currenttide - tide
    turbine2 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint18)
    (can-move waypoint18 waypoint14)
    (can-move waypoint14 waypoint10)

    (is-in data2 turbine2)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 38.812 (not (tide-low currenttide)))
    (at 118.824 (tide-low currenttide))
    (at 158.843 (not (tide-low currenttide)))
    (at 238.853 (tide-low currenttide))
    (at 278.863 (not (tide-low currenttide)))
    (at 358.871 (tide-low currenttide))
    (at 398.882 (not (tide-low currenttide)))
    (at 478.892 (tide-low currenttide))
    (at 518.902 (not (tide-low currenttide)))
    (at 598.912 (tide-low currenttide))
    (at 638.923 (not (tide-low currenttide)))


    (is-turbine-wp waypoint10 turbine2)

    (idle vehicle0)


    (= (battery-level vehicle0) 96.8723)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint18) 4.18)
    (= (traverse-cost waypoint18 waypoint14) 31.86)
    (= (traverse-cost waypoint14 waypoint10) 29.05)

    (= (speed vehicle0) 0.2)

)
(:goal (and
    (data-sent data2)
))
)
