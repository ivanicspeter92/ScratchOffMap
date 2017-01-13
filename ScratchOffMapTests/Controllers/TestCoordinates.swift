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
        ] + pointsInHungary + pointsNotInAnyCountry
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
            Coordinates(longitude: 19.16336395, latitude: 47.29599553),
            Coordinates(longitude: 19.05720984, latitude: 47.84460377),
            Coordinates(longitude: 18.57209157, latitude: 47.55594503),
            Coordinates(longitude: 18.57490414, latitude: 47.47069408),
            Coordinates(longitude: 19.06342862, latitude: 47.28913519),
            Coordinates(longitude: 18.91450918, latitude: 47.5248797),
            Coordinates(longitude: 18.95735831, latitude: 47.79398317),
            Coordinates(longitude: 19.09734156, latitude: 47.49674377),
            Coordinates(longitude: 19.32705837, latitude: 47.38439118),
            Coordinates(longitude: 18.85795594, latitude: 47.31146871),
            Coordinates(longitude: 18.79087156, latitude: 47.38022954),
            Coordinates(longitude: 18.65718006, latitude: 47.66997475),
            Coordinates(longitude: 19.05970143, latitude: 47.35656465),
            Coordinates(longitude: 18.60721371, latitude: 47.51009856),
            Coordinates(longitude: 18.64608128, latitude: 47.33823064),
            Coordinates(longitude: 18.92301224, latitude: 47.25630221),
            Coordinates(longitude: 18.9835485, latitude: 47.34818014),
            Coordinates(longitude: 18.92433391, latitude: 47.22443782),
            Coordinates(longitude: 18.99720686, latitude: 47.34911124),
            Coordinates(longitude: 18.63156301, latitude: 47.36424757),
            Coordinates(longitude: 18.70087078, latitude: 47.39856493),
            Coordinates(longitude: 19.10684717, latitude: 47.25630576),
            Coordinates(longitude: 19.21525215, latitude: 47.66606257),
            Coordinates(longitude: 19.48128846, latitude: 47.6335808),
            Coordinates(longitude: 19.16881662, latitude: 47.56396492),
            Coordinates(longitude: 19.28718653, latitude: 47.70662638),
            Coordinates(longitude: 19.34122784, latitude: 47.35451767),
            Coordinates(longitude: 19.15213986, latitude: 47.21495803),
            Coordinates(longitude: 19.13121756, latitude: 47.42538615),
            Coordinates(longitude: 19.30108966, latitude: 47.80671503),
            Coordinates(longitude: 19.41666338, latitude: 47.42506358),
            Coordinates(longitude: 18.77718114, latitude: 47.78365019),
            Coordinates(longitude: 19.37614531, latitude: 47.60932952),
            Coordinates(longitude: 18.97634152, latitude: 47.23588097),
            Coordinates(longitude: 18.95710666, latitude: 47.32797799),
            Coordinates(longitude: 19.03177296, latitude: 47.56137344),
            Coordinates(longitude: 19.3997352, latitude: 47.46379198),
            Coordinates(longitude: 18.97655754, latitude: 47.41439773),
            Coordinates(longitude: 19.26855561, latitude: 47.25271161),
            Coordinates(longitude: 18.97015546, latitude: 47.63663394),
            Coordinates(longitude: 19.37429192, latitude: 47.25957235),
            Coordinates(longitude: 18.91831774, latitude: 47.16705109),
            Coordinates(longitude: 19.04634621, latitude: 47.785911),
            Coordinates(longitude: 18.84791309, latitude: 47.64224304),
            Coordinates(longitude: 19.50382159, latitude: 47.60379212),
            Coordinates(longitude: 18.86871352, latitude: 47.23813175),
            Coordinates(longitude: 19.0055712, latitude: 47.22318059),
            Coordinates(longitude: 19.44835766, latitude: 47.68419595),
            Coordinates(longitude: 19.36780021, latitude: 47.60046006),
            Coordinates(longitude: 19.06415135, latitude: 47.22606465),
            Coordinates(longitude: 19.23326802, latitude: 47.63120975),
            Coordinates(longitude: 19.37143261, latitude: 47.50581342),
            Coordinates(longitude: 18.70918674, latitude: 47.64379908),
            Coordinates(longitude: 19.55892256, latitude: 47.4385837),
            Coordinates(longitude: 18.7725556, latitude: 47.74847423),
            Coordinates(longitude: 18.96966078, latitude: 47.54277282),
            Coordinates(longitude: 18.55481617, latitude: 47.4802717),
            Coordinates(longitude: 18.97917674, latitude: 47.56137254),
            Coordinates(longitude: 19.07789607, latitude: 47.23475106),
            Coordinates(longitude: 19.06348623, latitude: 47.84540615),
            Coordinates(longitude: 18.84124534, latitude: 47.33019019),
            Coordinates(longitude: 18.74068841, latitude: 47.59310905),
            Coordinates(longitude: 18.89924795, latitude: 47.16389032),
            Coordinates(longitude: 19.12492098, latitude: 47.83405644),
            Coordinates(longitude: 18.91150263, latitude: 47.47161302),
            Coordinates(longitude: 18.68930635, latitude: 47.46477425),
            Coordinates(longitude: 19.42363718, latitude: 47.41102184),
            Coordinates(longitude: 19.3080772, latitude: 47.54417315),
            Coordinates(longitude: 19.25771727, latitude: 47.54539086)
        ]
    }
    static var pointsNotInAnyCountry: [Coordinates] {
        return [
            Coordinates(longitude: -140.11963, latitude: 28.55943),
            Coordinates(longitude: -155.58838, latitude: -64.04144)
        ]
    }
}
