//
//  LifecycleController.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 10/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import Foundation

class LifecycleController {

    // MARK: - Variables
    static let coordinateCollector = try! CoordinateCollectorService(seconds: 5)
    static var displayCoordinatesWithoutCountry = true
    static var showCountriesWithoutCode = true
    
    public static func attemptDecodingCountriesInDatabase() {
        let coordinates = DatabaseManager.selectCoordinates()
        
        for point in coordinates {
            if point.country == nil {
                self.decodeAndStoreCountry(point: point)
            }
        }
    }
    
    private static func decodeAndStoreCountry(point: Coordinates) {
        GeoCoder().decodeCountry(ofPoint: point, completion: { (country) in
            if let country = country {
                DatabaseManager.insert(coordinates: point, country: country)
            }
        })
    }
}
