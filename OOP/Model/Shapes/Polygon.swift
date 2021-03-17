//
//  Polygon.swift
//  OOP
//
//  Created by Admin on 13.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class Polygon: NSObject, Shape {
    
    
    
    private let stroke: Stroke
    private let fill: Fill
    
    private var points = [CGPoint]()
    var isPainting: Bool
    let isDiscrete = false
    func draw() {
        if points.count > 1
        {
            
            let polygonPath = UIBezierPath()
            polygonPath.move(to: points.first!)
            for point in points[1...] {
                polygonPath.addLine(to: point)
            }
            polygonPath.close()
            polygonPath.lineWidth = CGFloat(stroke.width)
            fill.color.setFill()
            stroke.color.setStroke()
            if isPainting
            {
                let dash = [CGFloat(15.0), CGFloat(15.0)]
                polygonPath.setLineDash(dash, count: 2, phase: CGFloat(30))
            }
            polygonPath.fill(with: .normal, alpha: fill.opacity)
            polygonPath.stroke()
            
        }
    }
    
    func add(point: CGPoint) {
        points.append(point)
    }
    
    func replace(point: CGPoint) {
        if (points.count>1) {
            _ = points.popLast()
        }
        points.append(point)
    }
    
    func canFinalizeDrawing() -> Bool {
        isPainting = false
        return true
    }
    
    
    required init(stroke: Stroke, fill: Fill, firstPoint: CGPoint) {
        
        self.stroke = stroke
        self.fill = fill
        isPainting = true
        self.points.append(firstPoint)
    }
    
    convenience init?(stroke: Stroke, fill: Fill, points: [CGPoint]) {
        if let point = points.first {
            self.init(stroke: stroke, fill: fill, firstPoint: point)
            self.points = points
            isPainting = false
        }
        else {
            return nil
        }
    }
}
