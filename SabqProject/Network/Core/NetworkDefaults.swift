//
//  NetworkDefaults.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

struct NetworkDefaults {
    var baseUrl: String = "https://stage.sabq.org/api"
    var apiKey: String = "64136909d656d1d3201c552d4f3a6af3"
    var language : String = "ar-EG"
    static var `defaults` : NetworkDefaults {
        let instance = NetworkDefaults()
        return instance
    }
}
