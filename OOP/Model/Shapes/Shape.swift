//
//  Shape.swift
//  OOP
//
//  Created by Admin on 12.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class Shape:  NSObject, Codable{
    
    func draw(isPrototype: Bool)
    {
    //Argument specifies if shape that is to be drawn should be solid or dashed
        fatalError("Incomplete implementation")
    }

    func replace(point:CGPoint)
    {
    //Replaces the last point or creates new
        fatalError("Incomplete implementation")
    }
    
    func add(point: CGPoint){
    //Implement this method if you deal with complex shape
    }
    
    func canFinalizeDrawing(afterPanGesture: Bool) -> Bool{
        //Implement this method if you need more than one PanGesture session
        return true
    }
    
    func className() -> String{
        fatalError("Incomplete implementation")
    }
    
    required init(stroke: Stroke, fill: Fill, firstPoint: CGPoint){
        //Standart init for all shapes in new PanGesture session
    }
    override init() {
        
    }
    func encode(to encoder: Encoder) throws {
        fatalError("Incomplete implementation")
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("Incomplete implementation")
    }
    
}


