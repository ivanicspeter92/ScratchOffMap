//
//  Country.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 06/12/2016.
//  Copyright © 2016 Peter Ivanics. All rights reserved.
//

import RealmSwift

public class Country: Object {
    // MARK: - Variables
    dynamic var name: String = ""
    dynamic var code: String? = nil
    
    override public var description: String {
        if let code = code {
            return "[" + code + "]" + name
        } else {
            return name
        }
    }
    
    // MARK: - Initializers
    convenience init(name: String, code: String? = nil) {
        self.init()
        
        self.name = name
        self.code = code
    }
    
    convenience init(name: String) {
        self.init()
        
        self.name = name
        self.code = NSLocale.localeCode(forCountry: name)
    }
}
