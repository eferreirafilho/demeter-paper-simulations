(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint32 waypoint30 waypoint29 waypoint24 waypoint19 waypoint42 waypoint37 - waypoint
    data7 - data
    currenttide - tide
    currentwaves - waves
    turbine7 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint32)
    (can-move waypoint32 waypoint30)
    (can-move waypoint30 waypoint29)
    (can-move waypoint29 waypoint24)
    (can-move waypoint24 waypoint19)
    (can-move waypoint19 waypoint42)
    (can-move waypoint42 waypoint37)

    (is-in data7 turbine7)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 79.45 (not (tide-low currenttide)))
    (at 679.475 (tide-low currenttide))
    (at 979.495 (not (tide-low currenttide)))
    (at 1579.52 (tide-low currenttide))
    (at 1879.54 (not (tide-low currenttide)))
    (at 2479.56 (tide-low currenttide))
    (at 2779.6 (not (tide-low currenttide)))
    (at 3379.63 (tide-low currenttide))
    (at 3679.66 (not (tide-low currenttide)))
    (at 4279.68 (tide-low currenttide))
    (at 4579.71 (not (tide-low currenttide)))


    (is-turbine-wp waypoint37 turbine7)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 4279.46 (not (not-high-waves currentwaves)))
    (at 5179.49 (not-high-waves currentwaves))
    (at 9679.5 (not (not-high-waves currentwaves)))
    (at 10579.5 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint32) 7.74)
    (= (traverse-cost waypoint32 waypoint30) 21.65)
    (= (traverse-cost waypoint30 waypoint29) 7.18)
    (= (traverse-cost waypoint29 waypoint24) 28.76)
    (= (traverse-cost waypoint24 waypoint19) 31.64)
    (= (traverse-cost waypoint19 waypoint42) 31.11)
    (= (traverse-cost waypoint42 waypoint37) 31.48)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data7)
))
)
