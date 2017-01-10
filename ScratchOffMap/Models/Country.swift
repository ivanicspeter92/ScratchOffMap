//
//  Country.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 06/12/2016.
//  Copyright © 2016 Peter Ivanics. All rights reserved.
//

import UIKit

public struct Country {
    // MARK: - Variables
    let name: String
    let code: String?
    
    // MARK: - Initializers
    init?(name: String) {
        self.name = name
        self.code = NSLocale.localeCode(forCountry: name)
    }
    
    init(name: String, code: String? = nil) {
        self.name = name
        self.code = code
    }
}
