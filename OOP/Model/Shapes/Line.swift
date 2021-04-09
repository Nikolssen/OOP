//
//  Line.swift
//  OOP
//
//  Created by Admin on 12.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class Line: NSObject, Shape, Codable{

    
    
    
    private let stroke: Stroke
    private var points = [CGPoint]()
    
    private enum CodingKeys: String, CodingKey{
        case stroke
        case points
    }
    func draw(isPrototype: Bool) {
        
        if points.count > 1
        {
            
            let line = UIBezierPath()
            line.move(to: points.first!)
            for point in points[1...] {
                line.addLine(to: point)
            }
            line.lineWidth = CGFloat(stroke.width)
            if isPrototype
            {
                let dash = [CGFloat(15.0), CGFloat(15.0)]
                line.setLineDash(dash, count: 2, phase: CGFloat(30))
            }
            stroke.color.setStroke()
            line.stroke()
            
        }
    }
    func className() -> String {
        return "Line"
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
    
    func canFinalizeDrawing(afterPanGesture: Bool) -> Bool {
        return !afterPanGesture
    }
    

    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(stroke, forKey: .stroke)
        try container.encode(points, forKey: .points)
    }
    
    init(stroke: Stroke, firstPoint: CGPoint) {
        self.stroke = stroke
        points.append(firstPoint)
        super.init()
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
    
    func encodeShape(in container: KeyedEncodingContainer<ShapeExternalCodingKeys>) throws {
        var encoder = container
        try encoder.encode(self, forKey: .data)
    }
    
    static func makeShape(from container: KeyedDecodingContainer<ShapeExternalCodingKeys>) throws -> Shape {
        let line = try container.decode(Line.self, forKey: .data)
        return line
    }

    required convenience init(stroke: Stroke, fill: Fill, firstPoint: CGPoint) {
        self.init(stroke: stroke, firstPoint: firstPoint)
    }
    
    required convenience init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let stroke = try container.decode(Stroke.self, forKey: .stroke)
        let points = try container.decode([CGPoint].self, forKey: .points)
        self.init(stroke:stroke, points: points)!
        
    }
    
}
