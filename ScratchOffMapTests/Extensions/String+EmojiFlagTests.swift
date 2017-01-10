//
//  String+EmojiFlagTests.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 06/12/2016.
//  Copyright © 2016 Peter Ivanics. All rights reserved.
//

import XCTest
@testable import ScratchOffMap

class Country_EmojiFlagTests: XCTestCase {
    
    /// Tests the emojiFlag retrieval for the given codes in https://bendodson.com/weblog/2016/04/26/emoji-flags-from-iso-3166-country-codes-in-swift/
    func testProvidedCountryFlagsLowerCase() {
        XCTAssertEqual("🇬🇧", "gb".emojiFlag)
        XCTAssertEqual("🇺🇸", "us".emojiFlag)
        XCTAssertEqual("🇪🇸", "es".emojiFlag)
        XCTAssertEqual("🇮🇹", "it".emojiFlag)
        XCTAssertEqual("🇸🇪", "se".emojiFlag)
        XCTAssertEqual("🇪🇺", "eu".emojiFlag)
        XCTAssertEqual("🇭🇺", "hu".emojiFlag)
        XCTAssertEqual("🇫🇮", "fi".emojiFlag)
    }
    
    func testProvidedCountryFlagsUpperCase() {
        XCTAssertEqual("🇬🇧", "GB".emojiFlag)
        XCTAssertEqual("🇺🇸", "US".emojiFlag)
        XCTAssertEqual("🇪🇸", "ES".emojiFlag)
        XCTAssertEqual("🇮🇹", "IT".emojiFlag)
        XCTAssertEqual("🇸🇪", "SE".emojiFlag)
        XCTAssertEqual("🇪🇺", "EU".emojiFlag)
        XCTAssertEqual("🇭🇺", "HU".emojiFlag)
        XCTAssertEqual("🇫🇮", "FI".emojiFlag)
    }
}
