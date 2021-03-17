//
//  Line.swift
//  OOP
//
//  Created by Admin on 12.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class Line: NSObject, Shape {
    
    var isPainting: Bool
    let isDiscrete = false
    
    private let stroke: Stroke
    private var points = [CGPoint]()
    
    func draw() {
        
        if points.count > 1
        {
            
            let line = UIBezierPath()
            line.move(to: points.first!)
            for point in points[1...] {
                line.addLine(to: point)
            }
            line.lineWidth = CGFloat(stroke.width)
            if isPainting
            {
                let dash = [CGFloat(15.0), CGFloat(15.0)]
                line.setLineDash(dash, count: 2, phase: CGFloat(30))
            }
            stroke.color.setStroke()
            line.stroke()
            
        }
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
    
    func canFinalizeDrawing() -> Bool {
        isPainting = false
        return true
    }
    
    init(stroke: Stroke, firstPoint: CGPoint) {
        self.stroke = stroke
        points.append(firstPoint)
        isPainting = true
    }
    
    convenience init?(stroke: Stroke, points: [CGPoint]) {
        if let point = points.first {
            self.init(stroke: stroke, firstPoint: point)
            self.points = points
            isPainting = false
        }
        else {
            return nil
        }
        
    }
    
    required convenience init(stroke: Stroke, fill: Fill, firstPoint: CGPoint) {
        self.init(stroke: stroke, firstPoint: firstPoint)
    }
    
}
