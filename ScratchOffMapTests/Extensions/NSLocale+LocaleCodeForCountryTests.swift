//
//  NSLocale+CountryNameToCodeTests.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 10/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import XCTest
@testable import ScratchOffMap

class NSLocale_CountryNameToCodeTests: XCTestCase {
    func testEuropeanCountries() {
        XCTAssertEqual("FI", NSLocale.localeCode(forCountry: "Finland"))
        XCTAssertEqual("HU", NSLocale.localeCode(forCountry: "Hungary"))
        XCTAssertEqual("FR", NSLocale.localeCode(forCountry: "France"))
        XCTAssertEqual("ES", NSLocale.localeCode(forCountry: "Spain"))
    }
    
    func testNonExistingCountries() {
        XCTAssertEqual(nil, NSLocale.localeCode(forCountry: "Moominmaa"))
        XCTAssertEqual(nil, NSLocale.localeCode(forCountry: ""))
        XCTAssertEqual(nil, NSLocale.localeCode(forCountry: "Azeroth"))
    }
}
