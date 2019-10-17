//
//  AppDelegate.swift
//  SabqProject
//
//  Created by sara.galal on 10/16/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
   

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupNetworking()
        window = UIWindow(frame: UIScreen.main.bounds)
        let view = HomeSceneModule.createHomeModule()
        let navigation = UINavigationController(rootViewController: view)
        navigation.navigationBar.barTintColor = UIColor.white
        window!.rootViewController = navigation
        window!.makeKeyAndVisible()
        return true
    }
}

