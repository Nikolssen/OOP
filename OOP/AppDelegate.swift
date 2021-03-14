//
//  AppDelegate.swift
//  OOP
//
//  Created by Admin on 28.02.2021.
//  Copyright © 2021 Ivan Budovich. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainWindow = UIWindow(frame: UIScreen.main.bounds)
        let rootViewController = MainViewController(nibName: "MainViewController", bundle: nil)
        mainWindow.rootViewController = rootViewController
        window = mainWindow
        window?.makeKeyAndVisible()
        
        return true
    }


}

