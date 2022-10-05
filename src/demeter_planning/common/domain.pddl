(define (domain d_tank) 
    (:requirements :typing :fluents :durative-actions :duration-inequalities :negative-preconditions)

    (:types
        vehicle waypoint data   
    )

    (:predicates
        (can-move ?x - waypoint ?y - waypoint)
        (is-in ?d - data ?w - waypoint)
        (carry ?v - vehicle ?d - data)
        (at ?v - vehicle ?w - waypoint)
        (is-at-surface ?w - waypoint)
        (data-sent ?d - data)
        (empty ?v - vehicle)
        (localized ?v - vehicle)
        (not-localized ?v - vehicle)
    )
    ; Action Move
    (:durative-action move
        :parameters (?v - vehicle ?y ?z - waypoint)
        :duration(= ?duration 60)
        :condition (and 
            (over all (can-move ?y ?z)) 
            (at start (at ?v ?y))
            (at start (localized ?v))
            (over all (localized ?v))
        )
        :effect (and 
            (at end (at ?v ?z))
            (at start (not (at ?v ?y)))
            )
    )
    
    ; Get sensor data form underwater waypoint - Fixed time
    (:durative-action get_data
        :parameters (?v - vehicle ?d - data ?w - waypoint)
        :duration(= ?duration 10)
        :condition (and 
            (at start (is-in ?d ?w))
            (over all (at ?v ?w))
            (at start (empty ?v))
            (over all (localized ?v))
        )
        :effect (and 
            (at end (not (is-in ?d ?w)))
            (at end (carry ?v ?d))
            (at end (not (empty ?v)))
    )
    )
    ; Transmit Sensor from surface
    (:durative-action transmit_data
        :parameters (?v - vehicle ?d - data ?w - waypoint)
        :duration (= ?duration 10)
        :condition (and 
            (at start (is-at-surface ?w))
            (over all (at ?v ?w))
            (at start (carry ?v ?d))
            (over all (localized ?v))
            )
        :effect (and 
            (at end (not (carry ?v ?d)))
            (at end (data-sent ?d))
            (at end (empty ?v))     
            )
    
    )

)