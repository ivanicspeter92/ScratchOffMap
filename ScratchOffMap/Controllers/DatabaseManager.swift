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
                
                NSLog("Coordinates inserted: " + coordinates.description)
                NSLog("Realm file: " + self.database.configuration.fileURL!.description)
            }
        } catch {
            self.database.cancelWrite()
        }
    }
    
    static func insert(coordinates: Coordinates, country: Country) {
        do {
            try self.database.write {
                coordinates.country = self.selectCountry(withName: country.name) ?? country
                self.database.add(coordinates, update: true)
                
                NSLog("Coordinates inserted: " + coordinates.description + "; country: " + country.description)
                NSLog("Realm file: " + self.database.configuration.fileURL!.description)
            }
        } catch {
            self.database.cancelWrite()
        }
    }
    
    private static func selectCountry(withName name: String) -> Country? {
        return self.database.objects(Country.self).filter(NSPredicate(format: "name = %@", name)).first
    }
    
    private static func selectCountry(withCode code: String) -> Country? {
        return self.database.objects(Country.self).filter(NSPredicate(format: "code = %@", code)).first
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
    
    static func insert(country: Country) {
        do {
            try self.database.write {
                self.database.add(country, update: true)
                
                NSLog("Country inserted: " + country.description)
            }
        } catch {
            self.database.cancelWrite()
        }
    }
    
    static func deleteAllCountries() {
        do {
            try self.database.write {
                self.database.delete(self.database.objects(Country.self))
            }
        } catch {
            self.database.cancelWrite()
        }
    }
    
    static func selectCountries() -> [Country] {
        return self.database.objects(Country.self).toArray(ofType: Country.self)
    }
    
    static func selectCountriesWithCode() -> [Country] {
        return self.selectCountries().filter{ $0.code != nil }
    }
    
    static func deleteAllCoordinatesAndCountries() {
        self.deleteAllCoordinates()
        self.deleteAllCountries()
    }
}
