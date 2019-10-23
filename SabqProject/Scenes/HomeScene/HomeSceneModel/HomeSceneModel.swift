//
//  HomeSceneModel.swift
//  SabqProject
//
//  Created by sara.galal on 10/16/19.
//  Copyright © 2019 sara.galal. All rights reserved.
//

import Foundation

struct HomeSceneModel: HomeSceneModelProtocol{

    func getHomeMaterialData(compelation: @escaping ((Result<HomeMaterialResponse, Error>) -> Void)) {
        NetworkManager.shared.getHomePageMaterial { (result, status) in
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
    
    func getHomeVideosData(compelation: @escaping ((Result<HomeImagesVideoResponse, Error>) -> Void)) {
        NetworkManager.shared.getHomePageVideo { (result, status) in
            switch result {
            case .success(let response):
                print(response)
                let results = response
                compelation(.success(results))
                
//                if self.videoResp?.count != 0 {
//                    let obj = Materials(type: "video")
//                    self.results?.materials?.insert(obj, at: 4)
//                    self.homeTableView.reloadData()
//                }
            case .failure(let error):
                print(error)
                compelation(.failure(error))
            }
        }
    }
    
    func getHomeImagesData(compelation: @escaping ((Result<HomeImagesVideoResponse, Error>) -> Void)) {
        NetworkManager.shared.getHomePageImages { (result, status) in
            switch result {
            case .success(let response):
                print(response)
                let results = response
                compelation(.success(results))
//                self.imagesResp = response.comics
//                if self.videoResp?.count != 0 {
//                    let obj = Materials(type: "image")
//                    self.results?.materials?.insert(obj, at: 9)
//                    self.homeTableView.reloadData()
//                }
             case .failure(let error):
                print(error)
                 compelation(.failure(error))
            }
        }
    }
    
    func getHomeArticlesData(compelation: @escaping ((Result<HomeArticlesResponse, Error>) -> Void)) {
        NetworkManager.shared.getHomePageArticles { (result, status) in
            switch result {
            case .success(let response):
                print(response)
                let results = response
                compelation(.success(results))
//                self.articlesResp = response.materials
//                if self.videoResp?.count != 0 {
//                    let obj = Materials(type: "article")
//                    self.results?.materials?.insert(obj, at: 14)
//                    self.homeTableView.reloadData()
//                }
              case .failure(let error):
                print(error)
                 compelation(.failure(error))
            }
        }
    }
}


