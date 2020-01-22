//
//  AppDelegate.swift
//  RxHW
//
//  Created by Гузель Шарафутдинова on 10/11/2019.
//  Copyright © 2019 Гузель Шарафутдинова. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.backgroundColor = UIColor.white
            let mainView = LoginViewController()
            mainView.isFirestLoad = true
            window.rootViewController = mainView
            window.makeKeyAndVisible()
        }
        return true
    }
}
