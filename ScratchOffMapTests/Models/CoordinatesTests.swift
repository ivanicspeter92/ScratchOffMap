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
    func testTimestampElapses() {
        let first = Coordinates(longitude: -140.11963, latitude: 28.55943)
        sleep(1)
        let second = Coordinates(longitude: -155.58838, latitude: -64.04144)
        
        XCTAssertTrue(first.timestamp < second.timestamp)
    }
}
