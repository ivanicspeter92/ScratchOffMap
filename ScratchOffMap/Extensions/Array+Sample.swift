//
//  Array+Sample.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 14/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import SwifterSwift

extension Array {
    public func sample(_ items: Int) -> [Element] {
        if items <= 0 || self.count <= 0 {
            return []
        }
        
        var result: [Element] = []
        
        for _ in 1...items {
            result.append(self.randomItem)
        }
        
        return result
    }
}
