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
        
        if !isImplemented()
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
    func isImplemented() -> Bool {
        return points.count > 1
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
    
    init(stroke: Stroke, firstPoint: CGPoint) {
        self.stroke = stroke
        points.append(firstPoint)
    }
    
    convenience init?(stroke: Stroke, points: [CGPoint]) {
        if let point = points.first {
            self.init(stroke: stroke, firstPoint: point)
            self.points = points
        }
        else {
            return nil
        }

    }
    
    required convenience init(stroke: Stroke, fill: Fill, firstPoint: CGPoint) {
        self.init(stroke: stroke, firstPoint: firstPoint)
    }

}
