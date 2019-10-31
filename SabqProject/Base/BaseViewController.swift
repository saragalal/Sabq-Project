//
//  BaseViewController.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController, BaseViewProtocol {
    
    func showLoading() {
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
    func showErrorMessage(title: String?, message: String?) {
        print("showErrorMessage")
    }
    
}
