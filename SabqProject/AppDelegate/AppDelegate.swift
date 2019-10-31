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
   func application(_ application: UIApplication,
                    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupNetworking()
         window = UIWindow(frame: UIScreen.main.bounds)
        let tabBar = TabViewController()
        let view1 = HomeSceneModule.createHomeModule()
        let homeNavigation = UINavigationController(rootViewController: view1)
        view1.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "img_logo"))
        view1.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_notification_icon"),
                                                                  style: .done,
                                                                  target: self, action: nil)
        let homeItem = UITabBarItem()
        homeItem.title = "الاخبار"
        homeItem.image = #imageLiteral(resourceName: "ic_newspaper_active")
        homeNavigation.tabBarItem = homeItem
        let view2 = TabTwoViewController()
        let tabTwoNavigation = UINavigationController(rootViewController: view2)
        tabTwoNavigation.navigationBar.barTintColor = UIColor.white
        let tabTwoItem = UITabBarItem()
        tabTwoItem.title = "الشائع"
        tabTwoItem.image = #imageLiteral(resourceName: "ic_star")
        tabTwoNavigation.tabBarItem = tabTwoItem
        let view3 = TabThreeViewController()
        let tabThreeNavigation = UINavigationController(rootViewController: view3)
        tabThreeNavigation.navigationBar.barTintColor = UIColor.white
        let tabThreeItem = UITabBarItem()
        tabThreeItem.title = "الاقسام"
        tabThreeItem.image = #imageLiteral(resourceName: "ic_list")
        tabThreeNavigation.tabBarItem = tabThreeItem
        let view4 = TabFourViewController()
        let tabFourNavigation = UINavigationController(rootViewController: view4)
        tabFourNavigation.navigationBar.barTintColor = UIColor.white
        let tabFourItem = UITabBarItem()
        tabFourItem.title = "البحث"
        tabFourItem.image = #imageLiteral(resourceName: "ic_search")
        tabFourNavigation.tabBarItem = tabFourItem
        let array = [homeNavigation, tabTwoNavigation, tabThreeNavigation, tabFourNavigation]
        tabBar.viewControllers = array.reversed()
        tabBar.selectedViewController = homeNavigation
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        return true
    }
}
