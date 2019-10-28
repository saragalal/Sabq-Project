//
//  HomeResponse.swift
//  SabqProject
//
//  Created by sara.galal on 10/20/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
struct HomeMaterialResponse: Codable {
let slider: [Slider?]?
var materials: [Materials?]?
let code: Int?

enum CodingKeys: String, CodingKey {
    case slider
    case materials
    case code
}

init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    slider = try values.decodeIfPresent([Slider].self, forKey: .slider)
    materials = try values.decodeIfPresent([Materials].self, forKey: .materials)
    code = try values.decodeIfPresent(Int.self, forKey: .code)
}

}
