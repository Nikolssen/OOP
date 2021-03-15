//
//  Canvas.swift
//  OOP
//
//  Created by Admin on 28.02.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class Canvas: UIView {

    
    //as far as draw(_rect:) method is called indirectly
    //by the system, the array cannot be send as paramater
    //the keeping array in canvas spoils single-responsibility
    
    weak var datasource: CanvasDatasource?;

    override func draw(_ rect: CGRect) {
  
        guard let shapes = datasource?.shapes else {return}
        
        for shape in shapes {
            shape.draw()
        }
        
        guard let newShape = datasource!.currentShape else {return}
        newShape.draw()
    }
    
    override init(frame:CGRect) {
        super.init(frame:frame)
        self.backgroundColor = UIColor.white

    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
}
