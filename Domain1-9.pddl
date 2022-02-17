(define (domain Domain1)

    (:requirements
        :strips
    )

    (:predicates
        (LOCATION ?l)
        (BOX ?b)
        (VEHICLE ?v) (TRUCK ?t) (TRAIN ?t)
        
        (conn ?v ?l1 ?l1)
        
        (box_at ?b ?l) (box_down ?b) 
        (box_on_truck ?b ?t) (box_on_train ?b ?t)
        (different_boxes ?b1 ?b2 ?b3 ?b4)
        
        (truck_at ?t ?l) (truck_free ?t) (truck_full ?t)
        
        (train_at ?t ?l) (train_free ?t) (train_full ?t)
        
    )

    (:action move_truck
        :parameters (?t ?l1 ?l2)
        :precondition   (and    (TRUCK ?t) (VEHICLE ?t)
                                (LOCATION ?l1) (LOCATION ?l2)
                                (conn ?t ?l1 ?l2)
                                (truck_at ?t ?l1)
        
                        )
        :effect (and    (not(truck_at ?t ?l1))
                        (truck_at ?t ?l2)
                )
    )
    
    (:action move_train
        :parameters (?t ?l1 ?l2)
        :precondition   (and    (TRAIN ?t) (VEHICLE ?t)
                                (LOCATION ?l1) (LOCATION ?l2)
                                (train_full ?t)
                                (conn ?t ?l1 ?l2)
                                (train_at ?t ?l1)
        
                        )
        :effect (and    (not(train_at ?t ?l1))
                        (train_at ?t ?l2)
                )
    )
    (:action move_train_free
        :parameters (?t ?l1 ?l2)
        :precondition   (and    (TRAIN ?t) (VEHICLE ?t)
                                (LOCATION ?l1) (LOCATION ?l2)
                                (train_free ?t)
                                (conn ?t ?l1 ?l2)
                                (train_at ?t ?l1)
        
                        )
        :effect (and    (not(train_at ?t ?l1))
                        (train_at ?t ?l2)
                )
    )
    
    (:action load_truck
        :parameters (?t ?l ?b)
        :precondition   (and    (TRUCK ?t) (VEHICLE ?t)
                                (LOCATION ?l) (BOX ?b)
                                
                                (truck_at ?t ?l) (truck_free ?t)
                                
                                (box_at ?b ?l) (box_down ?b)
        
                        )
        :effect (and    (not (box_down ?b))
                        (not (box_at ?b ?l))
                        (box_on_truck ?b ?t)
                        (not(truck_free ?t))
                        (truck_full ?t)
                )
    )
    
    (:action unload_truck
        :parameters (?t ?l ?b)
        :precondition   (and    (TRUCK ?t) (VEHICLE ?t)
                                (LOCATION ?l) (BOX ?b)
                                
                                (truck_at ?t ?l) (truck_full ?t)
                                
                                (box_on_truck ?b ?t)
        
                        )
        :effect (and    (box_down ?b)
                        (not (box_on_truck ?b ?t))
                        (box_at ?b ?l)
                        (not (truck_full ?t))
                        (truck_free ?t)
                )
    )
    
    (:action load_train
        :parameters (?t ?l ?b1 ?b2 ?b3 ?b4)
        :precondition   (and    (TRAIN ?t) (VEHICLE ?t)
                                (LOCATION ?l) 
                                (BOX ?b1) (BOX ?b2) (BOX ?b3) (BOX ?b4)
                                (different_boxes ?b1 ?b2 ?b3 ?b4)
                                
                                (train_at ?t ?l) (train_free ?t)
                                
                                (box_at ?b1 ?l) (box_down ?b1)
                                (box_at ?b2 ?l) (box_down ?b2)
                                (box_at ?b3 ?l) (box_down ?b3)
                                (box_at ?b4 ?l) (box_down ?b4)
        
                        )
        :effect (and    (not (box_down ?b1)) (not (box_down ?b2))
                        (not (box_down ?b3)) (not (box_down ?b4))
                        
                        (not (box_at ?b1 ?l)) (not (box_at ?b2 ?l))
                        (not (box_at ?b3 ?l)) (not (box_at ?b4 ?l))
                        
                        (box_on_train ?b1 ?t) (box_on_train ?b2 ?t)
                        (box_on_train ?b3 ?t) (box_on_train ?b4 ?t)
                        
                        (not(train_free ?t))
                        (train_full ?t)
                )
    )
    
    (:action unload_train
        :parameters (?t ?l ?b1 ?b2 ?b3 ?b4)
        :precondition   (and    (TRAIN ?t) (VEHICLE ?t)
                                (LOCATION ?l)
                                (BOX ?b1) (BOX ?b2) (BOX ?b3) (BOX ?b4)
                                (different_boxes ?b1 ?b2 ?b3 ?b4)
                                
                                (train_at ?t ?l) (train_full ?t)
                                
                                (box_on_train ?b1 ?t)(box_on_train ?b2 ?t)
                                (box_on_train ?b3 ?t)(box_on_train ?b4 ?t)
        
                        )
                        
        :effect (and    (box_down ?b1) (box_down ?b2)
                        (box_down ?b3) (box_down ?b4)
                        
                        (not (box_on_train ?b1 ?t)) (not (box_on_train ?b2 ?t))
                        (not (box_on_train ?b3 ?t)) (not (box_on_train ?b4 ?t))
                        
                        (box_at ?b1 ?l) (box_at ?b2 ?l)
                        (box_at ?b3 ?l) (box_at ?b4 ?l)
                        
                        (not (train_full ?t))
                        (train_free ?t)
                )
    )
    
)