//
//  TabViewController.swift
//  SabqProject
//
//  Created by sara.galal on 10/24/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    var impact = UIImpactFeedbackGenerator(style: .medium)
    override func viewDidLoad() {
        super.viewDidLoad()
        impact.prepare()
    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("selected item")
        impact.impactOccurred()
    }
}
