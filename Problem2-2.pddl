(define (problem Problem1)

(:domain Domain1)

(:objects   hub_it_1 hub_it_2 hub_fr_1 hub_fr_2
            station_it station_fr
            box1 box2 box3 box4
            box5 box6 box7 box8
            truck1 truck2 truck3 truck4
            train1
)

(:init  (LOCATION station_it) (LOCATION station_fr)
        (LOCATION hub_it_1) (LOCATION hub_it_2) 
        (LOCATION hub_fr_1) (LOCATION hub_fr_2)
        
        (BOX box1) (BOX box2) (BOX box3) (BOX box4)
        (BOX box5) (BOX box6) (BOX box7) (BOX box8)
        
        (VEHICLE truck1) (VEHICLE truck2) (VEHICLE truck3) (VEHICLE truck4)
        (VEHICLE train1)
        
        (TRUCK truck1) (TRUCK truck2) (TRUCK truck3) (TRUCK truck4)
        
        (TRAIN train1) 
        
        (conn truck1 hub_it_1 hub_it_2) (conn truck1 hub_it_1 station_it)
        (conn truck1 hub_it_2 hub_it_1) (conn truck1 station_it hub_it_1)
        (conn truck2 hub_it_2 station_it) (conn truck2 hub_it_2 hub_it_1)
        (conn truck2 station_it hub_it_2) (conn truck2 hub_it_1 hub_it_2)
        
        (conn truck3 hub_fr_1 hub_fr_2) (conn truck3 hub_fr_1 station_fr)
        (conn truck3 hub_fr_2 hub_fr_1) (conn truck3 station_fr hub_fr_1)
        (conn truck4 hub_fr_2 station_fr) (conn truck4 hub_fr_2 hub_fr_1)
        (conn truck4 station_fr hub_fr_2) (conn truck4 hub_fr_1 hub_fr_2)
        
        (conn train1 station_it station_fr)
        (conn train1 station_fr station_it)
        
        (box_at box1 hub_it_1) (box_down box1)
        (box_at box2 hub_it_1) (box_down box2)
        (box_at box3 hub_it_2) (box_down box3)
        (box_at box4 hub_it_2) (box_down box4)
        
        (box_at box5 hub_it_1) (box_down box5)
        (box_at box6 hub_it_1) (box_down box6)
        (box_at box7 hub_it_2) (box_down box7)
        (box_at box8 hub_it_2) (box_down box8)
        (different_boxes box1 box2 box3 box4)
        (different_boxes box5 box6 box7 box8)
        
        
        (truck_at truck1 hub_it_1) (truck_free truck1)
        (truck_at truck2 hub_it_2) (truck_free truck2)
        (truck_at truck3 hub_fr_1) (truck_free truck3)
        (truck_at truck4 hub_fr_2) (truck_free truck4)
        
        (train_at train1 station_it) (train_free train1)
)

(:goal  (and 
            (box_at box1 hub_fr_1) (box_down box1)
            (box_at box2 hub_fr_1) (box_down box2)
            (box_at box3 hub_fr_2) (box_down box3)
            (box_at box4 hub_fr_2) (box_down box4)
            
            (box_at box5 hub_fr_1) (box_down box5)
            (box_at box6 hub_fr_1) (box_down box6)
            (box_at box7 hub_fr_2) (box_down box7)
            (box_at box8 hub_fr_2) (box_down box8)
            
            (train_at train1 station_it)
        )
)

)