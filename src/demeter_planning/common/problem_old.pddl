(define (problem task)
(:domain d_tank)
(:objects
    vehicle1 - vehicle
    wp0 wp1 wp2 wp3 wp4 wp5 wp6 - waypoint
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

    (can-find wp0 wp1)
    (can-find wp2 wp3)
    (can-find wp5 wp6)

    (is-in data1 wp1)

    (been-at vehicle1 wp0)
    (been-at vehicle1 wp1)
    (been-at vehicle1 wp2)
    (been-at vehicle1 wp3)
    (been-at vehicle1 wp4)
    (been-at vehicle1 wp5)
    (been-at vehicle1 wp6)



    (at vehicle1 wp0)

    (is-at-surface wp1)

    (data-sent data1)

    (empty vehicle1)

)
(:goal (and
    (data-sent data1)
    (at vehicle1 wp0)
))
(:metric minimize (total-time))
)