//
//  TestCoordinates.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 13/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

@testable import ScratchOffMap

class TestCoordinates {
    static var all: [Coordinates] {
        return [
            kumpula
            ] + pointsInHungary + pointsNotInAnyCountry + sweden + argentina
    }
    
    static var kumpula: Coordinates {
        return Coordinates(longitude: 24.966967, latitude: 60.208445)
    }
    static var pointsInHungary: [Coordinates] {
        return [
            Coordinates(longitude: 19.0402, latitude: 47.4979),
            Coordinates(longitude: 19.852087, latitude: 47.361515),
            Coordinates(longitude: 18.64425727, latitude: 47.33624549),
            Coordinates(longitude: 18.74850583, latitude: 47.54199128),
            Coordinates(longitude: 18.81652042, latitude: 47.53421612),
            Coordinates(longitude: 18.73129124, latitude: 47.55224592),
            Coordinates(longitude: 18.74156477, latitude: 47.3782598),
            Coordinates(longitude: 19.25484584, latitude: 47.71513611),
            Coordinates(longitude: 19.20302639, latitude: 47.71748212),
            Coordinates(longitude: 19.07547485, latitude: 47.30626924),
            Coordinates(longitude: 19.09063869, latitude: 47.23936086),
            Coordinates(longitude: 19.33580448, latitude: 47.58461675),
            Coordinates(longitude: 19.26950298, latitude: 47.63431358),
            Coordinates(longitude: 19.26193065, latitude: 47.80426883),
            Coordinates(longitude: 19.10530074, latitude: 47.60861275),
            Coordinates(longitude: 18.65733218, latitude: 47.7074861),
            Coordinates(longitude: 19.14560763, latitude: 47.34375732),
            Coordinates(longitude: 19.11742248, latitude: 47.7289755),
            Coordinates(longitude: 19.40740742, latitude: 47.61562956),
            Coordinates(longitude: 18.56776157, latitude: 47.50299095),
            Coordinates(longitude: 19.21504407, latitude: 47.21951124),
            Coordinates(longitude: 18.83300633, latitude: 47.79315887),
            Coordinates(longitude: 19.13882384, latitude: 47.29021366),
            Coordinates(longitude: 18.9649477, latitude: 47.68147312),
            Coordinates(longitude: 19.04955422, latitude: 47.51078524),
            Coordinates(longitude: 18.63008605, latitude: 47.66739698),
            Coordinates(longitude: 19.0492928, latitude: 47.21758698),
            Coordinates(longitude: 18.72618239, latitude: 47.35634176),
            Coordinates(longitude: 18.71100984, latitude: 47.66279445),
            Coordinates(longitude: 19.10414895, latitude: 47.58512422),
            Coordinates(longitude: 19.35643863, latitude: 47.31976882),
            Coordinates(longitude: 19.20310983, latitude: 47.55895913),
            Coordinates(longitude: 19.43457636, latitude: 47.64553579),
            Coordinates(longitude: 19.16336395, latitude: 47.29599553)
        ]
    }
    static var pointsNotInAnyCountry: [Coordinates] {
        return [
            Coordinates(longitude: -140.11963, latitude: 28.55943),
            Coordinates(longitude: -155.58838, latitude: -64.04144)
        ]
    }
    static var sweden: [Coordinates] {
        return [
            Coordinates(longitude: 15.02097071, latitude: 58.35036924),
            Coordinates(longitude: 15.02771216, latitude: 62.13987375),
            Coordinates(longitude: 18.50552206, latitude: 59.98502048),
            Coordinates(longitude: 15.46332045, latitude: 58.35541459),
            Coordinates(longitude: 14.93452848, latitude: 60.4903782)
        ]
    }
    
    static var argentina: [Coordinates] {
        return [
            Coordinates(longitude: -58.3834983333, latitude: -34.6100833333),
            Coordinates(longitude: -58.3834983333, latitude: -34.6100833333),
            Coordinates(longitude: -58.3834033333, latitude: -34.6102833333),
            Coordinates(longitude: -58.3833150000, latitude: -34.6095883333),
            Coordinates(longitude: -58.3839800000, latitude: -34.6089100000),
            Coordinates(longitude: -58.3849433333, latitude: -34.6087516667),
            Coordinates(longitude: -58.3858183333, latitude: -34.6089800000),
            Coordinates(longitude: -58.3867116667, latitude: -34.6090400000),
            Coordinates(longitude: -58.3876233333, latitude: -34.6095700000),
            Coordinates(longitude: -58.3881616667, latitude: -34.6095633333),
            Coordinates(longitude: -58.3881500000, latitude: -34.6096283333),
            Coordinates(longitude: -58.3889716667, latitude: -34.6091750000),
            Coordinates(longitude: -58.3895000000, latitude: -34.6093850000),
            Coordinates(longitude: -58.3903483333, latitude: -34.6097716667),
            Coordinates(longitude: -58.3904716667, latitude: -34.6099333333),
            Coordinates(longitude: -58.3912083333, latitude: -34.6099766667),
            Coordinates(longitude: -58.3914966667, latitude: -34.6092583333),
            Coordinates(longitude: -58.3909916667, latitude: -34.6092466667),
            Coordinates(longitude: -58.3905250000, latitude: -34.6092666667),
            Coordinates(longitude: -58.3898283333, latitude: -34.6095933333),
            Coordinates(longitude: -58.3894683333, latitude: -34.6096216667),
            Coordinates(longitude: -58.3892883333, latitude: -34.6091033333),
            Coordinates(longitude: -58.3890150000, latitude: -34.6090916667),
            Coordinates(longitude: -58.3880050000, latitude: -34.6092083333),
            Coordinates(longitude: -58.3873750000, latitude: -34.6087716667),
            Coordinates(longitude: -58.3863916667, latitude: -34.6088233333),
            Coordinates(longitude: -58.3859483333, latitude: -34.6089616667),
            Coordinates(longitude: -58.3850633333, latitude: -34.6084016667),
            Coordinates(longitude: -58.3848783333, latitude: -34.6077383333),
            Coordinates(longitude: -58.3848650000, latitude: -34.6068333333),
            Coordinates(longitude: -58.3846250000, latitude: -34.6063316667),
            Coordinates(longitude: -58.3847550000, latitude: -34.6054166667),
            Coordinates(longitude: -58.3850583333, latitude: -34.6049533333),
            Coordinates(longitude: -58.3850366667, latitude: -34.6042450000),
            Coordinates(longitude: -58.3842233333, latitude: -34.6037566667),
            Coordinates(longitude: -58.3815283333, latitude: -34.6029250000),
            Coordinates(longitude: -58.3788333333, latitude: -34.6020933333),
            Coordinates(longitude: -58.3761366667, latitude: -34.6012616667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667),
            Coordinates(longitude: -58.3743850000, latitude: -34.6007216667)
        ]
    }
}
