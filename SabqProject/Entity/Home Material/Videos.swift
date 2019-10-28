//
//  Videos.swift
//  SabqProject
//
//  Created by sara.galal on 10/20/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
struct Videos: Codable {
    let vid: String?
    let caption: String?
    
    enum CodingKeys: String, CodingKey {
        
        case vid
        case caption
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        vid = try values.decodeIfPresent(String.self, forKey: .vid)
        caption = try values.decodeIfPresent(String.self, forKey: .caption)
    }
    
}
