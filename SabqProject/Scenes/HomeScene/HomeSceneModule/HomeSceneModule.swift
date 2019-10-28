//
//  HomeSceneModule.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import UIKit
class HomeSceneModule {
    class func createHomeModule() -> HomeSceneViewController {
        let view = HomeSceneViewController()
        let model = HomeSceneModel()
        let presenter = HomeScenePresenter(view: view, model: model)
        view.setPresenter(presenter: presenter)
        return view
    }
}
