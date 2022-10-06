(define (problem task)
(:domain d_tank)
(:objects
    vehicle1 - vehicle
    wp0 wp1 wp2 wp3 wp4 wp5 wp6 wp7 - waypoint
    data1 - data
)
(:init
    (can-move wp0 wp1)
    (can-move wp1 wp0)
    (can-move wp1 wp2)
    (can-move wp2 wp3)
    (can-move wp3 wp4)
    (can-move wp4 wp5)
    (can-move wp5 wp6)
    (can-move wp0 wp7)
    (can-move wp7 wp0)
    (can-move wp2 wp1)
    (can-move wp3 wp2)
    (can-move wp4 wp3)
    (can-move wp5 wp4)
    (can-move wp6 wp5)



    (at vehicle1 wp0)

    (is-at-surface wp0)

    (data-sent data1)

    (empty vehicle1)

    (localized vehicle1)


)
(:goal (and
    (at vehicle1 wp6)
))
(:metric minimize (total-time))
)
