; Demeter Domain - Get data

(define (domain demeter-domain) 
    (:requirements :typing :fluents :timed-initial-literals :equality :constraints :durative-actions :duration-inequalities)

    (:types
        vehicle waypoint data tide turbine
    )

    (:functions
        (battery-level ?v - vehicle)
        (recharge-rate ?v - vehicle)
        (recharge-rate-dedicated ?v - vehicle)
        (traverse-cost ?f - waypoint ?t - waypoint )
        ; (total-missions-completed ?v - vehicle)
        (speed ?v - vehicle)
    )

    (:predicates
        (can-move ?x - waypoint ?y - waypoint)
        (is-in ?d - data ?tu - turbine)
        (carry ?v - vehicle ?d - data)
        (at ?v - vehicle ?w - waypoint)
        (is-surfaced ?v - vehicle)
        (data-sent ?d - data)
        (empty ?v - vehicle)
        (tide-low ?td - tide)
        ; (not-low-tide ?td - tide)
        ; (waiting-for-tide ?v - vehicle ?td - tide)
        (cable-localized ?tu - turbine)
        (is-turbine-wp ?w - waypoint ?tu - turbine)
        (idle ?v - vehicle)
    (is-submerged ?v - vehicle)
)
    ;define actions here
    (:durative-action move
        :parameters (?v - vehicle ?y ?z - waypoint)
        :duration(= ?duration (/ (traverse-cost ?y ?z) (speed ?v)))
        :condition (and 
            (over all (can-move ?y ?z)) 
            (at start (at ?v ?y))
            (at start (> (battery-level ?v) (traverse-cost ?y ?z)))
            (over all (is-surfaced ?v)))
                   
        :effect (and 
            (at end (at ?v ?z))
            ; (at end (been-at ?v ?y))
            (at start (not (at ?v ?y)))
            (at start (decrease (battery-level ?v) (traverse-cost ?y ?z)))
            ; (at end (increase (battery-level ?v) (* ?duration (recharge-rate ?v))))
            (at start (not (idle ?v)))
            (at end (idle ?v))
            )
    )

    ;define actions here
    (:durative-action localize-cable
        :parameters (?v - vehicle ?w - waypoint ?tu - turbine)
        :duration(= ?duration 10)
        :condition (and 
            (at start (at ?v ?w))
            (over all (is-turbine-wp ?w ?tu))
            (at start (>= (battery-level ?v) 5))
            (over all (is-surfaced ?v))
        )
        :effect (and 
            (at end (cable-localized ?tu))
            (at start (decrease (battery-level ?v) 5))
            ; (at end (increase (battery-level ?v) (* ?duration (recharge-rate ?v))))
            (at start (not (idle ?v)))
            (at end (idle ?v))
            (at end (is-submerged ?v))
            (at end (not (is-surfaced ?v)))
        )
    )

    ; (:durative-action wait-for-low-tide
    ;     :parameters (?v - vehicle ?td - tide)
    ;     :duration (= ?duration 1)
    ;     :condition (and 
    ;         (at start (not-low-tide ?td))
    ;         ; (over all (idle ?v))
    ;         (over all (is-surfaced ?v))
    ;     )
    ;     :effect (and 
    ;         (at start (waiting-for-tide ?v ?td))
    ;         (at end (not (waiting-for-tide ?v ?td)))
    ;         (at start (not (idle ?v)))
    ;         (at end (idle ?v))
    ;     )
    ; )

    (:durative-action retrieve-data
        :parameters (?v - vehicle ?d - data ?w - waypoint ?td - tide ?tu - turbine)
        :duration(= ?duration 30)
        :condition (and 
            (over all (cable-localized ?tu))
            (over all (is-turbine-wp ?w ?tu))
            (over all (tide-low ?td))
            (over all (is-in ?d ?tu))
            (over all (at ?v ?w))
            (at start (empty ?v))
            (at start (>= (battery-level ?v) 100))
            (at start (is-surfaced ?v))
        )
        :effect (and 
            (at end (not (is-in ?d ?tu)))
            (at end (carry ?v ?d))
            (at end (not (empty ?v)))
            (at start (decrease (battery-level ?v) 80))
            (at start (not (is-surfaced ?v)))
            ; (at end (is-surfaced ?v))
            (at start (is-submerged ?v))
            ; (at end (not (is-submerged ?v)))
            (at start (not (idle ?v)))
            (at end (idle ?v))
        )
    )

    (:durative-action upload-data-histograms
        :parameters (?v - vehicle ?d - data)
        :duration (= ?duration 2)
        :condition (and 
            (at start (carry ?v ?d))
            (at start (> (battery-level ?v) 50))
            (over all (is-surfaced ?v)))
        
        :effect (and 
            (at end (not (carry ?v ?d)))
            (at end (data-sent ?d))
            (at end (empty ?v))     
            (at start (decrease (battery-level ?v) 50))
            ; (at end (increase (battery-level ?v) (* ?duration (recharge-rate ?v))))
            )
    )
     (:durative-action surface
        :parameters (?v - vehicle)
        :duration 
            (= ?duration 2)
        :condition (and 
            (at start  (is-submerged ?v))
            (over all (idle ?v))
        )
        :effect (and
            (at end (not (is-submerged ?v)))
            (at end (is-surfaced ?v))
            (at start (not (idle ?v)))
            (at end (idle ?v))
        )
    )
    (:durative-action harvest-energy
    :parameters (?v - vehicle)
    :duration (= ?duration 1) ; fixed duration
    :condition (and 
        (over all (is-surfaced ?v))
        (at start (< (battery-level ?v) 100))
        (over all (idle ?v))
    )
    :effect (and
        (at end (increase (battery-level ?v) (recharge-rate-dedicated ?v))) ; increase battery level by recharge-rate-dedicated per time unit
        (at start (not (idle ?v)))
        (at end (idle ?v))
    )
)

)