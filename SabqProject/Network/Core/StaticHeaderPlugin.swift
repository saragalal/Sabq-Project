//
//  StaticHeaderPlugin.swift
//  SabqProject
//
//  Created by sara.galal on 10/17/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import Moya

public struct StaticHeaderPlugin: PluginType {
    var headers: [String: String] = [:]
    public init(headers: [String: String]) {
        self.headers = headers
    }
}
