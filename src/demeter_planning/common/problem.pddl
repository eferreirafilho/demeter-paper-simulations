(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle2 - vehicle
    wp_init_auv2 waypoint14 waypoint42 waypoint15 waypoint2 waypoint19 waypoint52 waypoint57 waypoint62 - waypoint
    data8 data0 data12 - data
    currenttide - tide
    turbine8 turbine0 turbine12 - turbine
)
(:init
    (can-move wp_init_auv2 waypoint14)
    (can-move waypoint14 waypoint42)
    (can-move waypoint14 waypoint15)
    (can-move waypoint15 waypoint2)
    (can-move waypoint14 waypoint19)
    (can-move waypoint19 waypoint52)
    (can-move waypoint52 waypoint57)
    (can-move waypoint57 waypoint62)

    (is-in data0 turbine0)
    (is-in data12 turbine12)


    (at vehicle2 waypoint42)
    (at vehicle2 wp_init_auv2)

    (is-surfaced vehicle2)

    (data-sent data8)

    (empty vehicle2)


    ; (at 0.94 (not (tide-low currenttide)))
    ; (at 240.965 (tide-low currenttide))
    ; (at 360.98 (not (tide-low currenttide)))
    (at 600.995 (tide-low currenttide))
    (at 721.01 (not (tide-low currenttide)))
    (at 961.03 (tide-low currenttide))
    (at 1081.05 (not (tide-low currenttide)))
    (at 1321.06 (tide-low currenttide))
    (at 1441.08 (not (tide-low currenttide)))
    (at 128.925 (tide-low currenttide))
    (at 248.94 (not (tide-low currenttide)))
    (at 488.955 (tide-low currenttide))
    (at 608.975 (not (tide-low currenttide)))
    (at 848.99 (tide-low currenttide))
    (at 969.005 (not (tide-low currenttide)))
    (at 1209.08 (tide-low currenttide))
    (at 1329.11 (not (tide-low currenttide)))
    (at 1569.13 (tide-low currenttide))
    (at 1689.16 (not (tide-low currenttide)))
    (at 149.84 (tide-low currenttide))
    (at 269.86 (not (tide-low currenttide)))
    (at 509.895 (tide-low currenttide))
    (at 629.91 (not (tide-low currenttide)))
    (at 869.94 (tide-low currenttide))
    (at 989.945 (not (tide-low currenttide)))
    (at 1229.97 (tide-low currenttide))
    (at 1349.99 (not (tide-low currenttide)))
    (at 1590.02 (tide-low currenttide))
    (at 1710.04 (not (tide-low currenttide)))

    (cable-localized turbine8)

    (is-turbine-wp waypoint42 turbine8)
    (is-turbine-wp waypoint2 turbine0)
    (is-turbine-wp waypoint62 turbine12)

    (idle vehicle2)


    (= (battery-level vehicle2) 100)

    (= (recharge-rate vehicle2) 0.05)

    (= (recharge-rate-dedicated vehicle2) 5)

    (= (traverse-cost wp_init_auv2 waypoint14) 6.05)
    (= (traverse-cost waypoint14 waypoint42) 9.14)
    (= (traverse-cost waypoint14 waypoint15) 7.18)
    (= (traverse-cost waypoint15 waypoint2) 64.33)
    (= (traverse-cost waypoint14 waypoint19) 28.86)
    (= (traverse-cost waypoint19 waypoint52) 33.16)
    (= (traverse-cost waypoint52 waypoint57) 28.44)
    (= (traverse-cost waypoint57 waypoint62) 30.81)

    (= (speed vehicle2) 0.35)

)
(:goal (and
    (data-sent data8)
    (data-sent data0)
    (data-sent data12)
))
)
