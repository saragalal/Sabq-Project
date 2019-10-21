//
//  NetworkManager.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import Moya

typealias StatusCode = Int

class NetworkManager {
    
    static var shared: NetworkManager!
    
    var networkConfig: NetworkDefaults!
    
    let provider: MoyaProvider<MultiTarget>
    
    init(config: NetworkDefaults = NetworkDefaults.defaults) {
        self.networkConfig = config
        
        let headerPlugin = StaticHeaderPlugin(
            headers: [:])
        
        provider = MoyaProvider<MultiTarget>(//manager: ,
            plugins: [headerPlugin, NetworkLoggerPlugin(verbose: false)])
    }
    
}
