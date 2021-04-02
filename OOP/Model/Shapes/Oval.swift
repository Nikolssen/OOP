//
//  Oval.swift
//  OOP
//
//  Created by Admin on 13.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class Oval: Shape {

    
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
    
    enum CodingKeys: String, CodingKey{
        case stroke
        case fill
        case points
    }
    override func draw(isPrototype: Bool) {
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
    
    
    override func replace(point:CGPoint)  {
        secondAngle = point
    }
    
    override func className() -> String {
        return "Oval"
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(stroke, forKey: .stroke)
        try container.encode(fill, forKey: .fill)
        try container.encode([firstAngle, secondAngle!], forKey: .points)
    }
    
    required init(stroke: Stroke, fill: Fill, firstPoint: CGPoint) {
        self.stroke = stroke
        self.fill = fill
        self.firstAngle = firstPoint
        super.init()
    }
    
    convenience init(stroke: Stroke, fill: Fill, firstAngle: CGPoint, secondAngle: CGPoint) {
        self.init(stroke: stroke, fill: fill, firstPoint: firstAngle)
        self.secondAngle = secondAngle

    }
    
    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let points = try container.decode([CGPoint].self, forKey: .points)
        let stroke = try container.decode(Stroke.self, forKey: .stroke)
        let fill = try container.decode(Fill.self, forKey: .fill)
        self.init(stroke: stroke, fill: fill, firstAngle:points.first!, secondAngle: points.last!)
    }
    
}
