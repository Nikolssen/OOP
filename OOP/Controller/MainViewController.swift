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
    
    @IBOutlet weak var undoButton: UIBarButtonItem!
    @IBOutlet weak var redoButton: UIBarButtonItem!
    @IBOutlet weak var canvas: Canvas!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas.datasource = canvasDatasource
    }
    
    @IBAction func undoAction(_ sender: UIBarButtonItem) {
        canvasDatasource.undo()
        if canvasDatasource.shapes.count == 0
        {
            undoButton.isEnabled = false
        }
            redoButton.isEnabled = true

        canvas.setNeedsDisplay()
    }
    
    @IBAction func redoAction(_ sender: UIBarButtonItem) {
        canvasDatasource.redo()
        if canvasDatasource.undoStack.count == 0 {
            redoButton.isEnabled = false
        }
        undoButton.isEnabled = true
        canvas.setNeedsDisplay()
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
        canvasDatasource.currentShape = nil
        canvasDatasource.resetUndoStack()
        redoButton.isEnabled = false
        undoButton.isEnabled = false
        canvas.setNeedsDisplay()
    }
    
    @IBAction func processPanGesture(_ sender: UIPanGestureRecognizer) {
        
        switch sender.state {
        case .began:
            if (canvasDatasource.currentShape != nil) {
                canvasDatasource.currentShape!.add(point:sender.location(in: self.canvas))
            }
            else
            {
                canvasDatasource.currentShape = shapeOptions.chosenShape.init(stroke: drawOptions.stroke, fill: drawOptions.fill, firstPoint: sender.location(in: self.canvas))
            }
        case .changed:
            canvasDatasource.currentShape!.replace(point: sender.location(in: self.canvas))
        case .recognized:

                if canvasDatasource.currentShape!.canFinalizeDrawing(afterPanGesture: true)
                {
                    canvasDatasource.add(shape: canvasDatasource.currentShape!)
                    canvasDatasource.resetUndoStack()
                    redoButton.isEnabled = false
                    undoButton.isEnabled = true
                    fallthrough
                }
        default:
            canvasDatasource.currentShape = nil
        }
        self.canvas.setNeedsDisplay()
    }
    
    @IBAction func processLongTouch(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .recognized
        {
            if canvasDatasource.currentShape != nil
            {
                if canvasDatasource.currentShape!.canFinalizeDrawing(afterPanGesture: false){
                    canvasDatasource.add(shape: canvasDatasource.currentShape!)
                    canvasDatasource.resetUndoStack()
                    redoButton.isEnabled = false
                    undoButton.isEnabled = true
                    canvasDatasource.currentShape = nil
                    canvas.setNeedsDisplay()
                }
            }
        }
    }
    override func didReceiveMemoryWarning() {
        canvasDatasource.clear()
        canvasDatasource.currentShape = nil
        canvasDatasource.resetUndoStack()
        redoButton.isEnabled = false
        undoButton.isEnabled = false
        canvas.setNeedsDisplay()
    }
}

