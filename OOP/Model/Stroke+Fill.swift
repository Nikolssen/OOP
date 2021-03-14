//
//  Stroke+Fill.swift
//  OOP
//
//  Created by Admin on 14.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

struct Stroke {
    private(set) var color: UIColor
    private(set) var width: Int
    
    mutating func setWidth(_ width: Int) {
        switch width {
        case let x where x < 1:
            self.width = 1
        case let x where x > 10:
            self.width = 10
        default:
            self.width = width
        }
    }
    mutating func setColor(_ color: UIColor){
        self.color = color
    }
    
    init(color: UIColor, width: Int){
        self.color = color
        switch width {
        case let x where x < 1:
            self.width = 1
        case let x where x > 10:
            self.width = 10
        default:
            self.width = width
        }
    }
    
}

struct Fill {
    private(set) var color: UIColor
    private(set) var opacity: CGFloat
    
    mutating func setColor(_ color: UIColor){
        self.color = color
    }
    
    mutating func setOpacity(_ opacity: CGFloat) {
        switch opacity {
        case let x where x < 0.0:
            self.opacity = 0.0
        case let x where x > 1.0:
            self.opacity = 1.0
        default:
            self.opacity = opacity
        }
    }
}
