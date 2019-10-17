//
//  NetworkDefaults.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

struct NetworkDefaults {
    var baseUrl: String = "https://api.themoviedb.org/3"
    var apiKey: String = "1a45f741aada87874aacfbeb73119bae"
    var language : String = "en-US"
    static var `defaults` : NetworkDefaults {
        let instance = NetworkDefaults()
        return instance
    }
}
