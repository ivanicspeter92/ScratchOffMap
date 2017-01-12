//
//  CoordinateCollectorService.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 10/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import MapKit

class CoordinateCollectorService: DutyCycling {
    // MARK: - Variables
    var collectPointsWithoutCountry = true
    private let locationManager = CLLocationManager()
    
    private var hasAccessToLocation: Bool {
        return CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways
    }
    
    // MARK: - Initializers
    override init?(seconds: Double) throws {
        try super.init(seconds: seconds)
        
//        self.locationManager.stopUpdatingLocation()
//        self.locationManager.stopUpdatingHeading()
//        self.locationManager.stopMonitoringSignificantLocationChanges()
//        self.locationManager.pausesLocationUpdatesAutomatically = true
//        self.locationManager.allowsBackgroundLocationUpdates = false
        
        self.locationManager.delegate = self
        
        if !hasAccessToLocation {
            self.locationManager.requestAlwaysAuthorization()
        }
    }
    
    // MARK: - Methods
    override func performTask() {
        self.locationManager.requestLocation()
    }
}

extension CoordinateCollectorService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for location in locations {
            let coordinates = Coordinates(location: location)
            
            GeoCoder.decodeCountry(ofPoint: coordinates, completion: { (country) in
                
                if let country = country {
                    DatabaseManager.insert(coordinates: coordinates, country: country)
                } else if self.collectPointsWithoutCountry {
                    DatabaseManager.insert(coordinates: coordinates)
                }
            })
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
}
