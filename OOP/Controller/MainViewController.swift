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
    
   
    @IBAction func clear(_ sender: UIBarButtonItem) {
        canvasDatasource.clear()
        canvas.setNeedsDisplay()
    }
    
    @IBAction func processPanGesture(_ sender: UIPanGestureRecognizer) {

            switch sender.state {
            case .began:
                canvasDatasource.currentShape = shapeOptions.chosenShape.init(stroke: drawOptions.stroke, fill: drawOptions.fill, firstPoint: sender.location(in: self.canvas))
            case .changed:
                canvasDatasource.currentShape!.replace(point: sender.location(in: self.canvas))
            case .recognized:

                    canvasDatasource.add(shape: canvasDatasource.currentShape!)
                    canvasDatasource.currentShape = nil
            
            default:
                canvasDatasource.currentShape = nil
            }
        self.canvas.setNeedsDisplay()
        }

}
