//
//  DetailsSceneModule.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

class DetailsSceneModule {
    class func createHomeModule()  ->DetailsSceneViewController{
        let view = DetailsSceneViewController()
        let model = DetailsSceneModel()
        //        let presenter = HomeScenePresenter(view: view ,model: model)
        //        view.setPresenter(presenter: presenter)
        return view
    }
}
