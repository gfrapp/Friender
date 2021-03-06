//
//  updateLocation.swift
//  Friender
//
//  Created by mac on 8/23/18.
//  Copyright © 2018 storm. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import Firebase

class updateLocation {
    static var instance = updateLocation()
    
    func updateUserLocation(_ coordinate: CLLocationCoordinate2D) {
        DatabaseService.instance.events.observeSingleEvent(of: .value) { (snapshot) in
            if let userSnapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for user in userSnapshot {
                    if user.key == Auth.auth().currentUser?.uid {
            DatabaseService.instance.events.child(user.key).updateChildValues(["coordinate": [coordinate.latitude, coordinate.longitude] ])
                        
                    }
                }
            }
            
        }
        
        DatabaseService.instance.accepted.observe(.value) { (snapshot) in
            if let userSnapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for user in userSnapshot {
                    DatabaseService.instance.accepted.child(user.key).child((Auth.auth().currentUser?.uid)!).updateChildValues(["coordinate": [coordinate.latitude, coordinate.longitude] ])
                    }
                }
            }
        
        DatabaseService.instance.accepter.observe(.value) { (snapshot) in
            if let userSnapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for user in userSnapshot {
                    if user.key == Auth.auth().currentUser?.uid {
                        
                        DatabaseService.instance.accepter.child(user.key).child((Auth.auth().currentUser?.uid)!).updateChildValues(["coordinate": [coordinate.latitude, coordinate.longitude] ])
                    }
                }
            }
        }
    }
}

    

