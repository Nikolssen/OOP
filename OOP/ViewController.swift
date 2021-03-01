//
//  ViewController.swift
//  OOP
//
//  Created by Admin on 28.02.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var canvas: Canvas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        canvas = Canvas(frame: UIScreen.main.bounds) //Create canvas within all screen frame
        self.view.addSubview(canvas!)
        self.view.backgroundColor = UIColor.green
    }
    
    override func viewDidAppear(_ animated: Bool) {
        canvas?.setNeedsDisplay()
    }

    init(){
        super.init(nibName: nil, bundle:nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
    }
}

