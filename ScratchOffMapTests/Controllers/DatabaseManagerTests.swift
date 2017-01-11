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
        let kumpula = Coordinates(latitude: 60.208445, longitude: 24.966967)
        
        DatabaseManager.insert(coordinates: kumpula)
        
        let newPoints = DatabaseManager.selectCoordinates()
        XCTAssertEqual(originalPoints.count + 1, newPoints.count)
        XCTAssertTrue(newPoints.contains(kumpula))
    }
    
    func testInsertingMultiplePointsToEmptyDatabaseReturnsTheSameArray() {
        DatabaseManager.deleteAllCoordinates()
        let coordinates: [Coordinates] = [
            Coordinates(latitude: 28.55943, longitude: -140.11963),
            Coordinates(latitude: -64.04144, longitude: -155.58838)
        ]
        
        coordinates.forEach{ DatabaseManager.insert(coordinates: $0) }
        
        let retrievedCoordinates = DatabaseManager.selectCoordinates()
        XCTAssertEqual(coordinates, retrievedCoordinates)
    }
}
