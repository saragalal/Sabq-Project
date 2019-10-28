//
//  HomeArticlesResponse.swift
//  SabqProject
//
//  Created by sara.galal on 10/21/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
struct HomeArticlesResponse: Codable {
    let materials: [Materials]?
    let code: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case materials
        case code
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        materials = try values.decodeIfPresent([Materials].self, forKey: .materials)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
    }
    
}
