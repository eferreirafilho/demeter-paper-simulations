(define (problem task)
(:domain demeter-domain-with-weather)
(:objects
    vehicle0 - vehicle
    wp_init_auv0 waypoint42 waypoint40 waypoint36 waypoint32 waypoint54 - waypoint
    data13 - data
    currenttide - tide
    turbine13 - turbine
)
(:init
    (can-move wp_init_auv0 waypoint42)
    (can-move waypoint42 waypoint40)
    (can-move waypoint40 waypoint36)
    (can-move waypoint36 waypoint32)
    (can-move waypoint32 waypoint54)

    (is-in data13 turbine13)



    (at vehicle0 wp_init_auv0)

    (is-surfaced vehicle0)


    (empty vehicle0)


    (tide-low currenttide)


    (is-turbine-wp waypoint54 turbine13)

    (not-recharging vehicle0)



    (= (battery-level vehicle0) 100)

    (= (recharge-rate vehicle0) 0.05)

    (= (recharge-rate-dedicated vehicle0) 10)

    (= (traverse-cost wp_init_auv0 waypoint42) 1.18)
    (= (traverse-cost waypoint42 waypoint40) 13.08)
    (= (traverse-cost waypoint40 waypoint36) 14.685)
    (= (traverse-cost waypoint36 waypoint32) 15.85)
    (= (traverse-cost waypoint32 waypoint54) 18.25)

    (= (total-missions-completed vehicle0) 0)

    (= (speed vehicle0) 0.3)

)
(:goal (and
    (data-sent data13)
))
)
