; Demeter Domain - Get data and measure vortexes

(define (domain demeter-domain-with-weather) 
    (:requirements :typing :fluents :timed-initial-literals :equality :preferences :constraints :durative-actions :duration-inequalities)

    (:types
        vehicle waypoint data vortex tide turbine
    )

    (:functions
        (battery-amount ?v - vehicle)
        (recharge-rate ?v - vehicle)
        (recharge-rate-dedicated ?v - vehicle)
        (traverse-cost ?f - waypoint ?t - waypoint )
        (total-missions-completed ?v - vehicle)
        (speed ?v - vehicle)
    )

    (:predicates
        (can-move ?x - waypoint ?y - waypoint)
        (is-in ?d - data ?tu - turbine)
        (is-in-vortex ?vx - vortex ?w - waypoint)
        ; (been-at ?v - vehicle ?w - waypoint)
        (carry ?v - vehicle ?d - data)
        (at ?v - vehicle ?w - waypoint)
        (is-surfaced ?v - vehicle)
        (data-sent ?d - data)
        (empty ?v - vehicle)
        (vortex-data-measured ?vx - vortex)
        (tide-low ?td - tide)
        (cable-localized ?tu - turbine)
        (is-turbine-wp ?w - waypoint ?tu - turbine)
        (not-recharging ?v - vehicle)
        (idle ?v - vehicle)
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
            ; (at end (been-at ?v ?y))
            (at start (not (at ?v ?y)))
            (at start (decrease (battery-amount ?v) (traverse-cost ?y ?z)))
            (at end (increase (battery-amount ?v) (* ?duration (recharge-rate ?v))))
            (at start (not (idle ?v)))
            (at end (idle ?v))
            )
    )

    ;define actions here
    (:durative-action localize-cable
        :parameters (?v - vehicle ?w - waypoint ?tu - turbine)
        :duration(= ?duration 5)
        :condition (and 
            (at start (at ?v ?w))
            (over all (is-turbine-wp ?w ?tu))
            (at start (>= (battery-amount ?v) 5))
            (over all (is-surfaced ?v))
        )
        :effect (and 
            (at end (cable-localized ?tu))
            (at start (decrease (battery-amount ?v) 5))
            (at end (increase (battery-amount ?v) (* ?duration (recharge-rate ?v))))
            (at start (not (idle ?v)))
            (at end (idle ?v))
        )
    )
    
    (:durative-action submerge-mission
        :parameters (?v - vehicle ?d - data ?w - waypoint ?td - tide ?tu - turbine)
        :duration(= ?duration 200)
        :condition (and 
            (over all (cable-localized ?tu))
            (over all (is-turbine-wp ?w ?tu))
            (over all (tide-low ?td))
            (over all (is-in ?d ?tu))
            (over all (at ?v ?w))
            (at start (empty ?v))
            (at start (>= (battery-amount ?v) 80))
        )
        :effect (and 
            (at end (not (is-in ?d ?tu)))
            (at end (carry ?v ?d))
            (at end (not (empty ?v)))
            (at start (decrease (battery-amount ?v) 80))
            (at start (not (is-surfaced ?v)))
            (at end (is-surfaced ?v))
            (at start (not (idle ?v)))
            (at end (idle ?v))
        )
    )
    (:durative-action measure-vortex
        :parameters (?v - vehicle ?vx - vortex ?w - waypoint)
        :duration(= ?duration 1)
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
            (at end (increase (total-missions-completed ?v) 1))
            (at start (not (idle ?v)))
            (at end (idle ?v))
    )
    )

    (:durative-action transmit-data
        :parameters (?v - vehicle ?d - data)
        :duration (= ?duration 2)
        :condition (and 
            (at start (carry ?v ?d))
            (at start (> (battery-amount ?v) 50))
            (over all (is-surfaced ?v)))
        
        :effect (and 
            (at end (not (carry ?v ?d)))
            (at end (data-sent ?d))
            (at end (empty ?v))     
            (at start (decrease (battery-amount ?v) 50))
            (at end (increase (battery-amount ?v) (* ?duration (recharge-rate ?v))))
            (at end (increase (total-missions-completed ?v) 100))

            ;not idle and idle effects commented allows for other actions to run in pararell with this
            ; (at start (not (idle ?v)))
            ; (at end (idle ?v))
            )
    )
    (:durative-action wait-to-recharge
        :parameters (?v - vehicle)
        :duration 
            (= ?duration
                (/ (- 100 (battery-amount ?v)) (recharge-rate-dedicated ?v))
                )
        :condition (and 
            (over all (is-surfaced ?v))
            ; (over all (at ?v ?w))
            (at start (< (battery-amount ?v) 100))
            ; (at start (not-recharging ?v))
            (over all (idle ?v))
        )
        :effect (and
            (at end (increase (battery-amount ?v) (* ?duration (recharge-rate-dedicated ?v))))
            ; (at start (not (not-recharging ?v)))
            ; (at end (not-recharging ?v))
            (at start (not (idle ?v)))
            (at end (idle ?v))
        )
    )
)