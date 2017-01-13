//
//  TestCoordinates.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 13/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

@testable import ScratchOffMap

class TestCoordinates {
    static var kumpula: Coordinates {
        return Coordinates(longitude: 24.966967, latitude: 60.208445)
    }
    static var pointsInHungary: [Coordinates] {
        return [
            Coordinates(longitude: 19.0402, latitude: 47.4979),
            Coordinates(longitude: 19.852087, latitude: 47.361515)
        ]
    }
    static var pointsNotInAnyCountry: [Coordinates] {
        return [
            Coordinates(longitude: -140.11963, latitude: 28.55943),
            Coordinates(longitude: -155.58838, latitude: -64.04144)
        ]
    }
}
