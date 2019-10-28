//
//  BaseViewProtocol.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
 @objc
protocol BaseViewProtocol {
   @objc
    optional func showLoading()
    @objc
    optional func hideLoading()
    @objc
    optional func loadDataSuccess(date:Any)
    @objc
    optional func loadDataFailed(with error: Error?)
    @objc
    optional func showSuccessMessage(title: String?, message: String?)
    @objc
    optional func showErrorMessage(title: String?, message: String?)
}
