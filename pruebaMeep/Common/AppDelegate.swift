//
//  AppDelegate.swift
//  pruebaMeep
//
//  Created by jvictorio on 30/08/2020.
//  Copyright © 2020 jvictorio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.initServicesMap()
        self.genetareInitController()
        return true
    }
    
    private func genetareInitController(){
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()
        window!.makeKeyAndVisible()
    }
    
    private func initServicesMap(){
        ManagerMap.shared.start()
    }
}

