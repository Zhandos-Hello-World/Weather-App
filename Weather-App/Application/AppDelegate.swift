//
//  AppDelegate.swift
//  Weather-App
//
//  Created by Zhandos Baimurat on 10.09.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = HomeAssembly.assembler.homeVC()
        window?.makeKeyAndVisible()
        return true
    }
}

