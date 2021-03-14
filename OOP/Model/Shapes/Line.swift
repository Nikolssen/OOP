//
//  Line.swift
//  OOP
//
//  Created by Admin on 12.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class Line: NSObject, Shape {
    
    private let stroke: Stroke
    private var points = [CGPoint]()
    
    func draw() {
        
        if points.count <= 1
            {return}
        
        let line = UIBezierPath()
        line.move(to: points.first!)
        for point in points[1...] {
            line.addLine(to: point)
        }
        line.lineWidth = CGFloat(stroke.width)
        stroke.color.setStroke()
        line.stroke()
        
    }
    func add(point: CGPoint) {
        
        points.append(point)
    }
    
    func replace(point:CGPoint)  {
        
        if (points.count>1) {
            _ = points.popLast()
        }
            points.append(point)
    }
    
    init(stroke: Stroke, firstPoint: CGPoint? = nil) {
        self.stroke = stroke
        
        if firstPoint != nil
            {points.append(firstPoint!)}
    }
    
    convenience init(stroke: Stroke, points: [CGPoint]) {
        self.init(stroke: stroke)
        self.points = points
    }

}
