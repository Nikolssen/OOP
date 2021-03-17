//
//  ShapeSelectionController.swift
//  OOP
//
//  Created by Admin on 13.03.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

class ShapeSelectionController: UITableViewController, Presentable {
    
    weak var options: ShapeOptions!
    
    
    let customTransitionDelegate = ModalDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.cornerRadius = 25
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "shapeCell")
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShapeOptions.possibleShapes.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "shapeCell", for: indexPath)
        let textData = ShapeOptions.possibleShapes[indexPath.row]
        cell.textLabel?.text = textData
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        options.chooseShape(meta: ShapeOptions.possibleShapes[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
    
    init() {
        super.init(style: .plain)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    func configure()  {
        modalPresentationStyle = .custom
        transitioningDelegate = customTransitionDelegate
    }
    
    
    
}
