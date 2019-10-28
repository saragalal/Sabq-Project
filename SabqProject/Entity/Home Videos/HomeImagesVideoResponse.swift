//
//  HomeVideoResponse.swift
//  SabqProject
//
//  Created by sara.galal on 10/21/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
struct HomeImagesVideoResponse: Codable {
    let materials: [String]?
    let comics: [Comics]?
    let code: Int?
    
    enum CodingKeys: String, CodingKey {
        
        case materials
        case comics
        case code
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        materials = try values.decodeIfPresent([String].self, forKey: .materials)
        comics = try values.decodeIfPresent([Comics].self, forKey: .comics)
        code = try values.decodeIfPresent(Int.self, forKey: .code)
    }
    
}
