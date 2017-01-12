//
//  DatabaseManager.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 11/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import RealmSwift

class DatabaseManager {
    private static let database = try! Realm()
    static func insert(coordinates: Coordinates) {
        do {
            try self.database.write {
                self.database.add(coordinates, update: true)
            }
        } catch {
            self.database.cancelWrite()
        }
    }
    
    static func insert(coordinates: Coordinates, country: Country) {
        do {
            try self.database.write {
                coordinates.country = country
                self.database.add(coordinates)
                
                NSLog("Coordinates inserted: " + coordinates.description + "; country: " + country.description)
                NSLog("Realm file: " + self.database.configuration.fileURL!.description)
            }
        } catch {
            self.database.cancelWrite()
        }
    }
    
    static func selectCoordinates() -> [Coordinates] {
        let coordinates = self.database.objects(Coordinates.self).toArray(ofType: Coordinates.self)
        
        return coordinates
    }
    
    static func deleteAllCoordinates() {
        do {
            try self.database.write {
                self.database.delete(self.database.objects(Coordinates.self))
            }
        } catch {
            self.database.cancelWrite()
        }
    }
}
