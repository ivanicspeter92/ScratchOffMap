//
//  CoordinateCollectorService.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 10/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import MapKit

class CoordinateCollectorService: DutyCycling {
    static private let locationManager = CLLocationManager()
    
    static private var hasAccessToLocation: Bool {
        return CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways
    }
    
    override func performTask() {
        
    }
}
