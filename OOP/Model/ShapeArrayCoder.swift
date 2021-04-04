//
//  ShapeArrayCoder.swift
//  OOP
//
//  Created by Admin on 04.04.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import Foundation

class ShapeArrayCoder: Codable {
    
    var shapes: [Shape]?
    
    init(shapes: [Shape]) {
        self.shapes = shapes
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        for shape in self.shapes!
        {
            var shapeContainer = container.nestedContainer(keyedBy: Shape.ExternalCodingKeys.self)
            try? shapeContainer.encode(shape.className(), forKey: .type)
            try? shapeContainer.encode(shape, forKey: .data)
        }
    }
    
    required init(from decoder: Decoder) throws {
        var shapes = [Shape]()
        if var container = try? decoder.unkeyedContainer()
        {
            let helper = ShapeOptions()
            while (!container.isAtEnd) {
                let shapeContainer = try container.nestedContainer(keyedBy: Shape.ExternalCodingKeys.self)
                let shapeTypeString = try shapeContainer.decode(String.self, forKey: .type)
                helper.chooseShape(meta: shapeTypeString)
                let metaType = helper.chosenShape
                let shape = try metaType.makeShape(from: shapeContainer)
                shapes.append(shape)
            }
        }
        self.shapes = shapes
    }
    
}
