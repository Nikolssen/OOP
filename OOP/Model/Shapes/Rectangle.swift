//
//  Rectangle.swift
//  OOP
//
//  Created by Admin on 12.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class Rectangle: NSObject, Shape {
    var isPainting: Bool
    let isDiscrete: Bool = true
    
    
    let firstAngle: CGPoint
    var secondAngle: CGPoint?
    var height: CGFloat {get{
        return abs(firstAngle.y - (secondAngle?.y ?? firstAngle.y))
        }}
    var width: CGFloat {get {
        return abs(firstAngle.x - (secondAngle?.x ?? firstAngle.x))
        }}
    var x: CGFloat {get{
        return firstAngle.x < secondAngle!.x ? firstAngle.x : secondAngle!.x}
    }
    var y: CGFloat {get{
        return firstAngle.y < secondAngle!.y ? firstAngle.y : secondAngle!.y
        }}
    
    private let stroke: Stroke
    private let fill: Fill
    
    
    func draw() {
        if secondAngle != nil {
            
            let rectanglePath = UIBezierPath(rect: CGRect(x: x, y: y, width: width, height: height))
            stroke.color.setStroke()
            rectanglePath.lineWidth = CGFloat(stroke.width)
            if isPainting
            {
                let dash = [CGFloat(15.0), CGFloat(15.0)]
                rectanglePath.setLineDash(dash, count: 2, phase: CGFloat(30))
            }
            fill.color.setFill()
            rectanglePath.fill(with: .normal, alpha: fill.opacity)
            rectanglePath.stroke()
        }
    }
    func canFinalizeDrawing() -> Bool {
        isPainting = false
        return true
    }
    
    
    func replace(point:CGPoint)  {
        secondAngle = point
    }
    
    func add(point: CGPoint) {
        
    }
    
    required init(stroke: Stroke, fill: Fill, firstPoint: CGPoint) {
        self.stroke = stroke
        self.fill = fill
        isPainting = true
        self.firstAngle = firstPoint
    }
    
    convenience init(stroke: Stroke, fill: Fill, rect: CGRect) {
        self.init(stroke: stroke, fill: fill, firstPoint: rect.origin)
        self.secondAngle = CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + rect.size.height)
        isPainting = false
    }
}
