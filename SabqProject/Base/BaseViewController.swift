//
//  BaseViewController.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import UIKit
class BaseViewController : UIViewController, BaseViewProtocol {
    var presenter:BasePresenter?
    
    public func setPresenter (presenter: BasePresenter) {
        self.presenter = presenter
    }
    func showLoading(allowNavigation: Bool) {
        print("showLoading")
    }
    func hideLoading() {
        print("hideLoading")
    }
    func loadDataSuccess() {
        print("loadDataSuccess")
    }
    func loadDataFailed(with error: Error?) {
        print("loadDataFailed")
    }
    func showSuccessMessage() {
        print("showSuccessMessage")
    }
    func showErrorMessage() {
        print("showErrorMessage")
    }
    
}
