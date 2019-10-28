//
//  HomeSceneModel.swift
//  SabqProject
//
//  Created by sara.galal on 10/16/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation
import Moya
struct HomeSceneModel: HomeSceneModelProtocol {

    func getHomeMaterialData(compelation: @escaping ((Result<HomeMaterialResponse, MoyaError>) -> Void)) {
        NetworkManager.shared.getHomePageMaterial { (result, _) in
            switch result {
            case .success(let response):
                let results = response
                compelation(.success(results))
               
            case .failure(let error):
            print(error)
            compelation(.failure(error))
          }
        }
}
    
    func getHomeVideosData(compelation: @escaping ((Result<HomeImagesVideoResponse, MoyaError>) -> Void)) {
        NetworkManager.shared.getHomePageVideo { (result, _) in
            switch result {
            case .success(let response):
                print(response)
                let results = response
                compelation(.success(results))
            case .failure(let error):
                print(error)
                compelation(.failure(error))
            }
        }
    }
    
    func getHomeImagesData(compelation: @escaping ((Result<HomeImagesVideoResponse, MoyaError>) -> Void)) {
        NetworkManager.shared.getHomePageImages { (result, _) in
            switch result {
            case .success(let response):
                print(response)
                let results = response
                compelation(.success(results))
            case .failure(let error):
                print(error)
                 compelation(.failure(error))
            }
        }
    }
    
    func getHomeArticlesData(compelation: @escaping ((Result<HomeArticlesResponse, MoyaError>) -> Void)) {
        NetworkManager.shared.getHomePageArticles { (result, _) in
            switch result {
            case .success(let response):
                print(response)
                let results = response
                compelation(.success(results))
            case .failure(let error):
                print(error)
                 compelation(.failure(error))
            }
        }
    }
}
