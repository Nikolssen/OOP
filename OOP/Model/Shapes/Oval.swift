//
//  Oval.swift
//  OOP
//
//  Created by Admin on 13.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class Oval: NSObject, Shape {

    
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
    
    func draw(isPrototype: Bool) {
        if secondAngle != nil {
            let ovalPath = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: width, height: height))
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
        }}
    
    
    func replace(point:CGPoint)  {
        secondAngle = point
    }
    
    
    required init(stroke: Stroke, fill: Fill, firstPoint: CGPoint) {
        self.stroke = stroke
        self.fill = fill
        self.firstAngle = firstPoint

    }
    
    convenience init(stroke: Stroke, fill: Fill, rect: CGRect) {
        self.init(stroke: stroke, fill: fill, firstPoint: rect.origin)
        self.secondAngle = CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + rect.size.height)

    }
    
}
