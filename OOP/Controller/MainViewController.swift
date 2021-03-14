//
//  MainViewController.swift
//  OOP
//
//  Created by Admin on 11.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    var drawOptions = DrawOptions()
    var shapeOptions = ShapeOptions()
    var canvasDatasource = CanvasDatasource()
    
    @IBOutlet weak var canvas: Canvas!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        canvas.datasource = canvasDatasource
        
        
    }


    @IBAction func pencilOptionsAction(_ sender: UIBarButtonItem) {
        let penVC = PenViewController(nibName: "PenViewController", bundle: nil)
        penVC.options = drawOptions
        present(penVC, animated: true)
    }
    
    @IBAction func shapeSelectionAction(_ sender: UIBarButtonItem) {
        
        let shapeVC = ShapeSelectionController()
        shapeVC.options = shapeOptions
        present(shapeVC, animated: true)
        
    }
    
    @IBAction func paintSomething(_ sender: UIBarButtonItem) {
        canvasDatasource.clear()
        
        if shapeOptions.chosenShape === Line.self {
            let line = Line(stroke: drawOptions.stroke, points: [CGPoint(x: 20, y: 30), CGPoint(x: 10, y: 100), CGPoint(x: 130, y: 90)])
            canvasDatasource.add(shape: line)
        }
        
        if shapeOptions.chosenShape === Oval.self {
            let oval = Oval(stroke: drawOptions.stroke, fill: drawOptions.fill, rect: CGRect(x: 45, y: 90, width: 100, height: 56))
            canvasDatasource.add(shape: oval)
        }
        
        if shapeOptions.chosenShape === Rectangle.self {
            let rectangle = Rectangle(stroke: drawOptions.stroke, fill: drawOptions.fill, rect: CGRect(x: 100, y: 200, width: 70, height: 60))
            canvasDatasource.add(shape: rectangle)
        }
        
        if shapeOptions.chosenShape === Polygon.self {
            let polygon = Polygon(stroke: drawOptions.stroke, fill: drawOptions.fill, points: [CGPoint(x: 130, y: 80), CGPoint(x:100, y: 200), CGPoint(x: 230, y: 180)])
            canvasDatasource.add(shape: polygon)
        }
        canvas.setNeedsDisplay()
    }
    
}
