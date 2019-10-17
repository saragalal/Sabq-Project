//
//  BasePresenterProtocol.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

protocol BasePresenterProtocol {
    associatedtype View where View : BaseViewProtocol
    associatedtype Model where Model : BaseModelProtocol
    
    /// weak reference to view
    var view: View? { get set }
    /// strong reference to model
    var model: Model { get set }
    
    init(view: View, model: Model)
}
