//
//  CanvasDatasource.swift
//  OOP
//
//  Created by Admin on 13.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class CanvasDatasource: Codable
{
    private(set) var shapes = [Shape]()
    private(set) var undoStack = [Shape]()
    
    
    
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
    
    func serialize() -> Data? {
        let encoder = JSONEncoder()
        let shapeWrapper = ShapeArrayCoder(shapes: self.shapes)
        guard let data = try? encoder.encode(shapeWrapper) else {return nil}
        return data
    }
    
    func deserialize(_ data: Data) -> Bool{
        let decoder = JSONDecoder()
        if let newShapes = try? decoder.decode(ShapeArrayCoder.self, from: data) {
            if newShapes.shapes != nil
            {
                shapes = newShapes.shapes!
                return true
            }
        }
        return false
    }
}
