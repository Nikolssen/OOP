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
        if !isImplemented()
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
    
    func isImplemented() -> Bool {
        return points.count > 1
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
    
    required init(stroke: Stroke, fill: Fill, firstPoint: CGPoint) {
        
        self.stroke = stroke
        self.fill = fill
        
       self.points.append(firstPoint)
    }
    
    convenience init?(stroke: Stroke, fill: Fill, points: [CGPoint]) {
        if let point = points.first {
            self.init(stroke: stroke, fill: fill, firstPoint: point)
            self.points = points
        }
        else {
            return nil
        }
    }
}
