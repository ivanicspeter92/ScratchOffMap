//
//  String+Image.swift
//  ScratchOffMap
//
//  Created by Peter Ivanics on 13/01/2017.
//  Copyright © 2017 Peter Ivanics. All rights reserved.
//

import UIKit

extension String {
    func image() -> UIImage {
        let size = CGSize(width: 30, height: 35)
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        UIColor.white.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as NSString).draw(in: rect, withAttributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 30)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
}
