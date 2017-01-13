//
//  DutyCyclingTests.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 09/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import XCTest
@testable import ScratchOffMap

class DutyCyclingTests: XCTestCase {
    private var dutyCycling: DutyCycling!
    
    override func setUp() {
        super.setUp()
        
        try! self.dutyCycling = DutyCycling(seconds: 60)
    }
    
    override func tearDown() {
        self.dutyCycling.stop()
        
        super.tearDown()
    }
    
    func testInitializingWithZeroOrNegativeSecondsThrowsIncorrectIntervalException() {
        do {
            try self.dutyCycling = DutyCycling(seconds: 0)
            try self.dutyCycling = DutyCycling(seconds: -5)
            
            try self.dutyCycling = DutyCycling(minutes: 0)
            try self.dutyCycling = DutyCycling(minutes: -5)
            
            try self.dutyCycling = DutyCycling(hours: 0)
            try self.dutyCycling = DutyCycling(hours: -5)
            
            try self.dutyCycling = DutyCycling(days: 0)
            try self.dutyCycling = DutyCycling(days: -5)
            
            XCTFail("The cycle should be greater than 0 seconds!")
        } catch DutyCyclingException.incorrectInterval {
            print(#function + " passed")
        } catch {
            XCTFail("Unknown exception thrown")
        }
    }
    
    func testIsRunning() {
        XCTAssertFalse(self.dutyCycling.isRunning)
        
        self.dutyCycling.start()
        XCTAssertTrue(self.dutyCycling.isRunning)
        
        self.dutyCycling.stop()
        XCTAssertFalse(self.dutyCycling.isRunning)
    }
    
    func testAttemptToModifyCycleTimeToNegativeDoesNothing() {
        let interval = self.dutyCycling.intervalInSeconds
        
        self.self.dutyCycling.intervalInSeconds = -6 // should not do anything
        XCTAssertEqual(interval, self.dutyCycling.intervalInSeconds)
    }
}
