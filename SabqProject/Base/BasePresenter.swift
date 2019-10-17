//
//  BasePresenter.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

class BasePresenter : BasePresenterProtocol {
   
    typealias View = BaseViewController
    typealias Model = BaseModel
    var view: BaseViewController?
    var model: BaseModel
    required init(view: BaseViewController, model: BaseModel) {
        self.view = view
        self.model = model
    }
   
}
