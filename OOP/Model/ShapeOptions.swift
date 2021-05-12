//
//  ShapeOptions.swift
//  OOP
//
//  Created by Admin on 13.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class ShapeOptions{
    private(set) static var availableCreators: [ShapeCreator] = [LineCreator(), PolygonCreator(), RectangleCreator(), OvalCreator(), CircleCreator(), TrapeziumCreator()]
    
    private(set) var creator: ShapeCreator = availableCreators.first!
    
    
    func chooseShape(at index: Int) {
        if index < ShapeOptions.availableCreators.count && index >= 0 {
            creator = ShapeOptions.availableCreators[index]
        }
    }
    
    func chooseShape(by name: String) {
        for shapeCreator in ShapeOptions.availableCreators {
            if name == shapeCreator.shapeName() {
                creator = shapeCreator
                break
            }
        }
        creator = ShapeOptions.availableCreators[1] //Define Polygonal Behaviour in case of smth unusual
    }
    
//    static func addShape(meta: String) {
//        let appName = Bundle.main.infoDictionary!["CFBundleName"] as! String
//        guard let metaType = NSClassFromString(appName + "." + meta) as? Line.Type else { return }
//        if !availableCreators.contains(meta)
//        {
//            availableCreators .append(meta)
//        }
//    }
//
    
}
