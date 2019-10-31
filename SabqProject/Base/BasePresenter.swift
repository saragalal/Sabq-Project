//
//  BasePresenter.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

class BasePresenter: BasePresenterProtocol {

    var view: BaseViewProtocol?
    var model: BaseModelProtocol
    required init(view: BaseViewProtocol, model: BaseModelProtocol) {
        self.view = view
        self.model = model
    }
    func viewDidLoad() {
        
    }
}
