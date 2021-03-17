//
//  CanvasDatasource.swift
//  OOP
//
//  Created by Admin on 13.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class CanvasDatasource
{
    private(set) var shapes = [Shape]()
//    lazy private var undoStack = [Shape]()
    
    var currentShape: Shape?
    
    func add(shape: Shape)  {
        shapes.append(shape)
    }
    
    func clear() {
        shapes.removeAll(keepingCapacity: false)
        currentShape = nil
    }
//
//    func undo() {
//        if let shape = shapes.popLast()
//        {
//            undoStack.append(shape)
//        }
//    }
//    func redo() {
//
//    }
}
