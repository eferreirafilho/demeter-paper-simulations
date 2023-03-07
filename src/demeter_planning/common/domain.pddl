; Demeter Domain - Get data and measure vortexes

(define (domain demeter-domain-with-weather) 
    (:requirements :typing :fluents :timed-initial-literals :equality :preferences :constraints :durative-actions :duration-inequalities)

    (:types
        vehicle waypoint data vortex tide
    )

    (:functions
        (battery-amount ?v - vehicle)
        (recharge-rate ?v - vehicle)
        (traverse-cost ?f - waypoint ?t - waypoint )
        (battery-capacity)
        (total-missions-completed)
        (speed ?v - vehicle)
    )

    (:predicates
        (can-move ?x - waypoint ?y - waypoint)
        (is-in ?d - data ?w - waypoint)
        (is-in-vortex ?vx - vortex ?w - waypoint)
        (been-at ?v - vehicle ?w - waypoint)
        (carry ?v - vehicle ?d - data)
        (at ?v - vehicle ?w - waypoint)
        (is-surfaced ?v - vehicle)
        (data-sent ?d - data)
        (empty ?v - vehicle)
        (recharging ?v - vehicle)
        (vortex-data-measured ?vx - vortex)
        (tide-low ?td - tide)
    )
    ;define actions here
    (:durative-action move
        :parameters (?v - vehicle ?y ?z - waypoint)
        :duration(= ?duration (* (traverse-cost ?y ?z) (speed ?v)))
        :condition (and 
            (over all (can-move ?y ?z)) 
            (at start (at ?v ?y))
            (at start (> (battery-amount ?v) (traverse-cost ?y ?z)))
            (over all (is-surfaced ?v)))
           
        :effect (and 
            (at end (at ?v ?z))
            (at end (been-at ?v ?y))
            (at start (not (at ?v ?y)))
            (at start (decrease (battery-amount ?v) (traverse-cost ?y ?z)))
            )
    )
    
    (:durative-action submerge-mission
        :parameters (?v - vehicle ?d - data ?w - waypoint ?td - tide)
        :duration(= ?duration 1)
        :condition (and 
            (over all (tide-low ?td))
            (over all (is-in ?d ?w))
            (over all (at ?v ?w))
            (at start (empty ?v))
            (at start (>= (battery-amount ?v) 70))
        )
        :effect (and 
            (at end (not (is-in ?d ?w)))
            (at end (carry ?v ?d))
            (at end (not (empty ?v)))
            (at start (decrease (battery-amount ?v) 70))
            (at start (not (is-surfaced ?v)))
            (at end (is-surfaced ?v))
    )
    )
    (:durative-action measure-vortex
        :parameters (?v - vehicle ?vx - vortex ?w - waypoint)
        :duration(= ?duration 0.5)
        :condition (and
            (at start (is-in-vortex ?vx ?w))
            (over all (at ?v ?w))
            (at start (>= (battery-amount ?v) 20))
        )
        :effect (and 
            (at end (not (is-in-vortex ?vx ?w)))
            (at start (decrease (battery-amount ?v) 20))
            (at start (not (is-surfaced ?v)))
            (at end (is-surfaced ?v))
            (at end (vortex-data-measured ?vx))
            (at end (increase (total-missions-completed) 1))
    )
    )

    (:durative-action transmit-data
        :parameters (?v - vehicle ?d - data ?w - waypoint)
        :duration (= ?duration 0.1)
        :condition (and 
            (at start (carry ?v ?d))
            (at start (> (battery-amount ?v) 10))
            (over all (is-surfaced ?v)))
        
        :effect (and 
            (at end (is-in ?d ?w))
            (at end (not (carry ?v ?d)))
            (at end (data-sent ?d))
            (at end (empty ?v))     
            (at start (decrease (battery-amount ?v) 10))   
            (at end (increase (total-missions-completed) 100))
            )
    )
    (:durative-action recharge
        :parameters (?v - vehicle)
        :duration 
            (= ?duration
                (/ (- 100 (battery-amount ?v)) (recharge-rate ?v)))
        :condition (and 
            (over all (is-surfaced ?v))
            (at start (< (battery-amount ?v) 100))
        )
        :effect (and
            (at end (increase (battery-amount ?v) (* ?duration (recharge-rate ?v))))
        )
            
    )
)