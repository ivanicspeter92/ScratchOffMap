//
//  CoordinatesTests.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 11/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import XCTest
@testable import ScratchOffMap

class CoordinatesTests: XCTestCase {
    func testExample() {
        let first = Coordinates(latitude: 28.55943, longitude: -140.11963)
        sleep(1)
        let second = Coordinates(latitude: -64.04144, longitude: -155.58838)
        
        XCTAssertTrue(first.timestamp < second.timestamp)
    }
}
