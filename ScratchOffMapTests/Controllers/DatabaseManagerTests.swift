//
//  DatabaseManagerTests.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 11/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import XCTest
@testable import ScratchOffMap

class DatabaseManagerTests: XCTestCase {
    func testPointsInDatabaseAfterDeleteAllCoordinatesAreZero() {
        DatabaseManager.deleteAllCoordinates()
        XCTAssertEqual(DatabaseManager.selectCoordinates().count, 0)
    }
    
    func testIfAfterInsertingCoordinatesSelectingReturnsOneMoreItem() {
        let originalPoints = DatabaseManager.selectCoordinates()
        let newPoint = Coordinates(longitude: Double(arc4random()), latitude: Double(arc4random()))
        
        DatabaseManager.insert(coordinates: newPoint)
        
        let newPoints = DatabaseManager.selectCoordinates()
        XCTAssertEqual(originalPoints.count + 1, newPoints.count)
        XCTAssertTrue(newPoints.contains(newPoint))
    }
    
    func testInsertingMultiplePointsToEmptyDatabaseReturnsTheSameArray() {
        DatabaseManager.deleteAllCoordinates()
        let coordinates: [Coordinates] = [
            Coordinates(longitude: -140.11963, latitude: 28.55943),
            Coordinates(longitude: -155.58838, latitude: -64.04144)
        ]
        
        coordinates.forEach{ DatabaseManager.insert(coordinates: $0) }
        
        let retrievedCoordinates = DatabaseManager.selectCoordinates()
        XCTAssertEqual(coordinates, retrievedCoordinates)
    }
    
    func testInsertingAndRetrievingCoordinatesWithoutCountry() {
        DatabaseManager.deleteAllCoordinates()
        DatabaseManager.insert(coordinates: TestCoordinates.kumpula)
        
        let retrievedCoordinates = DatabaseManager.selectCoordinates()
        XCTAssertEqual(1, retrievedCoordinates.count)
        XCTAssertEqual(TestCoordinates.kumpula.latitude, retrievedCoordinates[0].latitude)
        XCTAssertEqual(TestCoordinates.kumpula.longitude, retrievedCoordinates[0].longitude)
        XCTAssertEqual(TestCoordinates.kumpula.country, retrievedCoordinates[0].country)
        XCTAssertEqual(nil, retrievedCoordinates[0].country)
    }
    
    func testInsertingAndRetrievingCoordinatesWithCountry() {
        DatabaseManager.deleteAllCoordinates()
        
        let kumpula = TestCoordinates.kumpula
        kumpula.country = Country(name: "Finland")
        
        DatabaseManager.insert(coordinates: kumpula)
        
        let retrievedCoordinates = DatabaseManager.selectCoordinates()
        XCTAssertEqual(1, retrievedCoordinates.count)
        XCTAssertEqual(kumpula, retrievedCoordinates[0])
        XCTAssertEqual(kumpula.country, retrievedCoordinates[0].country)
    }
    
    func testDoesNotStoreDuplicateCoordinates() {
        DatabaseManager.deleteAllCoordinates()
        
        var retrievedCoordinates = DatabaseManager.selectCoordinates()
        XCTAssertEqual(0, retrievedCoordinates.count)
        
        DatabaseManager.insert(coordinates: TestCoordinates.kumpula)
        retrievedCoordinates = DatabaseManager.selectCoordinates()
        XCTAssertEqual(1, retrievedCoordinates.count)
        
        DatabaseManager.insert(coordinates: TestCoordinates.kumpula)
        retrievedCoordinates = DatabaseManager.selectCoordinates()
        XCTAssertEqual(1, retrievedCoordinates.count)
    }
    
    func testDoesNotStoreDuplicateCountries() {
        DatabaseManager.deleteAllCountries()
        
        let countries = [
            Country(name: "Hungary"),
            Country(name: "Finland"),
            Country(name: "Finland"),
            Country(name: "Mexico"),
            Country(name: "Hungary")
        ]
        
        for country in countries {
            DatabaseManager.insert(country: country)
        }
        
        let retrievedCountries = DatabaseManager.selectCountries()
        XCTAssertEqual(3, retrievedCountries.count)
    }
}
