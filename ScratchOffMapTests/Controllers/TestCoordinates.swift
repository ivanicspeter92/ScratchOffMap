//
//  TestCoordinates.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 13/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

@testable import ScratchOffMap

class TestCoordinates {
    static let kumpula = Coordinates(latitude: 60.208445, longitude: 24.966967)
    static let pointsInHungary = [
        Coordinates(latitude: 47.4979, longitude: 19.0402),
        Coordinates(latitude: 47.361515, longitude: 19.852087)
    ]
    static let pointsInNotAnyCounry = [
        Coordinates(latitude: 28.55943, longitude: -140.11963),
        Coordinates(latitude: -64.04144, longitude: -155.58838)
    ]
}
