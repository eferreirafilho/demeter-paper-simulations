(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint19 waypoint42 waypoint40 waypoint39 waypoint67 - waypoint
    data13 - data
    currenttide - tide
    currentwaves - waves
    turbine13 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint19)
    (can-move waypoint19 waypoint42)
    (can-move waypoint42 waypoint40)
    (can-move waypoint40 waypoint39)
    (can-move waypoint39 waypoint67)

    (is-in data13 turbine13)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

    (at 233.69 (not (tide-low currenttide)))
    (at 1033.69 (tide-low currenttide))
    (at 1433.75 (not (tide-low currenttide)))
    (at 2233.8 (tide-low currenttide))
    (at 2633.89 (not (tide-low currenttide)))
    (at 3433.96 (tide-low currenttide))
    (at 3834.01 (not (tide-low currenttide)))
    (at 4634.1 (tide-low currenttide))
    (at 5034.15 (not (tide-low currenttide)))
    (at 5834.22 (tide-low currenttide))
    (at 6234.3 (not (tide-low currenttide)))


    (is-turbine-wp waypoint67 turbine13)

    (idle vehicle1)


    (not-high-waves currentwaves)

    (at 3433.57 (not (not-high-waves currentwaves)))
    (at 4633.64 (not-high-waves currentwaves))
    (at 10633.7 (not (not-high-waves currentwaves)))
    (at 11833.8 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint19) 5.81)
    (= (traverse-cost waypoint19 waypoint42) 31.11)
    (= (traverse-cost waypoint42 waypoint40) 26.32)
    (= (traverse-cost waypoint40 waypoint39) 7.18)
    (= (traverse-cost waypoint39 waypoint67) 33.7)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data13)
))
)
