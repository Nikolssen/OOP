//
//  TrapeziumCreator.swift
//  OOP
//
//  Created by Admin on 05.05.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import Foundation
import CoreGraphics

class TrapeziumCreator: ShapeCreator {
    func shape(stroke: Stroke, fill: Fill, firstPoint: CGPoint) -> Shape {
        return Trapezium(stroke: stroke, fill: fill, firstPoint: firstPoint)
    }
    
    func shape(from container: KeyedDecodingContainer<ShapeExternalCodingKeys>) throws -> Shape {
        let trapezium = try container.decode(Trapezium.self, forKey: .data)
        return trapezium
    }
    
    
    func shapeName() -> String {
        return "Trapezium"
    }
    
}
