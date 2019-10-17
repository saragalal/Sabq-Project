//
//  HomeScenePresenter.swift
//  SabqProject
//
//  Created by sara.galal on 10/16/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

class HomeScenePresenter: HomeScenePresenterProtocol {
   
   typealias View = HomeSceneViewController
   typealias Model = HomeSceneModel
   var view: HomeSceneViewController?
   var model: HomeSceneModel
   
   required init(view: HomeSceneViewController, model: HomeSceneModel) {
        self.view = view
        self.model = model
    }
}
