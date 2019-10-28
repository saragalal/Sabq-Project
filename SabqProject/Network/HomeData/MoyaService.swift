//
//  MoyaService.swift
//  SabqProject
//
//  Created by sara.galal on 10/20/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import Moya

enum  HomeService {
    case homePage
    case homeVideo
    case homeImage
    case homeArticle
}

extension HomeService: TargetType {
   var baseURL: URL {
//    swiftlint:disable force_unwrapping
    return URL(string: NetworkManager.shared.networkConfig.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .homePage:
            return "/material/homepage-light-version"
        case .homeVideo:
            return "/studio/list-studio"
        case .homeImage:
            return "/studio/list-studio"
        case .homeArticle:
            return "/material/articles"
        }
        
    }
    var method: Moya.Method {
        switch self {
        case .homePage:
            return .get
        case .homeVideo:
            return .get
        case .homeImage:
            return .get
        case .homeArticle:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .homePage:
            return Data()
        case .homeVideo:
            return Data()
        case .homeImage:
            return Data()
        case .homeArticle:
            return Data()
        }
    }
    var task: Task {
        switch self {
        case .homePage:
            return .requestParameters(parameters: ["": ""], encoding: URLEncoding.default)
        case .homeVideo:
           return .requestParameters(parameters: ["type": "video"], encoding: URLEncoding.default)
        case .homeImage:
            return .requestParameters(parameters: ["type": "image"], encoding: URLEncoding.default)
        case .homeArticle:
            return .requestParameters(parameters: ["": ""], encoding: URLEncoding.default)
        }
    }
    var headers: [String: String]? {
    return ["x-api-key": NetworkManager.shared.networkConfig.apiKey]
       }
}
