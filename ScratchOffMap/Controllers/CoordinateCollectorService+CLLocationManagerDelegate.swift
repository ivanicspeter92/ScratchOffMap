//
//  CoordinateCollectorService+CLLocationManagerDelegate.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 13/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import MapKit

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
