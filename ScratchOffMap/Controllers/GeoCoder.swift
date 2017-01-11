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
    static private let geoCoder = CLGeocoder()
    
    // MARK: - Methods
    static func decodeCountry(ofPoint: Coordinates, completion: @escaping ((Country?) -> Void)) {
        let location = CLLocation(latitude: ofPoint.latitude, longitude: ofPoint.longitude)
        self.attemptDecoding(location: location, completion: completion)
    }
    
    static private func attemptDecoding(location: CLLocation, completion: @escaping ((Country?) -> Void)) {
        self.geoCoder.reverseGeocodeLocation(location) { (placemarks, error) -> Void in
            if let placeArray = placemarks as [CLPlacemark]! {
                var placeMark: CLPlacemark!
                placeMark = placeArray[0]
                
                if let country = placeMark.addressDictionary?["Country"] as? String {
                    completion(Country(name: country))
                } else {
                    completion(nil)
                }
            }
        }
    }
}
