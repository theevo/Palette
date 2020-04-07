//
//  AppDelegate.swift
//  PaletteStarter
//
//  Created by Trevor Walker on 4/7/20.
//  Copyright © 2020 Trevor Walker. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = PaletteViewController()
        window?.makeKeyAndVisible()
        
        return true
    }


}

