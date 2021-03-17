//
//  Shape.swift
//  OOP
//
//  Created by Admin on 12.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

protocol Shape: NSObject {
   
    var isDiscrete: Bool {get}
    
    func draw()
    func replace(point:CGPoint)
    func add(point: CGPoint)
    init(stroke: Stroke, fill: Fill, firstPoint: CGPoint)
    func canFinalizeDrawing() -> Bool
}

