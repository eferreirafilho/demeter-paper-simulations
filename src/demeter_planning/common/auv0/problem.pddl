(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint2 waypoint12 - waypoint
    data2 - data
    currenttide - tide
<<<<<<< HEAD
    currentwaves - waves
    turbine4 - turbine
=======
    turbine2 - turbine
>>>>>>> 5476e431aaf27751ed6bf21260b6d7121752a8c7
)
(:init
    (can-move wp_init_auv0 waypoint2)
    (can-move waypoint2 waypoint12)

    (is-in data2 turbine2)


    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)

    (tide-low currenttide)

<<<<<<< HEAD
    (at 111.355 (not (tide-low currenttide)))
    (at 511.38 (tide-low currenttide))
    (at 711.415 (not (tide-low currenttide)))
    (at 1111.43 (tide-low currenttide))
    (at 1311.46 (not (tide-low currenttide)))
    (at 1711.5 (tide-low currenttide))
    (at 1911.52 (not (tide-low currenttide)))
    (at 2311.53 (tide-low currenttide))
    (at 2511.57 (not (tide-low currenttide)))
    (at 2911.62 (tide-low currenttide))
    (at 3111.65 (not (tide-low currenttide)))
=======
    (at 118.67 (not (tide-low currenttide)))
    (at 358.695 (tide-low currenttide))
    (at 478.715 (not (tide-low currenttide)))
    (at 718.745 (tide-low currenttide))
    (at 838.765 (not (tide-low currenttide)))
    (at 1078.79 (tide-low currenttide))
    (at 1198.81 (not (tide-low currenttide)))
    (at 1438.83 (tide-low currenttide))
    (at 1558.86 (not (tide-low currenttide)))
    (at 1798.88 (tide-low currenttide))
    (at 1918.9 (not (tide-low currenttide)))
>>>>>>> 5476e431aaf27751ed6bf21260b6d7121752a8c7


    (is-turbine-wp waypoint12 turbine2)

    (idle vehicle0)


<<<<<<< HEAD
    (not-high-waves currentwaves)

    (at 2911.34 (not (not-high-waves currentwaves)))
    (at 3511.36 (not-high-waves currentwaves))
    (at 6511.39 (not (not-high-waves currentwaves)))
    (at 7111.42 (not-high-waves currentwaves))

=======
>>>>>>> 5476e431aaf27751ed6bf21260b6d7121752a8c7
    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 5)

<<<<<<< HEAD
    (= (traverse-cost wp_init_auv0 waypoint19) 6.44)
    (= (traverse-cost waypoint19 waypoint20) 7.18)
    (= (traverse-cost waypoint20 waypoint22) 26.07)
=======
    (= (traverse-cost wp_init_auv0 waypoint2) 6.32)
    (= (traverse-cost waypoint2 waypoint12) 41.72)
>>>>>>> 5476e431aaf27751ed6bf21260b6d7121752a8c7

    (= (speed vehicle0) 0.65)

)
(:goal (and
    (data-sent data2)
))
)
