(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint67 waypoint39 waypoint40 waypoint42 waypoint15 waypoint17 - waypoint
    data3 - data
    currenttide - tide
    currentwaves - waves
    turbine3 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint67)
    (can-move waypoint67 waypoint39)
    (can-move waypoint39 waypoint40)
    (can-move waypoint40 waypoint42)
    (can-move waypoint42 waypoint15)
    (can-move waypoint15 waypoint17)

    (is-in data3 turbine3)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

    (at 72.79 (not (tide-low currenttide)))
    (at 672.905 (tide-low currenttide))
    (at 972.98 (not (tide-low currenttide)))
    (at 1573.05 (tide-low currenttide))
    (at 1873.13 (not (tide-low currenttide)))
    (at 2473.19 (tide-low currenttide))
    (at 2773.34 (not (tide-low currenttide)))
    (at 3373.41 (tide-low currenttide))
    (at 3673.53 (not (tide-low currenttide)))
    (at 4273.65 (tide-low currenttide))
    (at 4573.72 (not (tide-low currenttide)))


    (is-turbine-wp waypoint17 turbine3)

    (idle vehicle0)


    (not-high-waves currentwaves)

    (at 1572.72 (not (not-high-waves currentwaves)))
    (at 2472.76 (not-high-waves currentwaves))
    (at 6972.89 (not (not-high-waves currentwaves)))
    (at 7872.98 (not-high-waves currentwaves))

    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

    (= (traverse-cost wp_init_auv0 waypoint67) 7.54)
    (= (traverse-cost waypoint67 waypoint39) 33.7)
    (= (traverse-cost waypoint39 waypoint40) 7.18)
    (= (traverse-cost waypoint40 waypoint42) 26.32)
    (= (traverse-cost waypoint42 waypoint15) 14.91)
    (= (traverse-cost waypoint15 waypoint17) 24.7)

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data3)
))
)
