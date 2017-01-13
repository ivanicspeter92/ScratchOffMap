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
    private(set) var lastExecution: Date
    var intervalInSeconds: Double {
        didSet {
            if intervalInSeconds > 0 {
                NSLog(String(describing: self) + " - interval changed to " + self.intervalInSeconds.description)
                self.timer = Timer.scheduledTimer(timeInterval: self.intervalInSeconds, target: self, selector: #selector(DutyCycling.execute), userInfo: nil, repeats: true)
            } else {
                intervalInSeconds = oldValue
            }
        }
    }
    private var timer: Timer!
    private var running = false
    
    /**
     Tells if the service is running.
     
     - returns: True, if the timer of the service is valid, in a running state; False, otherwise.
     
     - Author: Peter Ivanics
     - Date: 09.01.2017.
     */
    var isRunning: Bool {
        return self.running
    }
    
    // MARK: - Initializers
    init?(seconds: Double) throws {
        if seconds <= 0 {
            throw DutyCyclingException.incorrectInterval
        }
        
        self.lastExecution = Date(timeIntervalSince1970: TimeInterval())
        self.intervalInSeconds = seconds
        
        super.init()
        
        self.timer = Timer.scheduledTimer(timeInterval: self.intervalInSeconds, target: self, selector: #selector(DutyCycling.execute), userInfo: nil, repeats: true)
    }
    
    convenience init?(minutes: Double) throws {
        try self.init(seconds: minutes * 60)
    }
    
    convenience init?(hours: Double) throws {
        try self.init(minutes: hours * 60)
    }
    
    convenience init?(days: Double) throws {
        try self.init(hours: days * 24)
    }

    // MARK - Methods
    final func start() {
        self.timer.fire()
        RunLoop.current.add(self.timer, forMode: RunLoopMode.commonModes)
        self.running = true
    }
    
    /**
     Implements the functionality when the timer ticks. Checks if sufficient amount of time has elapsed since the last time tick.
     
     - Author: Peter Ivanics
     - Date: 10.01.2017.
     */
    final func execute() {
        if self.lastExecution <= Date(timeIntervalSinceNow: -self.intervalInSeconds) {
            self.performTask()
            self.lastExecution = Date(timeIntervalSinceNow: 0)
        }
    }
    
    final func stop() {
        self.timer.invalidate()
        self.running = false
    }
    
    func performTask() {
    }
}
