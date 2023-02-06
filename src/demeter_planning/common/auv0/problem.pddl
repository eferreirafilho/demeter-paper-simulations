(define (problem task)
(:domain d_tank)
(:objects
    vehicle1 - vehicle
    wp0 wp1 wp2 wp3 wp4 wp5 wp6 wp7 wp8 wp9 - waypoint
    data1 - data
)
(:init
    (can-move wp0 wp1)
    (can-move wp1 wp0)
    (can-move wp1 wp2)
    (can-move wp2 wp0)
    (can-move wp2 wp3)
    (can-move wp3 wp0)
    (can-move wp3 wp4)
    (can-move wp4 wp0)
    (can-move wp4 wp5)
    (can-move wp5 wp0)
    (can-move wp5 wp6)
    (can-move wp6 wp0)
    (can-move wp6 wp7)
    (can-move wp7 wp0)
    (can-move wp7 wp8)
    (can-move wp8 wp0)
    (can-move wp2 wp9)
    (can-move wp9 wp2)

    (is-in data1 wp8)


    (at vehicle1 wp9)

    (is-at-surface wp0)


    (empty vehicle1)

)
(:goal (and
    (data-sent data1)
))
(:metric minimize (total-time))
)
