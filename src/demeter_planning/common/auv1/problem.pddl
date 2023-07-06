(define (problem task)
(:domain demeter-domain)
(:objects
    vehicle1 - vehicle
    wp_init_auv1 waypoint73 waypoint72 - waypoint
    data14 - data
    currenttide - tide
    turbine14 - turbine
)
(:init
    (can-move wp_init_auv1 waypoint73)
    (can-move waypoint73 waypoint72)

    (is-in data14 turbine14)


    (at vehicle1 wp_init_auv1)

    (is-surfaced vehicle1)















)
(:goal (and
))
)
