//
//  Shape.swift
//  OOP
//
//  Created by Admin on 12.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

protocol Shape:  NSObject{

    
    func draw(isPrototype: Bool)
    //Specifies if shape that is to be drawn should be solid or dashed
    func replace(point:CGPoint)
    //Replaces the last point or creates new
    func add(point: CGPoint)
    //Implement this method if you deal with complex shape
    func canFinalizeDrawing(afterPanGesture: Bool) -> Bool
    //Implement this method if you need more than one PanGesture session
    init(stroke: Stroke, fill: Fill, firstPoint: CGPoint)
    //Standart init for all shapes in new PanGesture session

    
}

extension Shape {
    func add(point: CGPoint)  {
    }
    func canFinalizeDrawing(afterPanGesture:Bool) -> Bool {
        return true
    }

}
