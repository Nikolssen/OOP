//
//  CanvasDatasource.swift
//  OOP
//
//  Created by Admin on 13.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class CanvasDatasource: Encodable
{
    private(set) var shapes = [Shape]()
    private(set) var undoStack = [Shape]()
    
    enum CodingKeys: String, CodingKey
    {
        case type
        case data
    }
    
    
    var currentShape: Shape?
    
    func add(shape: Shape)  {
        shapes.append(shape)
    }
    
    func clear() {
        shapes.removeAll()
    }
    
    func undo() {
        if let shape = shapes.popLast()
        {
            undoStack.append(shape)
        }
    }
    func redo() {
        if let shape = undoStack.popLast(){
            shapes.append(shape)
        }
    }
    
    func resetUndoStack(){
        undoStack.removeAll()
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        for shape in shapes
        {
            var shapeContainer = container.nestedContainer(keyedBy: CodingKeys.self)
            try? shapeContainer.encode(shape.className(), forKey: .type)
            try? shapeContainer.encode(shape, forKey: .data)
        }
    }
    
    convenience required init(from decoder: Decoder) throws {
        var array = [Shape]()
        if var container = try? decoder.unkeyedContainer()
        {
            
            let helper = ShapeOptions()
            while (!container.isAtEnd) {
                let shapeContainer = try container.nestedContainer(keyedBy: CodingKeys.self)
                let shapeType = try shapeContainer.decode(String.self, forKey: .type)
                helper.chooseShape(meta: shapeType)
                let shape = try shapeContainer.decode(helper.chosenShape, forKey: .data)
                array.append(shape)
 
            }
        }
        self.init()
        self.shapes = array

    }
    
}
