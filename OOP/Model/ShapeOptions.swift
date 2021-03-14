//
//  ShapeOptions.swift
//  OOP
//
//  Created by Admin on 13.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class ShapeOptions{
    private(set) static var possibleShapes = ["Line", "Rectangle", "Oval", "Polygon"]
    
    private(set) var chosenShape: Shape.Type
    
    init() {
        chosenShape = Line.self
    }
    
    func chooseShape(meta: String) {
        let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String
        guard let metaType = NSClassFromString(appName + "." + meta) as? Shape.Type else { return }
        chosenShape = metaType
    }
    
//    static func addShape(meta: String) {
//        let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String
//        guard let metaType = NSClassFromString(appName + "." + meta) as? Line.Type else { return }
//        if !possibleShapes.contains(meta)
//        {
//            possibleShapes .append(meta)
//        }
//    }
//
    
}
