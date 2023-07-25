(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
<<<<<<< HEAD
    wp_init_auv1 waypoint29 waypoint26 waypoint6 waypoint2 - waypoint
    data0 - data
    currenttide - tide
    currentwaves - waves
    turbine0 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint29)
    (can-move waypoint29 waypoint26)
    (can-move waypoint26 waypoint6)
    (can-move waypoint6 waypoint2)

    (is-in data0 turbine0)
=======
    wp_init_auv1 waypoint32 waypoint30 waypoint29 waypoint24 waypoint47 - waypoint
    data9 - data
    currenttide - tide
    turbine9 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint32)
    (can-move waypoint32 waypoint30)
    (can-move waypoint30 waypoint29)
    (can-move waypoint29 waypoint24)
    (can-move waypoint24 waypoint47)

    (is-in data9 turbine9)
>>>>>>> 5476e431aaf27751ed6bf21260b6d7121752a8c7


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)


    (empty vehicle1)

    (tide-low currenttide)

<<<<<<< HEAD
    (at 109.225 (not (tide-low currenttide)))
    (at 509.255 (tide-low currenttide))
    (at 709.285 (not (tide-low currenttide)))
    (at 1109.31 (tide-low currenttide))
    (at 1309.34 (not (tide-low currenttide)))
    (at 1709.37 (tide-low currenttide))
    (at 1909.39 (not (tide-low currenttide)))
    (at 2309.42 (tide-low currenttide))
    (at 2509.45 (not (tide-low currenttide)))
    (at 2909.47 (tide-low currenttide))
    (at 3109.5 (not (tide-low currenttide)))


    (is-turbine-wp waypoint2 turbine0)
=======
    (at 118.53 (not (tide-low currenttide)))
    (at 358.555 (tide-low currenttide))
    (at 478.585 (not (tide-low currenttide)))
    (at 718.61 (tide-low currenttide))
    (at 838.65 (not (tide-low currenttide)))
    (at 1078.67 (tide-low currenttide))
    (at 1198.72 (not (tide-low currenttide)))
    (at 1438.8 (tide-low currenttide))
    (at 1558.82 (not (tide-low currenttide)))
    (at 1798.85 (tide-low currenttide))
    (at 1918.87 (not (tide-low currenttide)))


    (is-turbine-wp waypoint47 turbine9)
>>>>>>> 5476e431aaf27751ed6bf21260b6d7121752a8c7

    (idle vehicle1)


<<<<<<< HEAD
    (not-high-waves currentwaves)

    (at 2909.2 (not (not-high-waves currentwaves)))
    (at 3509.22 (not-high-waves currentwaves))
    (at 6509.26 (not (not-high-waves currentwaves)))
    (at 7109.29 (not-high-waves currentwaves))

    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint29) 7.07)
    (= (traverse-cost waypoint29 waypoint26) 38.43)
    (= (traverse-cost waypoint26 waypoint6) 62.59)
    (= (traverse-cost waypoint6 waypoint2) 13.47)

    (= (speed vehicle1) 0.65)

)
(:goal (and
    (data-sent data0)
=======
    (= (battery-level vehicle1) 100)

    (= (recharge-rate vehicle1) 0.05)

    (= (recharge-rate-dedicated vehicle1) 5)

    (= (traverse-cost wp_init_auv1 waypoint32) 8.16)
    (= (traverse-cost waypoint32 waypoint30) 21.65)
    (= (traverse-cost waypoint30 waypoint29) 7.18)
    (= (traverse-cost waypoint29 waypoint24) 28.76)
    (= (traverse-cost waypoint24 waypoint47) 33.66)

    (= (speed vehicle1) 0.35)

)
(:goal (and
    (data-sent data9)
>>>>>>> 5476e431aaf27751ed6bf21260b6d7121752a8c7
))
)
