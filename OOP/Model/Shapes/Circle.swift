//
//  Circle.swift
//  OOP
//
//  Created by Admin on 16.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class Circle: NSObject, Shape {
    
    var radius: CGFloat?
    let center: CGPoint
    private let stroke: Stroke
    private let fill: Fill
    
    func draw(isPrototype: Bool) {
        if radius != nil {
            let ovalPath = UIBezierPath(arcCenter: center, radius: radius!, startAngle: 0, endAngle: (CGFloat.pi * 2), clockwise: true)
            stroke.color.setStroke()
            ovalPath.lineWidth = CGFloat(stroke.width)
            fill.color.setFill()
            if isPrototype
            {
                let dash = [CGFloat(15.0), CGFloat(15.0)]
                ovalPath.setLineDash(dash, count: 2, phase: CGFloat(30))
            }
            ovalPath.fill(with: .normal, alpha: fill.opacity)
            ovalPath.stroke()
        }
    }
    
    func replace(point: CGPoint) {
        let x = center.x - point.x
        let y = center.y - point.y
        radius = sqrt(x*x + y*y)
    }

    
    required init(stroke: Stroke, fill: Fill, firstPoint: CGPoint) {
        self.stroke = stroke
        self.fill = fill
        self.center = firstPoint
    }
    
    convenience init(stroke: Stroke, fill: Fill, center: CGPoint, radius: CGFloat)
    {
        self.init(stroke:stroke, fill: fill, firstPoint: center)
        self.radius = radius
    }
    
}
