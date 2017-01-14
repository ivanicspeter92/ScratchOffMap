//
//  GeoCodingTests.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 20/11/2016.
//  Copyright © 2016 Peter Ivanics. All rights reserved.
//

import XCTest
@testable import ScratchOffMap
import SwifterSwift

class GeoCodingTests: XCTestCase {
    private let finland = Country(name: "Finland", code: "FI")
    private let hungary = Country(name: "Hungary", code: "HU")
    
    func testKumpulaNeighbourhood() {
        self.assertAsyncGeocodingRequest(coordinates: TestCoordinates.kumpula, expectedCountry: self.finland)
    }
    
    func testPointsInHungary() {
        let coordinates: [Coordinates] = TestCoordinates.pointsInHungary.sample(5)
        
        self.assertAsyncGeocodingRequest(coordinatesArray: coordinates, expectedCountry: self.hungary)
    }
    
    func testPointsOutsideCountries() {
        let coordinates: [Coordinates] = TestCoordinates.pointsNotInAnyCountry
        
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
        
        GeoCoder().decodeCountry(ofPoint: coordinates, completion: { (country) in
            XCTAssertEqual(expectedCountry?.name, country?.name)
            XCTAssertEqual(expectedCountry?.code, country?.code)
            
            asyncExpectation.fulfill()
        })
        
        self.waitForExpectations(timeout: 10) { (error) in
            XCTAssertNil(error, "Geocoding query timed out - maybe you did not allow access to location in the application?")
        }
    }
}
