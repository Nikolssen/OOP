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
    
    func draw() {
        if self.secondAngle == nil {return}
        let ovalPath = UIBezierPath(ovalIn: CGRect(x: x, y: y, width: width, height: height))
        stroke.color.setStroke()
        ovalPath.lineWidth = CGFloat(stroke.width)
        fill.color.setFill()
        ovalPath.fill(with: .normal, alpha: fill.opacity)
        ovalPath.stroke()
    }
    
    func replace(point:CGPoint)  {
        secondAngle = point
    }
    
    init(stroke: Stroke, fill: Fill, firstAngle: CGPoint) {
        self.stroke = stroke
        self.fill = fill
        self.firstAngle = firstAngle
    }
    
    convenience init(stroke: Stroke, fill: Fill, rect: CGRect) {
        self.init(stroke: stroke, fill: fill, firstAngle: rect.origin)
        self.secondAngle = CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y + rect.size.height)
    }
    
}
