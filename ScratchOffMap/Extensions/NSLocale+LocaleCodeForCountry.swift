//
//  NSLocale+LocaleCodeForCountry.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 10/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//
// http://stackoverflow.com/questions/12671829/get-country-code-from-country-name-in-ios

import Foundation

extension NSLocale {
    class func localeCode(forCountry: String) -> String? {
        return NSLocale.isoCountryCodes.filter{self.countryNameFromLocaleCode(localeCode: $0) == forCountry}.first
    }
    
    private class func countryNameFromLocaleCode(localeCode : String) -> String {
        return NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.countryCode, value: localeCode) ?? ""
    }
}
