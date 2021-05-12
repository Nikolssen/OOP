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
    func replace(point:CGPoint)
    func add(point: CGPoint)
    func canFinalizeDrawing(afterPanGesture: Bool) -> Bool
    func encodeShape(in container: KeyedEncodingContainer<ShapeExternalCodingKeys>) throws
}
extension Shape{
    func add(point: CGPoint){
    }
    
    func canFinalizeDrawing(afterPanGesture: Bool) -> Bool {
        return true
    }
}

enum ShapeExternalCodingKeys: String, CodingKey
{
    case type
    case data
}

