//
//  GeoCodingTests.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 20/11/2016.
//  Copyright © 2016 Peter Ivanics. All rights reserved.
//

import XCTest
@testable import ScratchOffMap

class GeoCodingTests: XCTestCase {
    private let finland = Country(name: "Finland", code: "FI")
    private let hungary = Country(name: "Hungary", code: "HU")
    
    func testKumpulaNeighbourhood() {
        let kumpula = Coordinates(latitude: 60.208445, longitude: 24.966967)
        
        self.assertAsyncGeocodingRequest(coordinates: kumpula, expectedCountry: self.finland)
    }
    
    func testPointsInHungary() {
        let coordinates: [Coordinates] = [
            Coordinates(latitude: 47.4979, longitude: 19.0402),
            Coordinates(latitude: 47.361515, longitude: 19.852087)
        ]
        
        self.assertAsyncGeocodingRequest(coordinatesArray: coordinates, expectedCountry: self.hungary)
    }
    
    func testPointsOutsideCountries() {
        let coordinates: [Coordinates] = [
            Coordinates(latitude: 28.55943, longitude: -140.11963),
            Coordinates(latitude: -64.04144, longitude: -155.58838)
        ]
        
        self.assertAsyncGeocodingRequest(coordinatesArray: coordinates)
    }
    
    // MARK: - Private functions
    private func assertAsyncGeocodingRequest(coordinatesArray: [Coordinates], expectedCountry: Country? = nil) {
        for coordinatePair in coordinatesArray {
            self.assertAsyncGeocodingRequest(coordinates: coordinatePair, expectedCountry: expectedCountry)
        }
    }
    
    private func assertAsyncGeocodingRequest(coordinates: Coordinates, expectedCountry: Country? = nil) {
        let asyncExpectation = expectation(description: "longRunningFunction")
        
        GeoCoder.decodeCountry(ofPoint: coordinates, completion: { (country) in
            XCTAssertEqual(expectedCountry?.name, country?.name)
            XCTAssertEqual(expectedCountry?.code, country?.code)
            
            asyncExpectation.fulfill()
        })
        
        self.waitForExpectations(timeout: 5) { (error) in
            XCTAssertNil(error, "Geocoding query timed out - maybe you did not allow access to location in the application?")
        }
    }
}
