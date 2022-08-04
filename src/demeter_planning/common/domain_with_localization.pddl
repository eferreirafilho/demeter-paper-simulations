; Simple Demeter read sensor tank domain
; With durative actions
; To be used in the Spike Demo
; Actions: Move, find, get data, transmit data
; edsonbffilho@gmail.com

(define (domain d_tank) 
    (:requirements :typing :fluents :durative-actions :duration-inequalities :negative-preconditions)

    (:types
        vehicle waypoint data   
    )

    (:predicates
        (can-move ?x - waypoint ?y - waypoint)
        (can-find ?x - waypoint ?y - waypoint)
        (is-in ?d - data ?w - waypoint)
        (been-at ?v - vehicle ?w - waypoint) ; been at waypoint
        (has-found ?v - vehicle ?w - waypoint) ; been at waypoint
        (carry ?v - vehicle ?d - data)
        (at ?v - vehicle ?w - waypoint)
        (is-at-surface ?w - waypoint)
        (data-sent ?d - data)
        (empty ?v - vehicle)
    )
    ;define actions here
    (:durative-action move
        :parameters (?v - vehicle ?y ?z - waypoint)
        :duration(= ?duration 55)
        :condition (and 
            (over all (can-move ?y ?z)) 
            (at start (at ?v ?y))
        )
        :effect (and 
            (at end (at ?v ?z))
            (at end (been-at ?v ?y))
            (at start (not (at ?v ?y)))
            )
    )

    (:durative-action find
        :parameters (?v - vehicle ?y ?z - waypoint)
        :duration(= ?duration 15)
        :condition (and 
            (over all (can-find ?y ?z)) 
            (at start (at ?v ?y))
        )
        :effect (and 
            ;(at end (at ?v ?z))
            (at end (has-found ?v ?y))
            (at end (can-move ?y ?z)) ; allow moviment from-middle 
            ;(at end (can-move ?w ?z)) ; allow moviment middle-to  
            )
    )
        
    ; Get sensor data form underwater waypoint - Fixed time
    (:durative-action get_data
        :parameters (?v - vehicle ?d - data ?w - waypoint)
        :duration(= ?duration 20)
        :condition (and 
            (at start (is-in ?d ?w))
            (over all (at ?v ?w))
            (at start (empty ?v))
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
            (at start (carry ?v ?d)))
        
        :effect (and 
            (at end (is-in ?d ?w))
            (at end (not (carry ?v ?d)))
            (at end (data-sent ?d))
            (at end (empty ?v))     

            )
    
    )

)