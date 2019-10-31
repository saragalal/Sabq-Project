//
//  AppDelegate+Extensions.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

extension AppDelegate {
    func setupNetworking() {
        NetworkManager.shared = NetworkManager(config: NetworkDefaults())
    }
    
}
