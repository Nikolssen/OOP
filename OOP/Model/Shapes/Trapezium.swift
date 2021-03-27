//
//  Trapezium.swift
//  OOP
//
//  Created by Admin on 16.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//
//
import UIKit
class Trapezium: NSObject, Shape{

    private let stroke: Stroke
    private let fill: Fill
    private var points = [CGPoint]()
    
    func draw(isPrototype: Bool) {
        if points.count > 1
        {
            
            let polygonPath = UIBezierPath()
            polygonPath.move(to: points.first!)
            for point in points[1...] {
                polygonPath.addLine(to: point)
            }
            if points.count == 4{
                polygonPath.close()
                fill.color.setFill()
                polygonPath.fill(with: .normal, alpha: fill.opacity)
            }
            
            polygonPath.lineWidth = CGFloat(stroke.width)
            
            stroke.color.setStroke()
            if isPrototype
            {
                let dash = [CGFloat(15.0), CGFloat(15.0)]
                polygonPath.setLineDash(dash, count: 2, phase: CGFloat(30))
            }
            polygonPath.stroke()
            
        }
    }
    
    func replace(point: CGPoint) {
        let count = points.count
        
        switch count {
        case  2:
            if !areColinear(points[0], points[1], point){
                _ = points.popLast()
                points.append(point)
            }
        case 3:
            _ = points.popLast()
            points.append(point)
        case 4:
            let axis = Axis.changingAxis(point1: points[0], point2: points[1])
            let newPoint = makeParallel(points[0], points[1], points[2], point, changingAxis: axis)
            _ = points.popLast()
            points.append(newPoint)
        default:
            points.append(point)
        }
        
        
    }
    
    private func areColinear(_ point1: CGPoint, _ point2: CGPoint, _ point3: CGPoint) -> Bool {
        return (point2.y - point1.y)/(point2.x - point1.x) == (point3.y - point1.y)/(point3.x - point1.x)
    }
    
    private func makeParallel(_ point1: CGPoint, _ point2: CGPoint, _ point3: CGPoint, _ point4: CGPoint, changingAxis: Axis) -> CGPoint {
        switch changingAxis {
        case .x:
            let y4: CGFloat = (point2.y - point1.y)*(point4.x - point3.x)/(point2.x - point1.x) + point3.y
            return CGPoint(x: point4.x, y: y4)
        default:
            let x4 = (point4.y - point3.y)*(point2.x - point1.x)/(point2.y - point1.y) + point3.x
            return CGPoint(x: x4, y: point4.y)
        }
    }
    
    func add(point: CGPoint) {
        points.append(point)
        
    }
    func canFinalizeDrawing(afterPanGesture: Bool) -> Bool {
        
        if points.count == 4 {
            return true
        }
        return false
    }
    
    
    required init(stroke: Stroke, fill: Fill, firstPoint: CGPoint) {
        self.stroke = stroke
        self.fill = fill
        self.points.append(firstPoint)
    }
    
    convenience init?(stroke: Stroke, fill: Fill, points: [CGPoint]) {
        if points.count == 4 {
            self.init(stroke: stroke, fill: fill, firstPoint: points.first!)
            self.points = points
        }
        else {
            return nil
        }
    }
}

fileprivate enum Axis{
    case x
    case y
    
    static func changingAxis(point1: CGPoint, point2: CGPoint) -> Axis{
        let deltaX = abs(point1.x - point2.x)
        let deltaY = abs(point1.y - point2.y)
        
        if deltaX >= deltaY {
            return .x
        }
        else
        {
            return .y
        }
    }
}
