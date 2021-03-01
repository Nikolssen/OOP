//
//  Canvas.swift
//  OOP
//
//  Created by Admin on 28.02.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class Canvas: UIView {

    

    override func draw(_ rect: CGRect) {
        //Drawing oval
        let circlePath = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 100, height: 200))
        circlePath.lineWidth = 3
        UIColor.red.setStroke()
        circlePath.stroke()
        
        //Drawing Oval
        let rectanglePath = UIBezierPath(rect: CGRect(x: 200, y: 100, width: 15, height: 200))
        UIColor.green.setStroke()
        rectanglePath.lineWidth = 1
        UIColor.green.setFill()
        rectanglePath.fill()
        rectanglePath.stroke()
        
        //Drawing Line
        let line = UIBezierPath()
        line.move(to: CGPoint(x: 200, y: 200))
        line.addLine(to: CGPoint(x:300, y:300))
        UIColor.black.setStroke()
        line.stroke()
        
        //Drawing Polyline
        let polyline = UIBezierPath()
        polyline.move(to: CGPoint(x:200, y:400))
        polyline.addLine(to: CGPoint(x:200, y:500))
        polyline.addLine(to: CGPoint(x:100, y:270))
        polyline.addLine(to: CGPoint(x:350, y:250))
        UIColor.cyan.setStroke()
        polyline.lineWidth = 5
        polyline.stroke()
        
        let polygon = UIBezierPath()
        polygon.move(to: CGPoint(x:400, y:600))
        polygon.addLine(to: CGPoint(x:300, y:500))
        polygon.addLine(to: CGPoint(x:90, y:470))
        polygon.addLine(to: CGPoint(x:370, y:450))
        polygon.close()
        UIColor.yellow.setFill()
        UIColor.orange.setStroke()
        polygon.lineWidth = 5
        polygon.stroke()
        polygon.fill()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.white

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}
