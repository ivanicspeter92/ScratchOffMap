//
//  DutyCycling.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 09/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import Foundation

enum DutyCyclingException: Error {
    case incorrectInterval
}

class DutyCycling: NSObject {
    // MARK: - Variables
    let serviceName: String
    private var lastExecution: Date
    private var intervalInSeconds: Double
    private var timer: Timer!
    private var running = false
    
    // MARK: - Initializers
    init?(serviceName: String, seconds: Double) throws {
        if seconds <= 0 {
            throw DutyCyclingException.incorrectInterval
        }
        
        self.serviceName = serviceName
        self.lastExecution = Date(timeIntervalSince1970: TimeInterval())
        self.intervalInSeconds = seconds
        
        super.init()
        
        setTimer(intervalInSeconds: intervalInSeconds)
    }
    
    convenience init?(serviceName: String, minutes: Double) throws {
        try self.init(serviceName: serviceName, seconds: minutes * 60)
    }
    
    convenience init?(serviceName: String, hours: Double) throws {
        try self.init(serviceName: serviceName, minutes: hours * 60)
    }
    
    convenience init?(serviceName: String, days: Double) throws {
        try self.init(serviceName: serviceName, hours: days * 24)
    }

    // MARK - Methods
    func setTimer(intervalInSeconds: Double) {
        self.timer = Timer.scheduledTimer(timeInterval: self.intervalInSeconds, target: self, selector: #selector(DutyCycling.execute), userInfo: nil, repeats: true)
    }
    
    func start() {
        self.timer.fire()
        RunLoop.current.add(self.timer, forMode: RunLoopMode.commonModes)
        self.running = true
    }
    
    /**
     Implements the functionality when the timer ticks. Should be overridden in sublclasses.
     
     - Author: Peter Ivanics
     - Date: 09.01.2017.
     */
    func execute() {
    }
    
    func stop() {
        self.timer.invalidate()
        self.running = false
    }
    
    /**
     Tells if the service is running.
     
     - returns: True, if the timer of the service is valid, in a running state; False, otherwise.
     
     - Author: Peter Ivanics
     - Date: 09.01.2017.
     */
    var isRunning: Bool {
        return self.running
    }
}
