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
    func testKumpulaNeighbourhood() {
        let kumpula = Coordinates(latitude: 60.208445, longitude: 24.966967)
        
        GeoCoder.decodeCountry(ofPoint: kumpula, completion: { (country) in
            XCTAssertEqual("Finland", country?.name)
            XCTAssertEqual("FI", country?.code)
        })
    }
}
