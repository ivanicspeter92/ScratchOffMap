//
//  String+EmojiFlag.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 06/12/2016.
//  Copyright © 2016 Peter Ivanics. All rights reserved.
//
//  Source: https://bendodson.com/weblog/2016/04/26/emoji-flags-from-iso-3166-country-codes-in-swift/

extension String {
    var emojiFlag: String {
        var string = ""
        var country = self.uppercased()
        for uS in country.unicodeScalars {
            if let value = UnicodeScalar(127397 + uS.value) {
                string += value.description
            }
        }
        return string
    }
}
