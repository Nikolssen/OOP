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
    
    var currentShape: Shape? = nil
    
    func add(shape: Shape)  {
        shapes.append(shape)
    }
    
    func clear() {
        shapes.removeAll(keepingCapacity: false)
    }
    
}
