(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint19 waypoint42 waypoint40 waypoint72 - waypoint
    data14 - data
    currenttide - tide
    currentwaves - waves
    turbine14 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint19)
    (can-move waypoint19 waypoint42)
    (can-move waypoint42 waypoint40)
    (can-move waypoint40 waypoint72)

    (is-in data14 turbine14)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 179.51 (not (tide-low currenttide)))
    (at 779.635 (tide-low currenttide))
    (at 1079.64 (not (tide-low currenttide)))
    (at 1679.79 (tide-low currenttide))
    (at 1979.87 (not (tide-low currenttide)))
    (at 2579.91 (tide-low currenttide))
    (at 2880.07 (not (tide-low currenttide)))
    (at 3480.15 (tide-low currenttide))
    (at 3780.19 (not (tide-low currenttide)))
    (at 4380.24 (tide-low currenttide))
    (at 4680.37 (not (tide-low currenttide)))


    (is-turbine-wp waypoint72 turbine14)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 1679.47 (not (not-high-waves currentwaves)))
    (at 2579.55 (not-high-waves currentwaves))
    (at 7079.55 (not (not-high-waves currentwaves)))
    (at 7979.62 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint19) 5.82)
    (= (traverse-cost waypoint19 waypoint42) 31.11)
    (= (traverse-cost waypoint42 waypoint40) 26.32)
    (= (traverse-cost waypoint40 waypoint72) 16.76)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data14)
))
)
