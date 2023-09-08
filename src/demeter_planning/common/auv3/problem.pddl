(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle3 - vehicle
    wp_init_auv3 waypoint47 waypoint51 waypoint91 waypoint136 waypoint177 - waypoint
    data34 - data
    currenttide - tide
    currentwaves - waves
    turbine34 - turbine
)
(:init
    (can-move wp_init_auv3 waypoint47)
    (can-move waypoint47 waypoint51)
    (can-move waypoint51 waypoint91)
    (can-move waypoint91 waypoint136)
    (can-move waypoint136 waypoint177)

    (is-in data34 turbine34)


    (at vehicle3 wp_init_auv3)

    (is-surfaced vehicle3)


    (empty vehicle3)

    (tide-low currenttide)

    (at 117.765 (not (tide-low currenttide)))
    (at 917.775 (tide-low currenttide))
    (at 1317.79 (not (tide-low currenttide)))
    (at 2117.8 (tide-low currenttide))
    (at 2517.8 (not (tide-low currenttide)))
    (at 3317.82 (tide-low currenttide))
    (at 3717.82 (not (tide-low currenttide)))
    (at 4517.84 (tide-low currenttide))
    (at 4917.85 (not (tide-low currenttide)))
    (at 5717.86 (tide-low currenttide))
    (at 6117.88 (not (tide-low currenttide)))


    (is-turbine-wp waypoint177 turbine34)

    (idle vehicle3)


    (not-high-waves currentwaves)

    (at 5717.74 (not (not-high-waves currentwaves)))
    (at 6917.76 (not-high-waves currentwaves))
    (at 12917.8 (not (not-high-waves currentwaves)))
    (at 14117.8 (not-high-waves currentwaves))

    (= (battery-level vehicle3) 100)

    (= (recharge-rate vehicle3) 0.05)

    (= (recharge-rate-dedicated vehicle3) 5)

    (= (traverse-cost wp_init_auv3 waypoint47) 9.23)
    (= (traverse-cost waypoint47 waypoint51) 13.15)
    (= (traverse-cost waypoint51 waypoint91) 52.94)
    (= (traverse-cost waypoint91 waypoint136) 53.6)
    (= (traverse-cost waypoint136 waypoint177) 41.43)

    (= (speed vehicle3) 0.65)

)
(:goal (and
    (data-sent data34)
))
)
