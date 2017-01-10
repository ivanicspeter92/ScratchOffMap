//
//  GeoCoder.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 20/11/2016.
//  Copyright © 2016 Peter Ivanics. All rights reserved.
//

import MapKit

public protocol GeoCoderDelegate {
    func retrieved(country: Country)
}

class GeoCoder {
    // MARK: - Variables
    static private let locationManager = CLLocationManager()
    static private let geoCoder = CLGeocoder()
    
    static private var hasAccessToLocation: Bool {
        return CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse || CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways
    }
    
    // MARK: - Methods
    static func decodeCountry(ofPoint: Coordinates, completion: @escaping ((Country?) -> Void)) {
        let location = CLLocation(latitude: ofPoint.latitude, longitude: ofPoint.longitude)
        self.locationManager.requestWhenInUseAuthorization()
        
        if self.hasAccessToLocation {
            self.geoCoder.reverseGeocodeLocation(location) { (placemarks, error) -> Void in
                if let placeArray = placemarks as [CLPlacemark]! {
                    var placeMark: CLPlacemark!
                    placeMark = placeArray[0]
                    
                    print(placeMark)
                    if let country = placeMark.addressDictionary?["Country"] as? String {
                        completion(Country(name: country, code: "FI"))
                    } else {
                        completion(nil)
                    }
                }
            }
        }
    }
}
