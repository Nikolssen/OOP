//
//  HexColorExtension.swift
//  OOP
//
//  Created by Admin on 12.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//
import UIKit

extension UIColor{
    
    convenience init(red: Int, green: Int, blue: Int){
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1)
    }
    
    func rgbDescription() -> (red: Int, green: Int, blue: Int) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: nil)
        return (Int(red * 255), Int(green * 255), Int(blue * 255))
    }
    func hexDescription() -> String {
        let rgb = self.rgbDescription()
        return String(format: "#%02X%02X%02X", rgb.red, rgb.green, rgb.blue)
    }
    
    convenience init(hex: String) {
        var start = hex.index(after: hex.startIndex)
        var last = hex.index(start, offsetBy: 1)
        var substring = hex[start...last]
        
        let red = Int(substring, radix: 16) ?? 0
        start = hex.index(after: last)
        last  = hex.index(start, offsetBy: 1)
        substring = hex[start...last]
        let green = Int(substring, radix: 16) ?? 0
        start = hex.index(after: last)
        last = hex.index(start, offsetBy: 1)
        substring = hex[start...last]
        let blue = Int(substring, radix: 16) ?? 0
        self.init(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1)
    }
}
