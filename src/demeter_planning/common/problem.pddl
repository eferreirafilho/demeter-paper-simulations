(define (problem task)
(:domain d_tank)
(:objects
    vehicle1 - vehicle
    wp0 wp1 wp2 wp3 - waypoint
    data1 - data
)
(:init
    (can-move wp0 wp1)
    (can-move wp1 wp0)
    (can-move wp1 wp2)
    (can-move wp2 wp0)
    (can-move wp0 wp3)
    (can-move wp3 wp0)



    (at vehicle1 wp0)

    (is-at-surface wp0)


    (empty vehicle1)

    (localized vehicle1)


)
(:goal (and
    (at vehicle1 wp2)
))
(:metric minimize (total-time))
)
