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
    
    func draw() {
        if points.count <= 1
            {return}
        
        let polygonPath = UIBezierPath()
        polygonPath.move(to: points.first!)
        for point in points[1...] {
            polygonPath.addLine(to: point)
        }
        polygonPath.close()
        polygonPath.lineWidth = CGFloat(stroke.width)
        fill.color.setFill()
        stroke.color.setStroke()
        polygonPath.stroke()
        polygonPath.fill(with: .normal, alpha: fill.opacity)
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
    
    init(stroke: Stroke, fill: Fill, firstPoint: CGPoint? = nil) {
        
        self.stroke = stroke
        self.fill = fill
        
       if firstPoint != nil
       {self.points.append(firstPoint!)}
    }
    
    convenience init(stroke: Stroke, fill: Fill, points: [CGPoint]) {
        self.init(stroke: stroke, fill: fill)
        self.points = points
    }
}
